INSERT INTO public.moves AS "steve"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (79, 'jab 1', 'single', 'move', 'ground'),
    (79, 'jab 2', 'single', 'move', 'ground'),
    (79, 'jab 3', 'single', 'move', 'ground'),
    (79, 'rapid jab', 'multi', 'move', 'ground'),
    (79, 'rapid jab finisher', 'single', 'move', 'ground'),
    (79, 'forward tilt', '', 'move', 'ground'),
    (79, 'up tilt', '', 'move', 'ground'),
    (79, 'down tilt', '', 'move', 'ground'),
    (79, 'dash attack', '', 'move', 'ground'),
    (79, 'forward smash', '', 'move', 'ground'),
    (79, 'up smash', '', 'move', 'ground'),
    (79, 'down smash', '', 'move', 'ground'),
    (79, 'neutral air', '', 'move', 'aerial'),
    (79, 'forward air', '', 'move', 'aerial'),
    (79, 'back air', '', 'move', 'aerial'),
    (79, 'up air', '', 'move', 'aerial'),
    (79, 'down air', '', 'move', 'aerial'),
    (79, 'neutral b', '', 'move', 'special'),
    (79, 'side b', '', 'move', 'special'),
    (79, 'up b', '', 'move', 'special'),
    (79, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "steve"
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

INSERT INTO public.throws AS "steve"
  ("fighterId", "name", "type")
  VALUES
    (79, 'grab', 'throw'),
    (79, 'dash grab', 'throw'),
    (79, 'pivot grab', 'throw'),
    (79, 'pummel', 'throw'),
    (79, 'forward throw', 'throw'),
    (79, 'backward throw', 'throw'),
    (79, 'up throw', 'throw'),
    (79, 'down throw', 'throw');

INSERT INTO public.grappling AS "steve"
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

INSERT INTO public.movements AS "steve"
  ("fighterId", "name", "type")
  VALUES
    (79, 'spot dodge', 'movement'),
    (79, 'forward roll', 'movement'),
    (79, 'backwards roll', 'movement'),
    (79, 'neutral air dodge', 'movement'),
    (79, 'air dodge, down', 'movement'),
    (79, 'air dodge, side + down', 'movement'),
    (79, 'air dodge, left/right', 'movement'),
    (79, 'air dodge, side + up', 'movement'),
    (79, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "steve"
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

INSERT INTO public.stats AS "steve"
  ("fighterId", "name", "type")
  VALUES
    (79, 'weight', 'stat'),
    (79, 'gravity', 'stat'),
    (79, 'walk speed', 'stat'),
    (79, 'run speed', 'stat'),
    (79, 'initial dash', 'stat'),
    (79, 'air speed', 'stat'),
    (79, 'total air acceleration', 'stat'),
    (79, 'sh / fh / shff / fhff', 'stat'),
    (79, 'fall speed/fast fall speed', 'stat'),
    (79, 'out of shield, ', 'stat'),
    (79, 'out of shield, ', 'stat'),
    (79, 'out of shield, ', 'stat'),
    (79, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "steve"
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
