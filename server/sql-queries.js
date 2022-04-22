const sqlQueries = {
  getFighters() {
    return `
      SELECT
        "fighterId", fighter,
        "rosterId", "displayName"
      FROM
        fighters
      `
  },
  getFightersData(type) {
    if (type === 'moves') {
      return `
        SELECT
          "activeFrames", "damage", "displayName",
          fighter, "fighterId", "moveType",
          "name", "rosterId",
          "totalFrames", "type"
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
          "totalFrames", "type"
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
          "name", "rosterId",
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
          "statValue", "type"
        FROM
          fighters
        JOIN "stats" USING ("fighterId")
        JOIN "miscellaneous" USING ("statId")
      `;
    }
  }
}

  module.exports = sqlQueries
