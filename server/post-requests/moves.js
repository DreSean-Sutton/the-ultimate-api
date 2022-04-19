const moves = {
  movesPost() {
    return `
      INSERT INTO public.moves
        "fighterid", "name",
        "moveType", "type"
    `;
  }
  hitboxesPost() {
    return `
      INSERT INTO public.hitboxes
        "damage", "activeFrames",
        "totalFrames"
    `;
  }
}

module.export = moves
