export default function buildUserSchema(userSchema: string) {
  return (
    `
      BEGIN;

        INSERT INTO "${userSchema}".fighters (
          "fighterId", "fighter", "rosterId", "displayName",
          "createdAt", "updatedAt"
        )
        SELECT
          "fighterId", "fighter", "rosterId", "displayName",
          NOW(), NOW()
        FROM
          fighters;

        INSERT INTO "${userSchema}".moves (
          "moveId", "fighterId", "name", "moveType", "type", "category",
          "createdAt", "updatedAt"
        )
        SELECT
          "moveId", "fighterId", "name", "moveType", "type", "category",
          NOW(), NOW()
        FROM
          moves;

        INSERT INTO "${userSchema}".hitboxes (
          "moveId", "damage", "activeFrames", "totalFrames",
          "firstFrame", "createdAt", "updatedAt"
        )
        SELECT
          "moveId", "damage", "activeFrames", "totalFrames",
          "firstFrame", NOW(), NOW()
        FROM
          hitboxes;

        INSERT INTO "${userSchema}".throws (
          "throwId", "fighterId", "name", "type",
          "createdAt", "updatedAt"
        )
        SELECT
          "throwId", "fighterId", "name", "type",
          NOW(), NOW()
        FROM
          throws;

        INSERT INTO "${userSchema}".grappling (
          "throwId", "damage", "activeFrames", "totalFrames",
          "createdAt", "updatedAt"
        )
        SELECT
          "throwId", "damage", "activeFrames", "totalFrames",
          NOW(), NOW()
        FROM
          grappling;

        INSERT INTO "${userSchema}".movements (
          "movementId", "fighterId", "name", "type",
          "createdAt", "updatedAt"
        )
        SELECT
          "movementId", "fighterId", "name", "type",
          NOW(), NOW()
        FROM
          movements;

        INSERT INTO "${userSchema}".dodging (
          "movementId", "activeFrames", "totalFrames",
          "createdAt", "updatedAt"
        )
        SELECT
          "movementId", "activeFrames", "totalFrames",
          NOW(), NOW()
        FROM
          dodging;

        INSERT INTO "${userSchema}".stats (
          "statId", "fighterId", "name", "type",
          "createdAt", "updatedAt"
        )
        SELECT
          "statId", "fighterId", "name", "type",
          NOW(), NOW()
        FROM
          stats;

        INSERT INTO "${userSchema}".miscellaneous (
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
