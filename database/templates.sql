INSERT INTO public.moves AS "snake"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (76, 'jab 1', 'single', 'move', 'ground'),
    (76, 'jab 2', 'single', 'move', 'ground'),
    (76, 'jab 3', 'single', 'move', 'ground'),
    (76, 'rapid jab', 'multi', 'move', 'ground'),
    (76, 'rapid jab finisher', 'single', 'move', 'ground'),
    (76, 'forward tilt', '', 'move', 'ground'),
    (76, 'up tilt', '', 'move', 'ground'),
    (76, 'down tilt', '', 'move', 'ground'),
    (76, 'dash attack', '', 'move', 'ground'),
    (76, 'forward smash', '', 'move', 'ground'),
    (76, 'up smash', '', 'move', 'ground'),
    (76, 'down smash', '', 'move', 'ground'),
    (76, 'neutral air', '', 'move', 'aerial'),
    (76, 'forward air', '', 'move', 'aerial'),
    (76, 'back air', '', 'move', 'aerial'),
    (76, 'up air', '', 'move', 'aerial'),
    (76, 'down air', '', 'move', 'aerial'),
    (76, 'neutral b', '', 'move', 'special'),
    (76, 'side b', '', 'move', 'special'),
    (76, 'up b', '', 'move', 'special'),
    (76, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "snake"
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

INSERT INTO public.throws AS "snake"
  ("fighterId", "name", "type")
  VALUES
    (76, 'grab', 'throw'),
    (76, 'dash grab', 'throw'),
    (76, 'pivot grab', 'throw'),
    (76, 'pummel', 'throw'),
    (76, 'forward throw', 'throw'),
    (76, 'backward throw', 'throw'),
    (76, 'up throw', 'throw'),
    (76, 'down throw', 'throw');

INSERT INTO public.grappling AS "snake"
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

INSERT INTO public.movements AS "snake"
  ("fighterId", "name", "type")
  VALUES
    (76, 'spot dodge', 'movement'),
    (76, 'forward roll', 'movement'),
    (76, 'backwards roll', 'movement'),
    (76, 'neutral air dodge', 'movement'),
    (76, 'air dodge, down', 'movement'),
    (76, 'air dodge, side + down', 'movement'),
    (76, 'air dodge, left/right', 'movement'),
    (76, 'air dodge, side + up', 'movement'),
    (76, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "snake"
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

INSERT INTO public.stats AS "snake"
  ("fighterId", "name", "type")
  VALUES
    (76, 'weight', 'stat'),
    (76, 'gravity', 'stat'),
    (76, 'walk speed', 'stat'),
    (76, 'run speed', 'stat'),
    (76, 'initial dash', 'stat'),
    (76, 'air speed', 'stat'),
    (76, 'total air acceleration', 'stat'),
    (76, 'sh / fh / shff / fhff', 'stat'),
    (76, 'fall speed/fast fall speed', 'stat'),
    (76, 'out of shield, ', 'stat'),
    (76, 'out of shield, ', 'stat'),
    (76, 'out of shield, ', 'stat'),
    (76, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "snake"
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
