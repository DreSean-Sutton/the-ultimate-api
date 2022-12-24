INSERT INTO public.moves AS "youngLink"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (87, 'jab 1', 'single', 'move', 'ground'),
    (87, 'jab 2', 'single', 'move', 'ground'),
    (87, 'jab 3', 'single', 'move', 'ground'),
    (87, 'rapid jab', 'multi', 'move', 'ground'),
    (87, 'rapid jab finisher', 'single', 'move', 'ground'),
    (87, 'forward tilt', '', 'move', 'ground'),
    (87, 'up tilt', '', 'move', 'ground'),
    (87, 'down tilt', '', 'move', 'ground'),
    (87, 'dash attack', '', 'move', 'ground'),
    (87, 'forward smash', '', 'move', 'ground'),
    (87, 'up smash', '', 'move', 'ground'),
    (87, 'down smash', '', 'move', 'ground'),
    (87, 'neutral air', '', 'move', 'aerial'),
    (87, 'forward air', '', 'move', 'aerial'),
    (87, 'back air', '', 'move', 'aerial'),
    (87, 'up air', '', 'move', 'aerial'),
    (87, 'down air', '', 'move', 'aerial'),
    (87, 'neutral b', '', 'move', 'special'),
    (87, 'side b', '', 'move', 'special'),
    (87, 'up b', '', 'move', 'special'),
    (87, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "youngLink"
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

INSERT INTO public.throws AS "youngLink"
  ("fighterId", "name", "type")
  VALUES
    (87, 'grab', 'throw'),
    (87, 'dash grab', 'throw'),
    (87, 'pivot grab', 'throw'),
    (87, 'pummel', 'throw'),
    (87, 'forward throw', 'throw'),
    (87, 'backward throw', 'throw'),
    (87, 'up throw', 'throw'),
    (87, 'down throw', 'throw');

INSERT INTO public.grappling AS "youngLink"
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

INSERT INTO public.movements AS "youngLink"
  ("fighterId", "name", "type")
  VALUES
    (87, 'spot dodge', 'movement'),
    (87, 'forward roll', 'movement'),
    (87, 'backwards roll', 'movement'),
    (87, 'neutral air dodge', 'movement'),
    (87, 'air dodge, down', 'movement'),
    (87, 'air dodge, side + down', 'movement'),
    (87, 'air dodge, left/right', 'movement'),
    (87, 'air dodge, side + up', 'movement'),
    (87, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "youngLink"
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

INSERT INTO public.stats AS "youngLink"
  ("fighterId", "name", "type")
  VALUES
    (87, 'weight', 'stat'),
    (87, 'gravity', 'stat'),
    (87, 'walk speed', 'stat'),
    (87, 'run speed', 'stat'),
    (87, 'initial dash', 'stat'),
    (87, 'air speed', 'stat'),
    (87, 'total air acceleration', 'stat'),
    (87, 'sh / fh / shff / fhff', 'stat'),
    (87, 'fall speed/fast fall speed', 'stat'),
    (87, 'out of shield, ', 'stat'),
    (87, 'out of shield, ', 'stat'),
    (87, 'out of shield, ', 'stat'),
    (87, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "youngLink"
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
