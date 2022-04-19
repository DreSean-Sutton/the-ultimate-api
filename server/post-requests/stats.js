const stats = {
  statsPost() {
    return `
      INSERT INTO
        "fighterId", "name",
        "type"
    `
  }
  miscellaneousPost() {
    return `
      INSERT INTO
        "statValue"
    `
  }
}

module.export = stats
