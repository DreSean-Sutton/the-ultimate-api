export default function buildUserSchema(username: string) {
  return (
    `
      BEGIN;

        INSERT INTO "${username}".fighters (
          "fighterId", "fighter", "rosterId", "displayName",
          "createdAt", "updatedAt"
        )
        SELECT
          "fighterId", "fighter", "rosterId", "displayName",
          NOW(), NOW()
        FROM
          fighters;

        INSERT INTO "${username}".moves (
          "moveId", "fighterId", "name", "moveType", "type", "category",
          "createdAt", "updatedAt"
        )
        SELECT
          "moveId", "fighterId", "name", "moveType", "type", "category",
          NOW(), NOW()
        FROM
          moves;

        INSERT INTO "${username}".hitboxes (
          "moveId", "damage", "activeFrames", "totalFrames",
          "firstFrame", "createdAt", "updatedAt"
        )
        SELECT
          "moveId", "damage", "activeFrames", "totalFrames",
          "firstFrame", NOW(), NOW()
        FROM
          hitboxes;

        INSERT INTO "${username}".throws (
          "throwId", "fighterId", "name", "type",
          "createdAt", "updatedAt"
        )
        SELECT
          "throwId", "fighterId", "name", "type",
          NOW(), NOW()
        FROM
          throws;

        INSERT INTO "${username}".grappling (
          "throwId", "damage", "activeFrames", "totalFrames",
          "createdAt", "updatedAt"
        )
        SELECT
          "throwId", "damage", "activeFrames", "totalFrames",
          NOW(), NOW()
        FROM
          grappling;

        INSERT INTO "${username}".movements (
          "movementId", "fighterId", "name", "type",
          "createdAt", "updatedAt"
        )
        SELECT
          "movementId", "fighterId", "name", "type",
          NOW(), NOW()
        FROM
          movements;

        INSERT INTO "${username}".dodging (
          "movementId", "activeFrames", "totalFrames",
          "createdAt", "updatedAt"
        )
        SELECT
          "movementId", "activeFrames", "totalFrames",
          NOW(), NOW()
        FROM
          dodging;

        INSERT INTO "${username}".stats (
          "statId", "fighterId", "name", "type",
          "createdAt", "updatedAt"
        )
        SELECT
          "statId", "fighterId", "name", "type",
          NOW(), NOW()
        FROM
          stats;

        INSERT INTO "${username}".miscellaneous (
          "statId", "statValue",
          "createdAt", "updatedAt"
        )
        SELECT
          "statId", "statValue",
          NOW(), NOW()
        FROM
          miscellaneous;
      END;
    `
  )
}
