INSERT INTO public.moves AS "yoshi"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (86, 'jab 1', 'single', 'move', 'ground'),
    (86, 'jab 2', 'single', 'move', 'ground'),
    (86, 'jab 3', 'single', 'move', 'ground'),
    (86, 'rapid jab', 'multi', 'move', 'ground'),
    (86, 'rapid jab finisher', 'single', 'move', 'ground'),
    (86, 'forward tilt', '', 'move', 'ground'),
    (86, 'up tilt', '', 'move', 'ground'),
    (86, 'down tilt', '', 'move', 'ground'),
    (86, 'dash attack', '', 'move', 'ground'),
    (86, 'forward smash', '', 'move', 'ground'),
    (86, 'up smash', '', 'move', 'ground'),
    (86, 'down smash', '', 'move', 'ground'),
    (86, 'neutral air', '', 'move', 'aerial'),
    (86, 'forward air', '', 'move', 'aerial'),
    (86, 'back air', '', 'move', 'aerial'),
    (86, 'up air', '', 'move', 'aerial'),
    (86, 'down air', '', 'move', 'aerial'),
    (86, 'neutral b', '', 'move', 'special'),
    (86, 'side b', '', 'move', 'special'),
    (86, 'up b', '', 'move', 'special'),
    (86, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "yoshi"
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

INSERT INTO public.throws AS "yoshi"
  ("fighterId", "name", "type")
  VALUES
    (86, 'grab', 'throw'),
    (86, 'dash grab', 'throw'),
    (86, 'pivot grab', 'throw'),
    (86, 'pummel', 'throw'),
    (86, 'forward throw', 'throw'),
    (86, 'backward throw', 'throw'),
    (86, 'up throw', 'throw'),
    (86, 'down throw', 'throw');

INSERT INTO public.grappling AS "yoshi"
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

INSERT INTO public.movements AS "yoshi"
  ("fighterId", "name", "type")
  VALUES
    (86, 'spot dodge', 'movement'),
    (86, 'forward roll', 'movement'),
    (86, 'backwards roll', 'movement'),
    (86, 'neutral air dodge', 'movement'),
    (86, 'air dodge, down', 'movement'),
    (86, 'air dodge, side + down', 'movement'),
    (86, 'air dodge, left/right', 'movement'),
    (86, 'air dodge, side + up', 'movement'),
    (86, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "yoshi"
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

INSERT INTO public.stats AS "yoshi"
  ("fighterId", "name", "type")
  VALUES
    (86, 'weight', 'stat'),
    (86, 'gravity', 'stat'),
    (86, 'walk speed', 'stat'),
    (86, 'run speed', 'stat'),
    (86, 'initial dash', 'stat'),
    (86, 'air speed', 'stat'),
    (86, 'total air acceleration', 'stat'),
    (86, 'sh / fh / shff / fhff', 'stat'),
    (86, 'fall speed/fast fall speed', 'stat'),
    (86, 'out of shield, ', 'stat'),
    (86, 'out of shield, ', 'stat'),
    (86, 'out of shield, ', 'stat'),
    (86, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "yoshi"
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
