const stats = {
  statsPost() {
    return `
      INSERT INTO public.stats
        "fighterId", "name",
        "type"
    `;
  }
  miscellaneousPost() {
    return `
      INSERT INTO public.miscellaneous
        "statValue"
    `;
  }
}

module.export = stats
