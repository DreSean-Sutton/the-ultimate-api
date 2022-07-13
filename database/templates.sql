INSERT INTO public.moves AS "rob"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (66, 'jab 1', 'single', 'move', 'ground'),
    (66, 'jab 2', 'single', 'move', 'ground'),
    (66, 'jab 3', 'single', 'move', 'ground'),
    (66, 'rapid jab', 'multi', 'move', 'ground'),
    (66, 'rapid jab finisher', 'single', 'move', 'ground'),
    (66, 'forward tilt', '', 'move', 'ground'),
    (66, 'up tilt', '', 'move', 'ground'),
    (66, 'down tilt', '', 'move', 'ground'),
    (66, 'dash attack', '', 'move', 'ground'),
    (66, 'forward smash', '', 'move', 'ground'),
    (66, 'up smash', '', 'move', 'ground'),
    (66, 'down smash', '', 'move', 'ground'),
    (66, 'neutral air', '', 'move', 'aerial'),
    (66, 'forward air', '', 'move', 'aerial'),
    (66, 'back air', '', 'move', 'aerial'),
    (66, 'up air', '', 'move', 'aerial'),
    (66, 'down air', '', 'move', 'aerial'),
    (66, 'neutral b', '', 'move', 'special'),
    (66, 'side b', '', 'move', 'special'),
    (66, 'up b', '', 'move', 'special'),
    (66, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "rob"
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

INSERT INTO public.throws AS "rob"
  ("fighterId", "name", "type")
  VALUES
    (66, 'grab', 'throw'),
    (66, 'dash grab', 'throw'),
    (66, 'pivot grab', 'throw'),
    (66, 'pummel', 'throw'),
    (66, 'forward throw', 'throw'),
    (66, 'backward throw', 'throw'),
    (66, 'up throw', 'throw'),
    (66, 'down throw', 'throw');

INSERT INTO public.grappling AS "rob"
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

INSERT INTO public.movements AS "rob"
  ("fighterId", "name", "type")
  VALUES
    (66, 'spot dodge', 'movement'),
    (66, 'forward roll', 'movement'),
    (66, 'backwards roll', 'movement'),
    (66, 'neutral air dodge', 'movement'),
    (66, 'air dodge, down', 'movement'),
    (66, 'air dodge, side + down', 'movement'),
    (66, 'air dodge, left/right', 'movement'),
    (66, 'air dodge, side + up', 'movement'),
    (66, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "rob"
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

INSERT INTO public.stats AS "rob"
  ("fighterId", "name", "type")
  VALUES
    (66, 'weight', 'stat'),
    (66, 'gravity', 'stat'),
    (66, 'walk speed', 'stat'),
    (66, 'run speed', 'stat'),
    (66, 'initial dash', 'stat'),
    (66, 'air speed', 'stat'),
    (66, 'total air acceleration', 'stat'),
    (66, 'sh / fh / shff / fhff', 'stat'),
    (66, 'fall speed/fast fall speed', 'stat'),
    (66, 'out of shield, ', 'stat'),
    (66, 'out of shield, ', 'stat'),
    (66, 'out of shield, ', 'stat'),
    (66, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "rob"
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
