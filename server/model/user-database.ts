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

const Moves = sequelize.define('Moves', {
  moveId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  fighterId: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  name: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  moveType: {
    type: Sequelize.TEXT
  },
  type: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  category: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  }
});

const Hitboxes = sequelize.define('Hitboxes', {
  moveId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  damage: {
    type: Sequelize.TEXT,
  },
  activeFrames: {
    type: Sequelize.TEXT
  },
  totalFrames: {
    type: Sequelize.TEXT
  },
  firstFrame: {
    type : Sequelize.TEXT
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  }
});

const Throws = sequelize.define('Throws', {
  throwId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  fighterId: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  name: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  type: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  }
});

const Grappling = sequelize.define('Grappling', {
  throwId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  damage: {
    type: Sequelize.TEXT,
  },
  activeFrames: {
    type: Sequelize.TEXT
  },
  totalFrames: {
    type: Sequelize.TEXT
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  }
});

const Movements = sequelize.define('Movements', {
  movementId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  fighterId: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  name: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  type: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  }
});

const Dodging = sequelize.define('Dodging', {
  movementId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  activeFrames: {
    type: Sequelize.TEXT
  },
  totalFrames: {
    type: Sequelize.TEXT
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  }
});

const Stats = sequelize.define('Stats', {
  statId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  fighterId: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  name: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  type: {
    type: Sequelize.TEXT,
    allowNull: false
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  }
});

const Miscellaneous = sequelize.define('Miscellaneous', {
  statId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  statValue: {
    type: Sequelize.TEXT,
  },
  createdAt: {
    type: Sequelize.DATE,
    defaultValue: Sequelize.NOW
  }
});

module.exports = {
  Fighters,
  Moves,
  Hitboxes,
  Throws,
  Grappling,
  Movements,
  Dodging,
  Stats,
  Miscellaneous
}
