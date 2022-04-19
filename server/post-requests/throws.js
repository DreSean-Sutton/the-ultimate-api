const throws = {
  throwsPost() {
    return `
      INSERT INTO
        "fighterId", "name",
        "type"
    `;
  }
  grapplingPost() {
    return `

    INSERT INTO
      "damage", "activeFrames",
      "totalFrames"
    `;
  }
}

module.export = throws
