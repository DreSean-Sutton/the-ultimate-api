INSERT INTO public.moves AS "pit"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (59, 'jab 1', 'single', 'move'),
    (59, 'jab 2', 'single', 'move'),
    (59, 'jab 3', 'single', 'move'),
    (59, 'rapid jab', 'multi', 'move'),
    (59, 'rapid jab finisher', 'single', 'move'),
    (59, 'forward tilt', '', 'move'),
    (59, 'up tilt', '', 'move'),
    (59, 'down tilt', '', 'move'),
    (59, 'dash attack', '', 'move'),
    (59, 'forward smash', '', 'move'),
    (59, 'up smash', '', 'move'),
    (59, 'down smash', '', 'move'),
    (59, 'neutral air', '', 'move'),
    (59, 'forward air', '', 'move'),
    (59, 'back air', '', 'move'),
    (59, 'up air', '', 'move'),
    (59, 'down air', '', 'move'),
    (59, 'neutral b', '', 'move'),
    (59, 'side b', '', 'move'),
    (59, 'up b', '', 'move'),
    (59, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "pit"
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

INSERT INTO public.throws AS "pit"
  ("fighterId", "name", "type")
  VALUES
    (59, 'grab', 'throw'),
    (59, 'dash grab', 'throw'),
    (59, 'pivot grab', 'throw'),
    (59, 'pummel', 'throw'),
    (59, 'forward throw', 'throw'),
    (59, 'backward throw', 'throw'),
    (59, 'up throw', 'throw'),
    (59, 'down throw', 'throw');

INSERT INTO public.grappling AS "pit"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '6-7', '34'),
    (null, '9-10', '42'),
    (null, '10-11', '37'),
    ('1.3%', '1', '19'),
    ('.0%', '', ''),
    ('.0%', '', ''),
    ('.0%', '', ''),
    ('.0%', '', '');

INSERT INTO public.movements AS "pit"
  ("fighterId", "name", "type")
  VALUES
    (59, 'spot dodge', 'movement'),
    (59, 'forward roll', 'movement'),
    (59, 'backwards roll', 'movement'),
    (59, 'neutral air dodge', 'movement'),
    (59, 'air dodge, down', 'movement'),
    (59, 'air dodge, side + down', 'movement'),
    (59, 'air dodge, left/right', 'movement'),
    (59, 'air dodge, side + up', 'movement'),
    (59, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "pit"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-29', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', '');

INSERT INTO public.stats AS "pit"
  ("fighterId", "name", "type")
  VALUES
    (59, 'weight', 'stat'),
    (59, 'gravity', 'stat'),
    (59, 'walk speed', 'stat'),
    (59, 'run speed', 'stat'),
    (59, 'initial dash', 'stat'),
    (59, 'air speed', 'stat'),
    (59, 'total air acceleration', 'stat'),
    (59, 'sh / fh / shff / fhff', 'stat'),
    (59, 'fall speed/fast fall speed', 'stat'),
    (59, 'out of shield, ', 'stat'),
    (59, 'out of shield, ', 'stat'),
    (59, 'out of shield, ', 'stat'),
    (59, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "pit"
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
