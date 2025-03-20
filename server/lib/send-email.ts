const nodemailer = require('nodemailer');

export default async function sendEmail( recipientEmail: string, subject: string, message: string) {

  const transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
      user: `${process.env.EMAIL_USER}`,
      pass: process.env.EMAIL_PASSWORD,
    }
  });

  const emailOptions = {
    from:`noreply.${process.env.EMAIL_USER}`,
    to: recipientEmail,
    subject: subject,
    html: message
  }

  return new Promise((resolve, reject) => {

    transporter.sendMail(emailOptions, (err: any, info: any) => {
      if(err) {
        console.error("Error sending email: ", err);
        reject(err);
      }
      console.log("Sent email: ", info.response);
      resolve(info);
    });
  });
};
