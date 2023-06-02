const sqlQueries = {
  getFighters(schemaName: string) {
    return `
      SELECT
        "fighterId", fighter,
        "rosterId", "displayName"
      FROM
        "${schemaName}".fighters
      `;
  },
  getFightersData(type: string, schemaName: string) {
    try {

      if (type === 'moves') {
        return `
          SELECT
            "activeFrames", "category", "damage",
            "displayName", fighter, "fighterId", "moveId",
            "moveType", "name", "rosterId",
            "firstFrame", "totalFrames", "type"
          FROM
            "${schemaName}".moves
          JOIN "${schemaName}"."hitboxes" USING ("moveId")
          JOIN "${schemaName}"."fighters" USING ("fighterId")
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
            "${schemaName}".throws
          JOIN "${schemaName}"."grappling" USING ("throwId")
          JOIN "${schemaName}"."fighters" USING ("fighterId")
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
            "${schemaName}".movements
          JOIN "${schemaName}"."dodging" USING ("movementId")
          JOIN "${schemaName}"."fighters" USING ("fighterId")
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
            "${schemaName}".stats
          JOIN "${schemaName}"."miscellaneous" USING ("statId")
          JOIN "${schemaName}"."fighters" USING ("fighterId")
        `;
      }
      throw new Error('incorrect type parameter');
    } catch(e: any) {
      return {error: e.message};
    }
  }
};

module.exports = sqlQueries;
