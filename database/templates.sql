INSERT INTO public.moves AS "shulk"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (74, 'jab 1', 'single', 'move', 'ground'),
    (74, 'jab 2', 'single', 'move', 'ground'),
    (74, 'jab 3', 'single', 'move', 'ground'),
    (74, 'rapid jab', 'multi', 'move', 'ground'),
    (74, 'rapid jab finisher', 'single', 'move', 'ground'),
    (74, 'forward tilt', '', 'move', 'ground'),
    (74, 'up tilt', '', 'move', 'ground'),
    (74, 'down tilt', '', 'move', 'ground'),
    (74, 'dash attack', '', 'move', 'ground'),
    (74, 'forward smash', '', 'move', 'ground'),
    (74, 'up smash', '', 'move', 'ground'),
    (74, 'down smash', '', 'move', 'ground'),
    (74, 'neutral air', '', 'move', 'aerial'),
    (74, 'forward air', '', 'move', 'aerial'),
    (74, 'back air', '', 'move', 'aerial'),
    (74, 'up air', '', 'move', 'aerial'),
    (74, 'down air', '', 'move', 'aerial'),
    (74, 'neutral b', '', 'move', 'special'),
    (74, 'side b', '', 'move', 'special'),
    (74, 'up b', '', 'move', 'special'),
    (74, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "shulk"
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

INSERT INTO public.throws AS "shulk"
  ("fighterId", "name", "type")
  VALUES
    (74, 'grab', 'throw'),
    (74, 'dash grab', 'throw'),
    (74, 'pivot grab', 'throw'),
    (74, 'pummel', 'throw'),
    (74, 'forward throw', 'throw'),
    (74, 'backward throw', 'throw'),
    (74, 'up throw', 'throw'),
    (74, 'down throw', 'throw');

INSERT INTO public.grappling AS "shulk"
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

INSERT INTO public.movements AS "shulk"
  ("fighterId", "name", "type")
  VALUES
    (74, 'spot dodge', 'movement'),
    (74, 'forward roll', 'movement'),
    (74, 'backwards roll', 'movement'),
    (74, 'neutral air dodge', 'movement'),
    (74, 'air dodge, down', 'movement'),
    (74, 'air dodge, side + down', 'movement'),
    (74, 'air dodge, left/right', 'movement'),
    (74, 'air dodge, side + up', 'movement'),
    (74, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "shulk"
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

INSERT INTO public.stats AS "shulk"
  ("fighterId", "name", "type")
  VALUES
    (74, 'weight', 'stat'),
    (74, 'gravity', 'stat'),
    (74, 'walk speed', 'stat'),
    (74, 'run speed', 'stat'),
    (74, 'initial dash', 'stat'),
    (74, 'air speed', 'stat'),
    (74, 'total air acceleration', 'stat'),
    (74, 'sh / fh / shff / fhff', 'stat'),
    (74, 'fall speed/fast fall speed', 'stat'),
    (74, 'out of shield, ', 'stat'),
    (74, 'out of shield, ', 'stat'),
    (74, 'out of shield, ', 'stat'),
    (74, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "shulk"
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
