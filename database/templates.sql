INSERT INTO public.moves AS "megaMan"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (42, 'jab 1', 'single', 'move'),
    (42, 'jab 2', 'single', 'move'),
    (42, 'jab 3', 'single', 'move'),
    (42, 'rapid jab', 'multi', 'move'),
    (42, 'rapid jab finisher', 'single', 'move'),
    (42, 'forward tilt', '', 'move'),
    (42, 'up tilt', '', 'move'),
    (42, 'down tilt', '', 'move'),
    (42, 'dash attack', '', 'move'),
    (42, 'forward smash', '', 'move'),
    (42, 'up smash', '', 'move'),
    (42, 'down smash', '', 'move'),
    (42, 'neutral air', '', 'move'),
    (42, 'forward air', '', 'move'),
    (42, 'back air', '', 'move'),
    (42, 'up air', '', 'move'),
    (42, 'down air', '', 'move'),
    (42, 'neutral b', '', 'move'),
    (42, 'side b', '', 'move'),
    (42, 'up b', '', 'move'),
    (42, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "megaMan"
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

INSERT INTO public.throws AS "megaMan"
  ("fighterId", "name", "type")
  VALUES
    (42, 'grab', 'throw'),
    (42, 'dash grab', 'throw'),
    (42, 'pivot grab', 'throw'),
    (42, 'pummel', 'throw'),
    (42, 'forward throw', 'throw'),
    (42, 'backward throw', 'throw'),
    (42, 'up throw', 'throw'),
    (42, 'down throw', 'throw');

INSERT INTO public.grappling AS "megaMan"
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

INSERT INTO public.movements AS "megaMan"
  ("fighterId", "name", "type")
  VALUES
    (42, 'spot dodge', 'movement'),
    (42, 'forward roll', 'movement'),
    (42, 'backwards roll', 'movement'),
    (42, 'neutral air dodge', 'movement'),
    (42, 'air dodge, down', 'movement'),
    (42, 'air dodge, side + down', 'movement'),
    (42, 'air dodge, left/right', 'movement'),
    (42, 'air dodge, side + up', 'movement'),
    (42, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "megaMan"
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

INSERT INTO public.stats AS "megaMan"
  ("fighterId", "name", "type")
  VALUES
    (42, 'weight', 'stat'),
    (42, 'gravity', 'stat'),
    (42, 'walk speed', 'stat'),
    (42, 'run speed', 'stat'),
    (42, 'initial dash', 'stat'),
    (42, 'air speed', 'stat'),
    (42, 'total air acceleration', 'stat'),
    (42, 'sh / fh / shff / fhff', 'stat'),
    (42, 'fall speed/fast fall speed', 'stat'),
    (42, 'out of shield, ', 'stat'),
    (42, 'out of shield, ', 'stat'),
    (42, 'out of shield, ', 'stat'),
    (42, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "megaMan"
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
