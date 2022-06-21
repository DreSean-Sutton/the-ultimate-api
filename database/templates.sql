INSERT INTO public.moves AS "minmin"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (48, 'jab 1', 'single', 'move'),
    (48, 'jab 2', 'single', 'move'),
    (48, 'jab 3', 'single', 'move'),
    (48, 'rapid jab', 'multi', 'move'),
    (48, 'rapid jab finisher', 'single', 'move'),
    (48, 'forward tilt', '', 'move'),
    (48, 'up tilt', '', 'move'),
    (48, 'down tilt', '', 'move'),
    (48, 'dash attack', '', 'move'),
    (48, 'forward smash', '', 'move'),
    (48, 'up smash', '', 'move'),
    (48, 'down smash', '', 'move'),
    (48, 'neutral air', '', 'move'),
    (48, 'forward air', '', 'move'),
    (48, 'back air', '', 'move'),
    (48, 'up air', '', 'move'),
    (48, 'down air', '', 'move'),
    (48, 'neutral b', '', 'move'),
    (48, 'side b', '', 'move'),
    (48, 'up b', '', 'move'),
    (48, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "minmin"
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

INSERT INTO public.throws AS "minmin"
  ("fighterId", "name", "type")
  VALUES
    (48, 'grab', 'throw'),
    (48, 'dash grab', 'throw'),
    (48, 'pivot grab', 'throw'),
    (48, 'pummel', 'throw'),
    (48, 'forward throw', 'throw'),
    (48, 'backward throw', 'throw'),
    (48, 'up throw', 'throw'),
    (48, 'down throw', 'throw');

INSERT INTO public.grappling AS "minmin"
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

INSERT INTO public.movements AS "minmin"
  ("fighterId", "name", "type")
  VALUES
    (48, 'spot dodge', 'movement'),
    (48, 'forward roll', 'movement'),
    (48, 'backwards roll', 'movement'),
    (48, 'neutral air dodge', 'movement'),
    (48, 'air dodge, down', 'movement'),
    (48, 'air dodge, side + down', 'movement'),
    (48, 'air dodge, left/right', 'movement'),
    (48, 'air dodge, side + up', 'movement'),
    (48, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "minmin"
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

INSERT INTO public.stats AS "minmin"
  ("fighterId", "name", "type")
  VALUES
    (48, 'weight', 'stat'),
    (48, 'gravity', 'stat'),
    (48, 'walk speed', 'stat'),
    (48, 'run speed', 'stat'),
    (48, 'initial dash', 'stat'),
    (48, 'air speed', 'stat'),
    (48, 'total air acceleration', 'stat'),
    (48, 'sh / fh / shff / fhff', 'stat'),
    (48, 'fall speed/fast fall speed', 'stat'),
    (48, 'out of shield, ', 'stat'),
    (48, 'out of shield, ', 'stat'),
    (48, 'out of shield, ', 'stat'),
    (48, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "minmin"
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
