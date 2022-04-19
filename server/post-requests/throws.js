const throws = {
  throwsPost() {
    return `
      INSERT INTO public.throws
        "fighterId", "name",
        "type"
    `;
  }
  grapplingPost() {
    return `
      INSERT INTO public.grappling
        "damage", "activeFrames",
        "totalFrames"
    `;
  }
}

module.export = throws
