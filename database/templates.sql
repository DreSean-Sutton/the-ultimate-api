INSERT INTO public.moves AS "wolf"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (85, 'jab 1', 'single', 'move', 'ground'),
    (85, 'jab 2', 'single', 'move', 'ground'),
    (85, 'jab 3', 'single', 'move', 'ground'),
    (85, 'rapid jab', 'multi', 'move', 'ground'),
    (85, 'rapid jab finisher', 'single', 'move', 'ground'),
    (85, 'forward tilt', '', 'move', 'ground'),
    (85, 'up tilt', '', 'move', 'ground'),
    (85, 'down tilt', '', 'move', 'ground'),
    (85, 'dash attack', '', 'move', 'ground'),
    (85, 'forward smash', '', 'move', 'ground'),
    (85, 'up smash', '', 'move', 'ground'),
    (85, 'down smash', '', 'move', 'ground'),
    (85, 'neutral air', '', 'move', 'aerial'),
    (85, 'forward air', '', 'move', 'aerial'),
    (85, 'back air', '', 'move', 'aerial'),
    (85, 'up air', '', 'move', 'aerial'),
    (85, 'down air', '', 'move', 'aerial'),
    (85, 'neutral b', '', 'move', 'special'),
    (85, 'side b', '', 'move', 'special'),
    (85, 'up b', '', 'move', 'special'),
    (85, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "wolf"
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

INSERT INTO public.throws AS "wolf"
  ("fighterId", "name", "type")
  VALUES
    (85, 'grab', 'throw'),
    (85, 'dash grab', 'throw'),
    (85, 'pivot grab', 'throw'),
    (85, 'pummel', 'throw'),
    (85, 'forward throw', 'throw'),
    (85, 'backward throw', 'throw'),
    (85, 'up throw', 'throw'),
    (85, 'down throw', 'throw');

INSERT INTO public.grappling AS "wolf"
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

INSERT INTO public.movements AS "wolf"
  ("fighterId", "name", "type")
  VALUES
    (85, 'spot dodge', 'movement'),
    (85, 'forward roll', 'movement'),
    (85, 'backwards roll', 'movement'),
    (85, 'neutral air dodge', 'movement'),
    (85, 'air dodge, down', 'movement'),
    (85, 'air dodge, side + down', 'movement'),
    (85, 'air dodge, left/right', 'movement'),
    (85, 'air dodge, side + up', 'movement'),
    (85, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "wolf"
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

INSERT INTO public.stats AS "wolf"
  ("fighterId", "name", "type")
  VALUES
    (85, 'weight', 'stat'),
    (85, 'gravity', 'stat'),
    (85, 'walk speed', 'stat'),
    (85, 'run speed', 'stat'),
    (85, 'initial dash', 'stat'),
    (85, 'air speed', 'stat'),
    (85, 'total air acceleration', 'stat'),
    (85, 'sh / fh / shff / fhff', 'stat'),
    (85, 'fall speed/fast fall speed', 'stat'),
    (85, 'out of shield, ', 'stat'),
    (85, 'out of shield, ', 'stat'),
    (85, 'out of shield, ', 'stat'),
    (85, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "wolf"
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
