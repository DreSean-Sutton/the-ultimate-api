import { sequelize } from "../conn";

export default async function buildUserSchema(username: string) {

  const Fighters = sequelize.models.fighters;
  const Moves = sequelize.models.moves;
  const Hitboxes = sequelize.models.hitboxes;
  const Throws = sequelize.models.throws;
  const Grappling = sequelize.models.grappling;
  const Movements = sequelize.models.movements;
  const Dodging = sequelize.models.dodging;
  const Stats = sequelize.models.stats;
  const Miscellaneous = sequelize.models.miscellaneous;
  try {
    await sequelize.transaction(async (t: any) => {
      const fighters = await sequelize.query("SELECT * FROM public.fighters");
      for (const fighter of fighters[0]) {
        await Fighters.create({
          fighterId: fighter.fighterId,
          fighter: fighter.fighter,
          rosterId: fighter.rosterId,
          displayName: fighter.displayName,
        }, { transaction: t, schema: username });
      }

      const moves = await sequelize.query("SELECT * FROM public.moves");
      for (const move of moves[0]) {
        await Moves.create({
          moveId: move.moveId,
          fighterId: move.fighterId,
          name: move.name,
          moveType: move.moveType,
          type: move.type,
          category: move.category,
        }, { transaction: t, schema: username });
      }

      const hitboxes = await sequelize.query("SELECT * FROM public.hitboxes");
      for (const hitbox of hitboxes[0]) {
        await Hitboxes.create({
          moveId: hitbox.moveId,
          damage: hitbox.damage,
          activeFrames: hitbox.activeFrames,
          totalFrames: hitbox.totalFrames,
          firstFrame: hitbox.firstFrame,
        }, { transaction: t, schema: username });
      }

      const throws = await sequelize.query("SELECT * FROM public.throws");
      for (const throwObj of throws[0]) {
        await Throws.create({
          throwId: throwObj.throwId,
          fighterId: throwObj.fighterId,
          name: throwObj.name,
          type: throwObj.type,
        }, { transaction: t, schema: username });
      }

      const grappling = await sequelize.query("SELECT * FROM public.grappling");
      for (const grapplingObj of grappling[0]) {
        await Grappling.create({
          throwId: grapplingObj.throwId,
          damage: grapplingObj.damage,
          activeFrames: grapplingObj.activeFrames,
          totalFrames: grapplingObj.totalFrames,
        }, { transaction: t, schema: username });
      }

      const movements = await sequelize.query("SELECT * FROM public.movements");
      for (const movement of movements[0]) {
        await Movements.create({
          movementId: movement.movementId,
          fighterId: movement.fighterId,
          name: movement.name,
          type: movement.type,
        }, { transaction: t, schema: username });
      }

      const dodging = await sequelize.query("SELECT * FROM public.dodging");
      for (const dodgingObj of dodging[0]) {
        await Dodging.create({
          movementId: dodgingObj.movementId,
          activeFrames: dodgingObj.activeFrames,
          totalFrames: dodgingObj.totalFrames,
        }, { transaction: t, schema: username });
      }

      const stats = await sequelize.query("SELECT * FROM public.stats");
      for (const stat of stats[0]) {
        await Stats.create({
          statId: stat.statId,
          fighterId: stat.fighterId,
          name: stat.name,
          type: stat.type,
        }, { transaction: t, schema: username });
      }

      const miscellaneous = await sequelize.query("SELECT * FROM public.miscellaneous");
      for (const misc of miscellaneous[0]) {
        await Miscellaneous.create({
          statId: misc.statId,
          statValue: misc.statValue,
        }, { transaction: t, schema: username });
      }
    });
  } catch (error) {
    console.error(`Error creating schema: ${error}`);
    throw error;
  }
};

// export default function buildUserSchema(username: string) {
//   return (
//     `
//       BEGIN;

//         INSERT INTO "${username}".fighters (
//           "fighterId", "fighter", "rosterId", "displayName",
//           "createdAt", "updatedAt"
//         )
//         SELECT
//           "fighterId", "fighter", "rosterId", "displayName",
//           NOW(), NOW()
//         FROM
//           fighters;

//         INSERT INTO "${username}".moves (
//           "moveId", "fighterId", "name", "moveType", "type", "category",
//           "createdAt", "updatedAt"
//         )
//         SELECT
//           "moveId", "fighterId", "name", "moveType", "type", "category",
//           NOW(), NOW()
//         FROM
//           moves;

//         INSERT INTO "${username}".hitboxes (
//           "moveId", "damage", "activeFrames", "totalFrames",
//           "firstFrame", "createdAt", "updatedAt"
//         )
//         SELECT
//           "moveId", "damage", "activeFrames", "totalFrames",
//           "firstFrame", NOW(), NOW()
//         FROM
//           hitboxes;

//         INSERT INTO "${username}".throws (
//           "throwId", "fighterId", "name", "type",
//           "createdAt", "updatedAt"
//         )
//         SELECT
//           "throwId", "fighterId", "name", "type",
//           NOW(), NOW()
//         FROM
//           throws;

//         INSERT INTO "${username}".grappling (
//           "throwId", "damage", "activeFrames", "totalFrames",
//           "createdAt", "updatedAt"
//         )
//         SELECT
//           "throwId", "damage", "activeFrames", "totalFrames",
//           NOW(), NOW()
//         FROM
//           grappling;

//         INSERT INTO "${username}".movements (
//           "movementId", "fighterId", "name", "type",
//           "createdAt", "updatedAt"
//         )
//         SELECT
//           "movementId", "fighterId", "name", "type",
//           NOW(), NOW()
//         FROM
//           movements;

//         INSERT INTO "${username}".dodging (
//           "movementId", "activeFrames", "totalFrames",
//           "createdAt", "updatedAt"
//         )
//         SELECT
//           "movementId", "activeFrames", "totalFrames",
//           NOW(), NOW()
//         FROM
//           dodging;

//         INSERT INTO "${username}".stats (
//           "statId", "fighterId", "name", "type",
//           "createdAt", "updatedAt"
//         )
//         SELECT
//           "statId", "fighterId", "name", "type",
//           NOW(), NOW()
//         FROM
//           stats;

//         INSERT INTO "${username}".miscellaneous (
//           "statId", "statValue",
//           "createdAt", "updatedAt"
//         )
//         SELECT
//           "statId", "statValue",
//           NOW(), NOW()
//         FROM
//           miscellaneous;
//       END;
//     `
//   )
// }
