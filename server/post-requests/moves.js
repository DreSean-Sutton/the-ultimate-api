const moves = {
  movesPost() {
    return `
      INSERT INTO
        "fighterid", "name",
        "moveType", "type"
    `;
  }
  hitboxesPost() {
    return `
      INSERT INTO
        "damage", "activeFrames",
        "totalFrames"
    `;
  }
}

module.export = moves
