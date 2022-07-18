INSERT INTO public.moves AS "ryu"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (70, 'jab 1', 'single', 'move', 'ground'),
    (70, 'jab 2', 'single', 'move', 'ground'),
    (70, 'jab 3', 'single', 'move', 'ground'),
    (70, 'rapid jab', 'multi', 'move', 'ground'),
    (70, 'rapid jab finisher', 'single', 'move', 'ground'),
    (70, 'forward tilt', '', 'move', 'ground'),
    (70, 'up tilt', '', 'move', 'ground'),
    (70, 'down tilt', '', 'move', 'ground'),
    (70, 'dash attack', '', 'move', 'ground'),
    (70, 'forward smash', '', 'move', 'ground'),
    (70, 'up smash', '', 'move', 'ground'),
    (70, 'down smash', '', 'move', 'ground'),
    (70, 'neutral air', '', 'move', 'aerial'),
    (70, 'forward air', '', 'move', 'aerial'),
    (70, 'back air', '', 'move', 'aerial'),
    (70, 'up air', '', 'move', 'aerial'),
    (70, 'down air', '', 'move', 'aerial'),
    (70, 'neutral b', '', 'move', 'special'),
    (70, 'side b', '', 'move', 'special'),
    (70, 'up b', '', 'move', 'special'),
    (70, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "ryu"
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

INSERT INTO public.throws AS "ryu"
  ("fighterId", "name", "type")
  VALUES
    (70, 'grab', 'throw'),
    (70, 'dash grab', 'throw'),
    (70, 'pivot grab', 'throw'),
    (70, 'pummel', 'throw'),
    (70, 'forward throw', 'throw'),
    (70, 'backward throw', 'throw'),
    (70, 'up throw', 'throw'),
    (70, 'down throw', 'throw');

INSERT INTO public.grappling AS "ryu"
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

INSERT INTO public.movements AS "ryu"
  ("fighterId", "name", "type")
  VALUES
    (70, 'spot dodge', 'movement'),
    (70, 'forward roll', 'movement'),
    (70, 'backwards roll', 'movement'),
    (70, 'neutral air dodge', 'movement'),
    (70, 'air dodge, down', 'movement'),
    (70, 'air dodge, side + down', 'movement'),
    (70, 'air dodge, left/right', 'movement'),
    (70, 'air dodge, side + up', 'movement'),
    (70, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "ryu"
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

INSERT INTO public.stats AS "ryu"
  ("fighterId", "name", "type")
  VALUES
    (70, 'weight', 'stat'),
    (70, 'gravity', 'stat'),
    (70, 'walk speed', 'stat'),
    (70, 'run speed', 'stat'),
    (70, 'initial dash', 'stat'),
    (70, 'air speed', 'stat'),
    (70, 'total air acceleration', 'stat'),
    (70, 'sh / fh / shff / fhff', 'stat'),
    (70, 'fall speed/fast fall speed', 'stat'),
    (70, 'out of shield, ', 'stat'),
    (70, 'out of shield, ', 'stat'),
    (70, 'out of shield, ', 'stat'),
    (70, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "ryu"
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
