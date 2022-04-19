const fighters = {
  post() {
    return `
      INSERT INTO
        "fighter", "rosterId",
        "displayName"
    `;
  }
}

module.exports = fighters
