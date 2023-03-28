export default function buildUserSchema(username: string) {
  return (
    `
      BEGIN;

        INSERT INTO "${username}".fighters (
          "fighterId", "fighter", "rosterId", "displayName"
        )
        SELECT
          "fighterId", "fighter", "rosterId", "displayName"
        FROM
          fighters;

        INSERT INTO "${username}".moves (
          "moveId", "fighterId", "name", "moveType", "type", "category"
        )
        SELECT
          "moveId", "fighterId", "name", "moveType", "type", "category"
        FROM
          moves;

        INSERT INTO "${username}".hitboxes (
          "moveId", "damage", "activeFrames", "totalFrames",
          "firstFrame"
        )
        SELECT
          "moveId", "damage", "activeFrames", "totalFrames",
          "firstFrame"
        FROM
          hitboxes;

        INSERT INTO "${username}".throws (
          "throwId", "fighterId", "name", "type"
        )
        SELECT
          "throwId", "fighterId", "name", "type"
        FROM
          throws;

        INSERT INTO "${username}".grappling (
          "throwId", "damage", "activeFrames", "totalFrames"
        )
        SELECT
          "throwId", "damage", "activeFrames", "totalFrames"
        FROM
          grappling;

        INSERT INTO "${username}".movements (
          "movementId", "fighterId", "name", "type"
        )
        SELECT
          "movementId", "fighterId", "name", "type"
        FROM
          movements;

        INSERT INTO "${username}".dodging (
          "movementId", "activeFrames", "totalFrames"
        )
        SELECT
          "movementId", "activeFrames", "totalFrames"
        FROM
          dodging;

        INSERT INTO "${username}".stats (
          "statId", "fighterId", "name", "type"
        )
        SELECT
          "statId", "fighterId", "name", "type"
        FROM
          stats;

        INSERT INTO "${username}".miscellaneous (
          "statId", "statValue"
        )
        SELECT
          "statId", "statValue"
        FROM
          miscellaneous;
      END;
    `
  )
}
