INSERT INTO public.moves AS "miiSwordfighter"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (47, 'jab 1', 'single', 'move'),
    (47, 'jab 2', 'single', 'move'),
    (47, 'jab 3', 'single', 'move'),
    (47, 'rapid jab', 'multi', 'move'),
    (47, 'rapid jab finisher', 'single', 'move'),
    (47, 'forward tilt', '', 'move'),
    (47, 'up tilt', '', 'move'),
    (47, 'down tilt', '', 'move'),
    (47, 'dash attack', '', 'move'),
    (47, 'forward smash', '', 'move'),
    (47, 'up smash', '', 'move'),
    (47, 'down smash', '', 'move'),
    (47, 'neutral air', '', 'move'),
    (47, 'forward air', '', 'move'),
    (47, 'back air', '', 'move'),
    (47, 'up air', '', 'move'),
    (47, 'down air', '', 'move'),
    (47, 'neutral b', '', 'move'),
    (47, 'side b', '', 'move'),
    (47, 'up b', '', 'move'),
    (47, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "miiSwordfighter"
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

INSERT INTO public.throws AS "miiSwordfighter"
  ("fighterId", "name", "type")
  VALUES
    (47, 'grab', 'throw'),
    (47, 'dash grab', 'throw'),
    (47, 'pivot grab', 'throw'),
    (47, 'pummel', 'throw'),
    (47, 'forward throw', 'throw'),
    (47, 'backward throw', 'throw'),
    (47, 'up throw', 'throw'),
    (47, 'down throw', 'throw');

INSERT INTO public.grappling AS "miiSwordfighter"
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

INSERT INTO public.movements AS "miiSwordfighter"
  ("fighterId", "name", "type")
  VALUES
    (47, 'spot dodge', 'movement'),
    (47, 'forward roll', 'movement'),
    (47, 'backwards roll', 'movement'),
    (47, 'neutral air dodge', 'movement'),
    (47, 'air dodge, down', 'movement'),
    (47, 'air dodge, side + down', 'movement'),
    (47, 'air dodge, left/right', 'movement'),
    (47, 'air dodge, side + up', 'movement'),
    (47, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "miiSwordfighter"
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

INSERT INTO public.stats AS "miiSwordfighter"
  ("fighterId", "name", "type")
  VALUES
    (47, 'weight', 'stat'),
    (47, 'gravity', 'stat'),
    (47, 'walk speed', 'stat'),
    (47, 'run speed', 'stat'),
    (47, 'initial dash', 'stat'),
    (47, 'air speed', 'stat'),
    (47, 'total air acceleration', 'stat'),
    (47, 'sh / fh / shff / fhff', 'stat'),
    (47, 'fall speed/fast fall speed', 'stat'),
    (47, 'out of shield, ', 'stat'),
    (47, 'out of shield, ', 'stat'),
    (47, 'out of shield, ', 'stat'),
    (47, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "miiSwordfighter"
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
