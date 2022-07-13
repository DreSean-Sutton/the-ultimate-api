INSERT INTO public.moves AS "ridley"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (65, 'jab 1', 'single', 'move', 'ground'),
    (65, 'jab 2', 'single', 'move', 'ground'),
    (65, 'jab 3', 'single', 'move', 'ground'),
    (65, 'rapid jab', 'multi', 'move', 'ground'),
    (65, 'rapid jab finisher', 'single', 'move', 'ground'),
    (65, 'forward tilt', '', 'move', 'ground'),
    (65, 'up tilt', '', 'move', 'ground'),
    (65, 'down tilt', '', 'move', 'ground'),
    (65, 'dash attack', '', 'move', 'ground'),
    (65, 'forward smash', '', 'move', 'ground'),
    (65, 'up smash', '', 'move', 'ground'),
    (65, 'down smash', '', 'move', 'ground'),
    (65, 'neutral air', '', 'move', 'aerial'),
    (65, 'forward air', '', 'move', 'aerial'),
    (65, 'back air', '', 'move', 'aerial'),
    (65, 'up air', '', 'move', 'aerial'),
    (65, 'down air', '', 'move', 'aerial'),
    (65, 'neutral b', '', 'move', 'special'),
    (65, 'side b', '', 'move', 'special'),
    (65, 'up b', '', 'move', 'special'),
    (65, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "ridley"
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

INSERT INTO public.throws AS "ridley"
  ("fighterId", "name", "type")
  VALUES
    (65, 'grab', 'throw'),
    (65, 'dash grab', 'throw'),
    (65, 'pivot grab', 'throw'),
    (65, 'pummel', 'throw'),
    (65, 'forward throw', 'throw'),
    (65, 'backward throw', 'throw'),
    (65, 'up throw', 'throw'),
    (65, 'down throw', 'throw');

INSERT INTO public.grappling AS "ridley"
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

INSERT INTO public.movements AS "ridley"
  ("fighterId", "name", "type")
  VALUES
    (65, 'spot dodge', 'movement'),
    (65, 'forward roll', 'movement'),
    (65, 'backwards roll', 'movement'),
    (65, 'neutral air dodge', 'movement'),
    (65, 'air dodge, down', 'movement'),
    (65, 'air dodge, side + down', 'movement'),
    (65, 'air dodge, left/right', 'movement'),
    (65, 'air dodge, side + up', 'movement'),
    (65, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "ridley"
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

INSERT INTO public.stats AS "ridley"
  ("fighterId", "name", "type")
  VALUES
    (65, 'weight', 'stat'),
    (65, 'gravity', 'stat'),
    (65, 'walk speed', 'stat'),
    (65, 'run speed', 'stat'),
    (65, 'initial dash', 'stat'),
    (65, 'air speed', 'stat'),
    (65, 'total air acceleration', 'stat'),
    (65, 'sh / fh / shff / fhff', 'stat'),
    (65, 'fall speed/fast fall speed', 'stat'),
    (65, 'out of shield, ', 'stat'),
    (65, 'out of shield, ', 'stat'),
    (65, 'out of shield, ', 'stat'),
    (65, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "ridley"
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
