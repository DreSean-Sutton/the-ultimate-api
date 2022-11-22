INSERT INTO public.moves AS "villager"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (82, 'jab 1', 'single', 'move', 'ground'),
    (82, 'jab 2', 'single', 'move', 'ground'),
    (82, 'jab 3', 'single', 'move', 'ground'),
    (82, 'rapid jab', 'multi', 'move', 'ground'),
    (82, 'rapid jab finisher', 'single', 'move', 'ground'),
    (82, 'forward tilt', '', 'move', 'ground'),
    (82, 'up tilt', '', 'move', 'ground'),
    (82, 'down tilt', '', 'move', 'ground'),
    (82, 'dash attack', '', 'move', 'ground'),
    (82, 'forward smash', '', 'move', 'ground'),
    (82, 'up smash', '', 'move', 'ground'),
    (82, 'down smash', '', 'move', 'ground'),
    (82, 'neutral air', '', 'move', 'aerial'),
    (82, 'forward air', '', 'move', 'aerial'),
    (82, 'back air', '', 'move', 'aerial'),
    (82, 'up air', '', 'move', 'aerial'),
    (82, 'down air', '', 'move', 'aerial'),
    (82, 'neutral b', '', 'move', 'special'),
    (82, 'side b', '', 'move', 'special'),
    (82, 'up b', '', 'move', 'special'),
    (82, 'down b', '', 'move', 'special');

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
    (82, 'grab', 'throw'),
    (82, 'dash grab', 'throw'),
    (82, 'pivot grab', 'throw'),
    (82, 'pummel', 'throw'),
    (82, 'forward throw', 'throw'),
    (82, 'backward throw', 'throw'),
    (82, 'up throw', 'throw'),
    (82, 'down throw', 'throw');

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
    (82, 'spot dodge', 'movement'),
    (82, 'forward roll', 'movement'),
    (82, 'backwards roll', 'movement'),
    (82, 'neutral air dodge', 'movement'),
    (82, 'air dodge, down', 'movement'),
    (82, 'air dodge, side + down', 'movement'),
    (82, 'air dodge, left/right', 'movement'),
    (82, 'air dodge, side + up', 'movement'),
    (82, 'air dodge up', 'movement');

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
    (82, 'weight', 'stat'),
    (82, 'gravity', 'stat'),
    (82, 'walk speed', 'stat'),
    (82, 'run speed', 'stat'),
    (82, 'initial dash', 'stat'),
    (82, 'air speed', 'stat'),
    (82, 'total air acceleration', 'stat'),
    (82, 'sh / fh / shff / fhff', 'stat'),
    (82, 'fall speed/fast fall speed', 'stat'),
    (82, 'out of shield, ', 'stat'),
    (82, 'out of shield, ', 'stat'),
    (82, 'out of shield, ', 'stat'),
    (82, 'shield grab (post-shieldstun)', 'stat');

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
