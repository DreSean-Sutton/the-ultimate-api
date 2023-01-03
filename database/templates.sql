INSERT INTO public.moves AS "ZeroSuitSamus"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (89, 'jab 1', 'single', 'move', 'ground'),
    (89, 'jab 2', 'single', 'move', 'ground'),
    (89, 'jab 3', 'single', 'move', 'ground'),
    (89, 'rapid jab', 'multi', 'move', 'ground'),
    (89, 'rapid jab finisher', 'single', 'move', 'ground'),
    (89, 'forward tilt', '', 'move', 'ground'),
    (89, 'up tilt', '', 'move', 'ground'),
    (89, 'down tilt', '', 'move', 'ground'),
    (89, 'dash attack', '', 'move', 'ground'),
    (89, 'forward smash', '', 'move', 'ground'),
    (89, 'up smash', '', 'move', 'ground'),
    (89, 'down smash', '', 'move', 'ground'),
    (89, 'neutral air', '', 'move', 'aerial'),
    (89, 'forward air', '', 'move', 'aerial'),
    (89, 'back air', '', 'move', 'aerial'),
    (89, 'up air', '', 'move', 'aerial'),
    (89, 'down air', '', 'move', 'aerial'),
    (89, 'neutral b', '', 'move', 'special'),
    (89, 'side b', '', 'move', 'special'),
    (89, 'up b', '', 'move', 'special'),
    (89, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "ZeroSuitSamus"
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

INSERT INTO public.throws AS "ZeroSuitSamus"
  ("fighterId", "name", "type")
  VALUES
    (89, 'grab', 'throw'),
    (89, 'dash grab', 'throw'),
    (89, 'pivot grab', 'throw'),
    (89, 'pummel', 'throw'),
    (89, 'forward throw', 'throw'),
    (89, 'backward throw', 'throw'),
    (89, 'up throw', 'throw'),
    (89, 'down throw', 'throw');

INSERT INTO public.grappling AS "ZeroSuitSamus"
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

INSERT INTO public.movements AS "ZeroSuitSamus"
  ("fighterId", "name", "type")
  VALUES
    (89, 'spot dodge', 'movement'),
    (89, 'forward roll', 'movement'),
    (89, 'backwards roll', 'movement'),
    (89, 'neutral air dodge', 'movement'),
    (89, 'air dodge, down', 'movement'),
    (89, 'air dodge, side + down', 'movement'),
    (89, 'air dodge, left/right', 'movement'),
    (89, 'air dodge, side + up', 'movement'),
    (89, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "ZeroSuitSamus"
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

INSERT INTO public.stats AS "ZeroSuitSamus"
  ("fighterId", "name", "type")
  VALUES
    (89, 'weight', 'stat'),
    (89, 'gravity', 'stat'),
    (89, 'walk speed', 'stat'),
    (89, 'run speed', 'stat'),
    (89, 'initial dash', 'stat'),
    (89, 'air speed', 'stat'),
    (89, 'total air acceleration', 'stat'),
    (89, 'sh / fh / shff / fhff', 'stat'),
    (89, 'fall speed/fast fall speed', 'stat'),
    (89, 'out of shield, ', 'stat'),
    (89, 'out of shield, ', 'stat'),
    (89, 'out of shield, ', 'stat'),
    (89, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "ZeroSuitSamus"
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
