import { sequelize } from '../conn';
import { Reset } from './reset-table';
const Sequelize = require('sequelize');

export const User = sequelize.define('user', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  email: {
    type: Sequelize.STRING,
    unique: true,
    allowNull: false
  },
  username: {
    type: Sequelize.STRING,
    unique: true,
    allowNull: false
  },
  password: {
    type: Sequelize.STRING,
    allowNull: false
  },
  userDB: {
    type: Sequelize.STRING,
    unique: true,
    allowNull: false
  },
  rowCount: {
    type: Sequelize.INTEGER,
    defaultValue: 0
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  },
  token: {
    type: Sequelize.STRING,
    allowNull: true
  },
  tokenExpiration: {
    type: Sequelize.DATE,
    allowNull: true
  },
  updatedAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW,
    allowNull: true
  }
},
{
  schema: 'user'
});
