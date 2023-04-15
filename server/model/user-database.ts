require('dotenv/config');
const Sequelize = require('sequelize');
const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USERNAME, process.env.DB_PASSWORD, {
  host: 'localhost',
  dialect: 'postgres'
});

const User = sequelize.define('user', {
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
  }
},
{
  schema: 'user'
});



module.exports = {
  User,
  sequelize,
  // Fighters,
  // Moves,
  // Hitboxes,
  // Throws,
  // Grappling,
  // Movements,
  // Dodging,
  // Stats,
  // Miscellaneous,
}
