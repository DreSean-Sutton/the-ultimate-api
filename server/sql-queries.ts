const sqlQueries = {
  getFighters() {
    return `
      SELECT
        "fighterId", fighter,
        "rosterId", "displayName"
      FROM
        fighters
      `;
  },
  getFightersData(type: string) {
    if (type === 'moves') {
      return `
        SELECT
          "activeFrames", "category", "damage",
          "displayName", fighter, "fighterId", "moveId",
          "moveType", "name", "rosterId",
          "firstFrame", "totalFrames", "type"
        FROM
          fighters
        JOIN "moves" USING ("fighterId")
        JOIN "hitboxes" USING ("moveId")
      `;
    }
    if (type === 'throws') {
      return `
        SELECT
          "activeFrames", "damage", "displayName",
          fighter, "fighterId",
          "name", "rosterId",
          "totalFrames", "throwId", "type"
        FROM
          fighters
        JOIN "throws" USING ("fighterId")
        JOIN "grappling" USING ("throwId")
      `;
    }
    if (type === 'movements') {
      return `
        SELECT
          "activeFrames", "displayName",
          fighter, "fighterId",
          "movementId", "name", "rosterId",
          "totalFrames", "type"
        FROM
          fighters
        JOIN "movements" USING ("fighterId")
        JOIN "dodging" USING ("movementId")
      `;
    }
    if (type === 'stats') {
      return `
        SELECT
          "displayName",
          fighter, "fighterId",
          "name", "rosterId",
          "statId", "statValue", "type"
        FROM
          fighters
        JOIN "stats" USING ("fighterId")
        JOIN "miscellaneous" USING ("statId")
      `;
    }
  }
};

module.exports = sqlQueries;
