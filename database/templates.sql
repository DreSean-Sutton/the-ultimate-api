INSERT INTO public.moves AS "metaKnight"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (43, 'jab 1', 'single', 'move'),
    (43, 'jab 2', 'single', 'move'),
    (43, 'jab 3', 'single', 'move'),
    (43, 'rapid jab', 'multi', 'move'),
    (43, 'rapid jab finisher', 'single', 'move'),
    (43, 'forward tilt', '', 'move'),
    (43, 'up tilt', '', 'move'),
    (43, 'down tilt', '', 'move'),
    (43, 'dash attack', '', 'move'),
    (43, 'forward smash', '', 'move'),
    (43, 'up smash', '', 'move'),
    (43, 'down smash', '', 'move'),
    (43, 'neutral air', '', 'move'),
    (43, 'forward air', '', 'move'),
    (43, 'back air', '', 'move'),
    (43, 'up air', '', 'move'),
    (43, 'down air', '', 'move'),
    (43, 'neutral b', '', 'move'),
    (43, 'side b', '', 'move'),
    (43, 'up b', '', 'move'),
    (43, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "metaKnight"
  ("damage", "activeFrames", "totalFrames", "firstFrame")
  VALUES
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('0.%', '', null, ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', ''),
    ('.0%', '', '', '');

INSERT INTO public.throws AS "metaKnight"
  ("fighterId", "name", "type")
  VALUES
    (43, 'grab', 'throw'),
    (43, 'dash grab', 'throw'),
    (43, 'pivot grab', 'throw'),
    (43, 'pummel', 'throw'),
    (43, 'forward throw', 'throw'),
    (43, 'backward throw', 'throw'),
    (43, 'up throw', 'throw'),
    (43, 'down throw', 'throw');

INSERT INTO public.grappling AS "metaKnight"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '', ''),
    (null, '', ''),
    (null, '', ''),
    ('1.%', '1', ''),
    ('.0%', '', ''),
    ('.0%', '', ''),
    ('.0%', '', ''),
    ('.0%', '', '');

INSERT INTO public.movements AS "metaKnight"
  ("fighterId", "name", "type")
  VALUES
    (43, 'spot dodge', 'movement'),
    (43, 'forward roll', 'movement'),
    (43, 'backwards roll', 'movement'),
    (43, 'neutral air dodge', 'movement'),
    (43, 'air dodge, down', 'movement'),
    (43, 'air dodge, side + down', 'movement'),
    (43, 'air dodge, left/right', 'movement'),
    (43, 'air dodge, side + up', 'movement'),
    (43, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "metaKnight"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', ''),
    ('5-16', ''),
    ('3-29', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', '');

INSERT INTO public.stats AS "metaKnight"
  ("fighterId", "name", "type")
  VALUES
    (43, 'weight', 'stat'),
    (43, 'gravity', 'stat'),
    (43, 'walk speed', 'stat'),
    (43, 'run speed', 'stat'),
    (43, 'initial dash', 'stat'),
    (43, 'air speed', 'stat'),
    (43, 'total air acceleration', 'stat'),
    (43, 'sh / fh / shff / fhff', 'stat'),
    (43, 'fall speed/fast fall speed', 'stat'),
    (43, 'out of shield, ', 'stat'),
    (43, 'out of shield, ', 'stat'),
    (43, 'out of shield, ', 'stat'),
    (43, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "metaKnight"
  ("statValue")
  VALUES
    (''),
    (''),
    (''),
    (''),
    (''),
    (''),
    (''),
    (''),
    (''),
    (' frames'),
    (' frames'),
    (' frames'),
    (' frames');
