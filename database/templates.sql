INSERT INTO public.moves AS "sheik"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (73, 'jab 1', 'single', 'move', 'ground'),
    (73, 'jab 2', 'single', 'move', 'ground'),
    (73, 'jab 3', 'single', 'move', 'ground'),
    (73, 'rapid jab', 'multi', 'move', 'ground'),
    (73, 'rapid jab finisher', 'single', 'move', 'ground'),
    (73, 'forward tilt', '', 'move', 'ground'),
    (73, 'up tilt', '', 'move', 'ground'),
    (73, 'down tilt', '', 'move', 'ground'),
    (73, 'dash attack', '', 'move', 'ground'),
    (73, 'forward smash', '', 'move', 'ground'),
    (73, 'up smash', '', 'move', 'ground'),
    (73, 'down smash', '', 'move', 'ground'),
    (73, 'neutral air', '', 'move', 'aerial'),
    (73, 'forward air', '', 'move', 'aerial'),
    (73, 'back air', '', 'move', 'aerial'),
    (73, 'up air', '', 'move', 'aerial'),
    (73, 'down air', '', 'move', 'aerial'),
    (73, 'neutral b', '', 'move', 'special'),
    (73, 'side b', '', 'move', 'special'),
    (73, 'up b', '', 'move', 'special'),
    (73, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "sheik"
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

INSERT INTO public.throws AS "sheik"
  ("fighterId", "name", "type")
  VALUES
    (73, 'grab', 'throw'),
    (73, 'dash grab', 'throw'),
    (73, 'pivot grab', 'throw'),
    (73, 'pummel', 'throw'),
    (73, 'forward throw', 'throw'),
    (73, 'backward throw', 'throw'),
    (73, 'up throw', 'throw'),
    (73, 'down throw', 'throw');

INSERT INTO public.grappling AS "sheik"
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

INSERT INTO public.movements AS "sheik"
  ("fighterId", "name", "type")
  VALUES
    (73, 'spot dodge', 'movement'),
    (73, 'forward roll', 'movement'),
    (73, 'backwards roll', 'movement'),
    (73, 'neutral air dodge', 'movement'),
    (73, 'air dodge, down', 'movement'),
    (73, 'air dodge, side + down', 'movement'),
    (73, 'air dodge, left/right', 'movement'),
    (73, 'air dodge, side + up', 'movement'),
    (73, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "sheik"
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

INSERT INTO public.stats AS "sheik"
  ("fighterId", "name", "type")
  VALUES
    (73, 'weight', 'stat'),
    (73, 'gravity', 'stat'),
    (73, 'walk speed', 'stat'),
    (73, 'run speed', 'stat'),
    (73, 'initial dash', 'stat'),
    (73, 'air speed', 'stat'),
    (73, 'total air acceleration', 'stat'),
    (73, 'sh / fh / shff / fhff', 'stat'),
    (73, 'fall speed/fast fall speed', 'stat'),
    (73, 'out of shield, ', 'stat'),
    (73, 'out of shield, ', 'stat'),
    (73, 'out of shield, ', 'stat'),
    (73, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "sheik"
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
