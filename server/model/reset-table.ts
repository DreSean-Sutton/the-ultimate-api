import { sequelize } from '../conn';
import { User } from './user-table';
const Sequelize = require('sequelize');

export const Reset = sequelize.define('Reset', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  token: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  tokenExpiration: {
    type: Sequelize.DATE,
    allowNull: false,
  }
},
{
  schema: 'reset'
});

User.hasOne(Reset, { foreignKey: 'id', onDelete: 'CASCADE' });
Reset.belongsTo(User, { foreignKey: 'id' });
