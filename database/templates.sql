INSERT INTO public.moves AS "sephiroth"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (72, 'jab 1', 'single', 'move', 'ground'),
    (72, 'jab 2', 'single', 'move', 'ground'),
    (72, 'jab 3', 'single', 'move', 'ground'),
    (72, 'rapid jab', 'multi', 'move', 'ground'),
    (72, 'rapid jab finisher', 'single', 'move', 'ground'),
    (72, 'forward tilt', '', 'move', 'ground'),
    (72, 'up tilt', '', 'move', 'ground'),
    (72, 'down tilt', '', 'move', 'ground'),
    (72, 'dash attack', '', 'move', 'ground'),
    (72, 'forward smash', '', 'move', 'ground'),
    (72, 'up smash', '', 'move', 'ground'),
    (72, 'down smash', '', 'move', 'ground'),
    (72, 'neutral air', '', 'move', 'aerial'),
    (72, 'forward air', '', 'move', 'aerial'),
    (72, 'back air', '', 'move', 'aerial'),
    (72, 'up air', '', 'move', 'aerial'),
    (72, 'down air', '', 'move', 'aerial'),
    (72, 'neutral b', '', 'move', 'special'),
    (72, 'side b', '', 'move', 'special'),
    (72, 'up b', '', 'move', 'special'),
    (72, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "sephiroth"
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

INSERT INTO public.throws AS "sephiroth"
  ("fighterId", "name", "type")
  VALUES
    (72, 'grab', 'throw'),
    (72, 'dash grab', 'throw'),
    (72, 'pivot grab', 'throw'),
    (72, 'pummel', 'throw'),
    (72, 'forward throw', 'throw'),
    (72, 'backward throw', 'throw'),
    (72, 'up throw', 'throw'),
    (72, 'down throw', 'throw');

INSERT INTO public.grappling AS "sephiroth"
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

INSERT INTO public.movements AS "sephiroth"
  ("fighterId", "name", "type")
  VALUES
    (72, 'spot dodge', 'movement'),
    (72, 'forward roll', 'movement'),
    (72, 'backwards roll', 'movement'),
    (72, 'neutral air dodge', 'movement'),
    (72, 'air dodge, down', 'movement'),
    (72, 'air dodge, side + down', 'movement'),
    (72, 'air dodge, left/right', 'movement'),
    (72, 'air dodge, side + up', 'movement'),
    (72, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "sephiroth"
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

INSERT INTO public.stats AS "sephiroth"
  ("fighterId", "name", "type")
  VALUES
    (72, 'weight', 'stat'),
    (72, 'gravity', 'stat'),
    (72, 'walk speed', 'stat'),
    (72, 'run speed', 'stat'),
    (72, 'initial dash', 'stat'),
    (72, 'air speed', 'stat'),
    (72, 'total air acceleration', 'stat'),
    (72, 'sh / fh / shff / fhff', 'stat'),
    (72, 'fall speed/fast fall speed', 'stat'),
    (72, 'out of shield, ', 'stat'),
    (72, 'out of shield, ', 'stat'),
    (72, 'out of shield, ', 'stat'),
    (72, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "sephiroth"
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
