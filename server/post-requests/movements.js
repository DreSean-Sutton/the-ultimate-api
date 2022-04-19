const movements = {
  movementsPost() {
    return `
      INSERT INTO public.movements
        "fighterId", "name",
        "type"
    `;
  },
  dodgingPost() {
    return `
      INSERT INTO public.dodging
        "activeFrames", "totalFrames"
    `;
  }
}

module.exports = movements
