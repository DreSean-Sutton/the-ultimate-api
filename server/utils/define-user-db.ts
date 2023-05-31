const Sequelize = require('sequelize');
const { sequelize } = require('../conn');
/**
 * Dynamically builds unique models
 * Uses the user's information to connect each model to their personal schema
 *
 * @param sequelize
 * @param schemaName
 * @returns { Fighters, Moves, Hitboxes, Throws, Grappling, Movements, Dodging, Stats, Miscellaneous }
 */

export default function defineUserDb(schemaName: string) {

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
      defaultValue: Sequelize.NOW,
    },
    updatedAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
      allowNull: true
    }
  }, {
    schema: schemaName,
    freezeTableName: true,
    options: {
      postgresql: {
        inherits: 'fighters INCLUDING ALL'
      }
    }
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
      defaultValue: Sequelize.NOW,
    },
    updatedAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
      allowNull: true
    }
  }, {
    schema: schemaName,
    freezeTableName: true,
    options: {
      postgresql: {
        inherits: 'moves INCLUDING ALL'
      }
    }
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
      defaultValue: Sequelize.NOW,
    },
    updatedAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
      allowNull: true
    }
  }, {
    schema: schemaName,
    freezeTableName: true,
    options: {
      postgresql: {
        inherits: 'hitboxes INCLUDING ALL'
      }
    }
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
      defaultValue: Sequelize.NOW,
    },
    updatedAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
      allowNull: true
    }
  }, {
    schema: schemaName,
    freezeTableName: true,
    options: {
      postgresql: {
        inherits: 'throws INCLUDING ALL'
      }
    }
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
      defaultValue: Sequelize.NOW,
    },
    updatedAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
      allowNull: true
    }
  }, {
    schema: schemaName,
    freezeTableName: true,
    options: {
      postgresql: {
        inherits: 'grappling INCLUDING ALL'
      }
    }
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
      defaultValue: Sequelize.NOW,
    },
    updatedAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
      allowNull: true
    }
  }, {
    schema: schemaName,
    freezeTableName: true,
    options: {
      postgresql: {
        inherits: 'movements INCLUDING ALL'
      }
    }
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
      defaultValue: Sequelize.NOW,
    },
    updatedAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
      allowNull: true
    }
  }, {
    schema: schemaName,
    freezeTableName: true,
    options: {
      postgresql: {
        inherits: 'dodging INCLUDING ALL'
      }
    }
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
      defaultValue: Sequelize.NOW,
    },
    updatedAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
      allowNull: true
    }
  }, {
    schema: schemaName,
    freezeTableName: true,
    options: {
      postgresql: {
        inherits: 'stats INCLUDING ALL'
      }
    }
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
      defaultValue: Sequelize.NOW,
    },
    updatedAt: {
      type: Sequelize.DATE,
      defaultValue: Sequelize.NOW,
      allowNull: true
    }
  }, {
    schema: schemaName,
    freezeTableName: true,
    options: {
      postgresql: {
        inherits: 'miscellaneous INCLUDING ALL'
      }
    }
  });

  Fighters.hasMany(Moves, { foreignKey: 'fighterId' });
  Moves.belongsTo(Fighters, { foreignKey: 'fighterId' })
  Moves.hasMany(Hitboxes, { foreignKey: 'moveId' });
  Hitboxes.belongsTo(Moves, { foreignKey: 'moveId' });
  Throws.hasMany(Grappling, { foreignKey: 'throwId' });
  Grappling.belongsTo(Throws, { foreignKey: 'throwId' });
  Movements.hasMany(Dodging, { foreignKey: 'movementId' });
  Dodging.belongsTo(Movements, { foreignKey: 'movementId' });
  Stats.hasMany(Miscellaneous, { foreignKey: 'statId' });
  Miscellaneous.belongsTo(Stats, { foreignKey: 'statId' });

  return { Fighters, Moves, Hitboxes, Throws, Grappling, Movements, Dodging, Stats, Miscellaneous };
}
