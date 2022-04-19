const fighters = {
  post() {
    return `
      INSERT INTO public.fighters
        ("fighter", "rosterId",
        "displayName")
    `;
  }
}

module.exports = fighters
