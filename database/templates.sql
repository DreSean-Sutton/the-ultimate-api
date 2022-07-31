INSERT INTO public.moves AS "sonic"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (77, 'jab 1', 'single', 'move', 'ground'),
    (77, 'jab 2', 'single', 'move', 'ground'),
    (77, 'jab 3', 'single', 'move', 'ground'),
    (77, 'rapid jab', 'multi', 'move', 'ground'),
    (77, 'rapid jab finisher', 'single', 'move', 'ground'),
    (77, 'forward tilt', '', 'move', 'ground'),
    (77, 'up tilt', '', 'move', 'ground'),
    (77, 'down tilt', '', 'move', 'ground'),
    (77, 'dash attack', '', 'move', 'ground'),
    (77, 'forward smash', '', 'move', 'ground'),
    (77, 'up smash', '', 'move', 'ground'),
    (77, 'down smash', '', 'move', 'ground'),
    (77, 'neutral air', '', 'move', 'aerial'),
    (77, 'forward air', '', 'move', 'aerial'),
    (77, 'back air', '', 'move', 'aerial'),
    (77, 'up air', '', 'move', 'aerial'),
    (77, 'down air', '', 'move', 'aerial'),
    (77, 'neutral b', '', 'move', 'special'),
    (77, 'side b', '', 'move', 'special'),
    (77, 'up b', '', 'move', 'special'),
    (77, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "sonic"
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

INSERT INTO public.throws AS "sonic"
  ("fighterId", "name", "type")
  VALUES
    (77, 'grab', 'throw'),
    (77, 'dash grab', 'throw'),
    (77, 'pivot grab', 'throw'),
    (77, 'pummel', 'throw'),
    (77, 'forward throw', 'throw'),
    (77, 'backward throw', 'throw'),
    (77, 'up throw', 'throw'),
    (77, 'down throw', 'throw');

INSERT INTO public.grappling AS "sonic"
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

INSERT INTO public.movements AS "sonic"
  ("fighterId", "name", "type")
  VALUES
    (77, 'spot dodge', 'movement'),
    (77, 'forward roll', 'movement'),
    (77, 'backwards roll', 'movement'),
    (77, 'neutral air dodge', 'movement'),
    (77, 'air dodge, down', 'movement'),
    (77, 'air dodge, side + down', 'movement'),
    (77, 'air dodge, left/right', 'movement'),
    (77, 'air dodge, side + up', 'movement'),
    (77, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "sonic"
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

INSERT INTO public.stats AS "sonic"
  ("fighterId", "name", "type")
  VALUES
    (77, 'weight', 'stat'),
    (77, 'gravity', 'stat'),
    (77, 'walk speed', 'stat'),
    (77, 'run speed', 'stat'),
    (77, 'initial dash', 'stat'),
    (77, 'air speed', 'stat'),
    (77, 'total air acceleration', 'stat'),
    (77, 'sh / fh / shff / fhff', 'stat'),
    (77, 'fall speed/fast fall speed', 'stat'),
    (77, 'out of shield, ', 'stat'),
    (77, 'out of shield, ', 'stat'),
    (77, 'out of shield, ', 'stat'),
    (77, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "sonic"
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
