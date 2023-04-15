function defineUserDb(sequelize: any, schemaName: string) {

  const Fighters = sequelize.define('fighters', {
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
  }, {
    schema: schemaName
  });

  const Moves = sequelize.define('moves', {
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
  }, {
    schema: schemaName
  });

  const Hitboxes = sequelize.define('hitboxes', {
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
      type: Sequelize.TEXT
    },
    createdAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW
    }
  }, {
    schema: schemaName
  });

  const Throws = sequelize.define('throws', {
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
  }, {
    schema: schemaName
  });

  const Grappling = sequelize.define('grappling', {
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
  }, {
    schema: schemaName
  });

  const Movements = sequelize.define('movements', {
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
  }, {
    schema: schemaName
  });

  const Dodging = sequelize.define('dodging', {
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
  }, {
    schema: schemaName
  });

  const Stats = sequelize.define('stats', {
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
  }, {
    schema: schemaName
  });

  const Miscellaneous = sequelize.define('miscellaneous', {
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
  }, {
    schema: schemaName
  });

  return { Fighters, Moves, Hitboxes, Throws, Grappling, Movements, Dodging, Stats, Miscellaneous };
}

module.exports = defineUserDb;
