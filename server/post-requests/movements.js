const movements = {
  movementsPost() {
    return `
      INSERT INTO
        "fighterId", "name",
        "type"
    `;
  }
  dodgingPost() {
    return `
      INSERT INTO
        "activeFrames", "totalFrames"
    `;
  }
}

module.export = movements
