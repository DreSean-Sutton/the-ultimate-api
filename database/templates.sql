INSERT INTO public.moves AS "Sora"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (78, 'jab 1', 'single', 'move', 'ground'),
    (78, 'jab 2', 'single', 'move', 'ground'),
    (78, 'jab 3', 'single', 'move', 'ground'),
    (78, 'rapid jab', 'multi', 'move', 'ground'),
    (78, 'rapid jab finisher', 'single', 'move', 'ground'),
    (78, 'forward tilt', '', 'move', 'ground'),
    (78, 'up tilt', '', 'move', 'ground'),
    (78, 'down tilt', '', 'move', 'ground'),
    (78, 'dash attack', '', 'move', 'ground'),
    (78, 'forward smash', '', 'move', 'ground'),
    (78, 'up smash', '', 'move', 'ground'),
    (78, 'down smash', '', 'move', 'ground'),
    (78, 'neutral air', '', 'move', 'aerial'),
    (78, 'forward air', '', 'move', 'aerial'),
    (78, 'back air', '', 'move', 'aerial'),
    (78, 'up air', '', 'move', 'aerial'),
    (78, 'down air', '', 'move', 'aerial'),
    (78, 'neutral b', '', 'move', 'special'),
    (78, 'side b', '', 'move', 'special'),
    (78, 'up b', '', 'move', 'special'),
    (78, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "Sora"
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

INSERT INTO public.throws AS "Sora"
  ("fighterId", "name", "type")
  VALUES
    (78, 'grab', 'throw'),
    (78, 'dash grab', 'throw'),
    (78, 'pivot grab', 'throw'),
    (78, 'pummel', 'throw'),
    (78, 'forward throw', 'throw'),
    (78, 'backward throw', 'throw'),
    (78, 'up throw', 'throw'),
    (78, 'down throw', 'throw');

INSERT INTO public.grappling AS "Sora"
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

INSERT INTO public.movements AS "Sora"
  ("fighterId", "name", "type")
  VALUES
    (78, 'spot dodge', 'movement'),
    (78, 'forward roll', 'movement'),
    (78, 'backwards roll', 'movement'),
    (78, 'neutral air dodge', 'movement'),
    (78, 'air dodge, down', 'movement'),
    (78, 'air dodge, side + down', 'movement'),
    (78, 'air dodge, left/right', 'movement'),
    (78, 'air dodge, side + up', 'movement'),
    (78, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "Sora"
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

INSERT INTO public.stats AS "Sora"
  ("fighterId", "name", "type")
  VALUES
    (78, 'weight', 'stat'),
    (78, 'gravity', 'stat'),
    (78, 'walk speed', 'stat'),
    (78, 'run speed', 'stat'),
    (78, 'initial dash', 'stat'),
    (78, 'air speed', 'stat'),
    (78, 'total air acceleration', 'stat'),
    (78, 'sh / fh / shff / fhff', 'stat'),
    (78, 'fall speed/fast fall speed', 'stat'),
    (78, 'out of shield, ', 'stat'),
    (78, 'out of shield, ', 'stat'),
    (78, 'out of shield, ', 'stat'),
    (78, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "Sora"
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
