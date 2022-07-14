INSERT INTO public.moves AS "robin"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (67, 'jab 1', 'single', 'move', 'ground'),
    (67, 'jab 2', 'single', 'move', 'ground'),
    (67, 'jab 3', 'single', 'move', 'ground'),
    (67, 'rapid jab', 'multi', 'move', 'ground'),
    (67, 'rapid jab finisher', 'single', 'move', 'ground'),
    (67, 'forward tilt', '', 'move', 'ground'),
    (67, 'up tilt', '', 'move', 'ground'),
    (67, 'down tilt', '', 'move', 'ground'),
    (67, 'dash attack', '', 'move', 'ground'),
    (67, 'forward smash', '', 'move', 'ground'),
    (67, 'up smash', '', 'move', 'ground'),
    (67, 'down smash', '', 'move', 'ground'),
    (67, 'neutral air', '', 'move', 'aerial'),
    (67, 'forward air', '', 'move', 'aerial'),
    (67, 'back air', '', 'move', 'aerial'),
    (67, 'up air', '', 'move', 'aerial'),
    (67, 'down air', '', 'move', 'aerial'),
    (67, 'neutral b', '', 'move', 'special'),
    (67, 'side b', '', 'move', 'special'),
    (67, 'up b', '', 'move', 'special'),
    (67, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "robin"
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

INSERT INTO public.throws AS "robin"
  ("fighterId", "name", "type")
  VALUES
    (67, 'grab', 'throw'),
    (67, 'dash grab', 'throw'),
    (67, 'pivot grab', 'throw'),
    (67, 'pummel', 'throw'),
    (67, 'forward throw', 'throw'),
    (67, 'backward throw', 'throw'),
    (67, 'up throw', 'throw'),
    (67, 'down throw', 'throw');

INSERT INTO public.grappling AS "robin"
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

INSERT INTO public.movements AS "robin"
  ("fighterId", "name", "type")
  VALUES
    (67, 'spot dodge', 'movement'),
    (67, 'forward roll', 'movement'),
    (67, 'backwards roll', 'movement'),
    (67, 'neutral air dodge', 'movement'),
    (67, 'air dodge, down', 'movement'),
    (67, 'air dodge, side + down', 'movement'),
    (67, 'air dodge, left/right', 'movement'),
    (67, 'air dodge, side + up', 'movement'),
    (67, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "robin"
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

INSERT INTO public.stats AS "robin"
  ("fighterId", "name", "type")
  VALUES
    (67, 'weight', 'stat'),
    (67, 'gravity', 'stat'),
    (67, 'walk speed', 'stat'),
    (67, 'run speed', 'stat'),
    (67, 'initial dash', 'stat'),
    (67, 'air speed', 'stat'),
    (67, 'total air acceleration', 'stat'),
    (67, 'sh / fh / shff / fhff', 'stat'),
    (67, 'fall speed/fast fall speed', 'stat'),
    (67, 'out of shield, ', 'stat'),
    (67, 'out of shield, ', 'stat'),
    (67, 'out of shield, ', 'stat'),
    (67, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "robin"
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
