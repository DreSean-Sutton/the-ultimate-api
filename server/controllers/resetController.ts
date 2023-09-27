import { Req, Res } from "../utils/types-routes";
import ClientError from "../utils/client-error";
import { client } from '../conn';
import { Op } from "sequelize";
import sendEmail from "../lib/send-email";
import generateRandomString from "../lib/generate-random-string";
require('dotenv/config');
const jwt = require('jsonwebtoken');
const { sequelize } = require('../conn');
const { User } = require('../model/user-table');
const { Reset } = require('../model/reset-table');
const { authorizeUser } = require('../lib/authorizeUser');

async function getResetToken(req: Req, res: Res, next: any) {
  const { email } = req.body;

  try {
    const user = await User.findOne({ where: { email: email }, include: [{ model: Reset }] });
    if (!user) throw new ClientError(404, "Email not found");

    const randomString = generateRandomString(16);
    const emailMessage = `
      <div style='color: black !important;'>
        <p>Hello ${user.username}!</p>
        <p>
          Use the below token with the
          <a style="pointer-events: none; text-decoration: none;">
            "https://the-ultimate-api.dreseansutton.com/api/reset/YOUR_TOKEN_HERE"
          </a>
          route to reset your desired information:
        </p>
        <p style="font-weight: bold;">${randomString}</p>
        <p style="font-weight: bold;">This code expires in 10 minutes.</p>
      </div>
    `
    const minutes = 10;
    const expiration = Math.floor(Date.now() / 1000) + 60 * minutes;

    const [reset] = await Reset.upsert({
      id: user.id,
      token: randomString,
      tokenExpiration: new Date(expiration * 1000),
    }, { where: { id: user.id }});

    const emailResult = await sendEmail(email, 'Information Reset Token', emailMessage);
    return res.status(200).json({ message: `Email successfully sent to your email address (${email}).` });

  } catch (e: any) {
    console.error('Error creating reset token: ', e);
    next(e);
  }
}
async function changeInformation(req: Req, res: Res, next: any) {
  const { email, username, password, resetToken } = req.body;
  try {
    if (!resetToken) throw new ClientError(401, "Reset token must be provided");
    const findResult = await Reset.findOne({ where: { token: resetToken }, include: [{ model: User }] });
    if (!findResult) throw new ClientError(404, "Reset token not found");
    if (Date.now() >= findResult.tokenExpiration.getTime()) throw new ClientError(410, "reset token has expired.");

    await sequelize.transaction(async (t: any) => {
      const userUpdate = await User.update({
        email: email || findResult.user.email,
        username: username || findResult.user.username,
        password: password || findResult.user.password
      }, { where: { id: findResult.id }, transaction: t });
      if (userUpdate[0] === 0) throw new ClientError(401, "No information changed. New information must be different from old information.");

      await Reset.destroy({
        where: { id: findResult.id }, transaction: t });
      return res.status(200).json({ message: "Information has successfully been changed." });
    })

  } catch(e) {
    console.error(e);
    next(e);
  }
}

module.exports = {
  getResetToken,
  changeInformation,
}
