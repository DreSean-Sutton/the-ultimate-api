INSERT INTO public.moves AS "terry"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (80, 'jab 1', 'single', 'move', 'ground'),
    (80, 'jab 2', 'single', 'move', 'ground'),
    (80, 'jab 3', 'single', 'move', 'ground'),
    (80, 'rapid jab', 'multi', 'move', 'ground'),
    (80, 'rapid jab finisher', 'single', 'move', 'ground'),
    (80, 'forward tilt', '', 'move', 'ground'),
    (80, 'up tilt', '', 'move', 'ground'),
    (80, 'down tilt', '', 'move', 'ground'),
    (80, 'dash attack', '', 'move', 'ground'),
    (80, 'forward smash', '', 'move', 'ground'),
    (80, 'up smash', '', 'move', 'ground'),
    (80, 'down smash', '', 'move', 'ground'),
    (80, 'neutral air', '', 'move', 'aerial'),
    (80, 'forward air', '', 'move', 'aerial'),
    (80, 'back air', '', 'move', 'aerial'),
    (80, 'up air', '', 'move', 'aerial'),
    (80, 'down air', '', 'move', 'aerial'),
    (80, 'neutral b', '', 'move', 'special'),
    (80, 'side b', '', 'move', 'special'),
    (80, 'up b', '', 'move', 'special'),
    (80, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "terry"
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

INSERT INTO public.throws AS "terry"
  ("fighterId", "name", "type")
  VALUES
    (80, 'grab', 'throw'),
    (80, 'dash grab', 'throw'),
    (80, 'pivot grab', 'throw'),
    (80, 'pummel', 'throw'),
    (80, 'forward throw', 'throw'),
    (80, 'backward throw', 'throw'),
    (80, 'up throw', 'throw'),
    (80, 'down throw', 'throw');

INSERT INTO public.grappling AS "terry"
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

INSERT INTO public.movements AS "terry"
  ("fighterId", "name", "type")
  VALUES
    (80, 'spot dodge', 'movement'),
    (80, 'forward roll', 'movement'),
    (80, 'backwards roll', 'movement'),
    (80, 'neutral air dodge', 'movement'),
    (80, 'air dodge, down', 'movement'),
    (80, 'air dodge, side + down', 'movement'),
    (80, 'air dodge, left/right', 'movement'),
    (80, 'air dodge, side + up', 'movement'),
    (80, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "terry"
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

INSERT INTO public.stats AS "terry"
  ("fighterId", "name", "type")
  VALUES
    (80, 'weight', 'stat'),
    (80, 'gravity', 'stat'),
    (80, 'walk speed', 'stat'),
    (80, 'run speed', 'stat'),
    (80, 'initial dash', 'stat'),
    (80, 'air speed', 'stat'),
    (80, 'total air acceleration', 'stat'),
    (80, 'sh / fh / shff / fhff', 'stat'),
    (80, 'fall speed/fast fall speed', 'stat'),
    (80, 'out of shield, ', 'stat'),
    (80, 'out of shield, ', 'stat'),
    (80, 'out of shield, ', 'stat'),
    (80, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "terry"
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
