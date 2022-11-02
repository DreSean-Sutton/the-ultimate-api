INSERT INTO public.moves AS "villager"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (81, 'jab 1', 'single', 'move', 'ground'),
    (81, 'jab 2', 'single', 'move', 'ground'),
    (81, 'jab 3', 'single', 'move', 'ground'),
    (81, 'rapid jab', 'multi', 'move', 'ground'),
    (81, 'rapid jab finisher', 'single', 'move', 'ground'),
    (81, 'forward tilt', '', 'move', 'ground'),
    (81, 'up tilt', '', 'move', 'ground'),
    (81, 'down tilt', '', 'move', 'ground'),
    (81, 'dash attack', '', 'move', 'ground'),
    (81, 'forward smash', '', 'move', 'ground'),
    (81, 'up smash', '', 'move', 'ground'),
    (81, 'down smash', '', 'move', 'ground'),
    (81, 'neutral air', '', 'move', 'aerial'),
    (81, 'forward air', '', 'move', 'aerial'),
    (81, 'back air', '', 'move', 'aerial'),
    (81, 'up air', '', 'move', 'aerial'),
    (81, 'down air', '', 'move', 'aerial'),
    (81, 'neutral b', '', 'move', 'special'),
    (81, 'side b', '', 'move', 'special'),
    (81, 'up b', '', 'move', 'special'),
    (81, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "villager"
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

INSERT INTO public.throws AS "villager"
  ("fighterId", "name", "type")
  VALUES
    (81, 'grab', 'throw'),
    (81, 'dash grab', 'throw'),
    (81, 'pivot grab', 'throw'),
    (81, 'pummel', 'throw'),
    (81, 'forward throw', 'throw'),
    (81, 'backward throw', 'throw'),
    (81, 'up throw', 'throw'),
    (81, 'down throw', 'throw');

INSERT INTO public.grappling AS "villager"
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

INSERT INTO public.movements AS "villager"
  ("fighterId", "name", "type")
  VALUES
    (81, 'spot dodge', 'movement'),
    (81, 'forward roll', 'movement'),
    (81, 'backwards roll', 'movement'),
    (81, 'neutral air dodge', 'movement'),
    (81, 'air dodge, down', 'movement'),
    (81, 'air dodge, side + down', 'movement'),
    (81, 'air dodge, left/right', 'movement'),
    (81, 'air dodge, side + up', 'movement'),
    (81, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "villager"
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

INSERT INTO public.stats AS "villager"
  ("fighterId", "name", "type")
  VALUES
    (81, 'weight', 'stat'),
    (81, 'gravity', 'stat'),
    (81, 'walk speed', 'stat'),
    (81, 'run speed', 'stat'),
    (81, 'initial dash', 'stat'),
    (81, 'air speed', 'stat'),
    (81, 'total air acceleration', 'stat'),
    (81, 'sh / fh / shff / fhff', 'stat'),
    (81, 'fall speed/fast fall speed', 'stat'),
    (81, 'out of shield, ', 'stat'),
    (81, 'out of shield, ', 'stat'),
    (81, 'out of shield, ', 'stat'),
    (81, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "villager"
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
