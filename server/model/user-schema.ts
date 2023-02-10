const Sequelize = require('sequelize');

const sequelize = new Sequelize(process.env.DATABASE_URL);

const Fighters = sequelize.define('Fighters', {
  fighterId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  fighter: {
    type: Sequelize.TEXT,
    allowNull: false,
    unique: true
  },
  rosterId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    unique: true
  },
  displayName: {
    type: Sequelize.TEXT,
    allowNull: false,
    unique: true
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  }
});

module.exports = {
  Fighters
}
