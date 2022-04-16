const sqlQueries = {
  getFighters() {
    return `
    SELECT
      "fighterId", fighter,
      "rosterId", "displayName"
    FROM
      fighters`
  },
  getFightersData() {
    return `
    SELECT
      "activeFrames", "damage", "displayName",
      fighter, "fighterId", "moveType",
      "name", "rosterId",
      "totalFrames"
    FROM
      fighters
    JOIN "moves" USING ("fighterId")
    JOIN "hitboxes" USING ("moveId")
    `
  }
}

module.exports = sqlQueries
