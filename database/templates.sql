INSERT INTO public.moves AS "wiiFitTrainer"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (84, 'jab 1', 'single', 'move', 'ground'),
    (84, 'jab 2', 'single', 'move', 'ground'),
    (84, 'jab 3', 'single', 'move', 'ground'),
    (84, 'rapid jab', 'multi', 'move', 'ground'),
    (84, 'rapid jab finisher', 'single', 'move', 'ground'),
    (84, 'forward tilt', '', 'move', 'ground'),
    (84, 'up tilt', '', 'move', 'ground'),
    (84, 'down tilt', '', 'move', 'ground'),
    (84, 'dash attack', '', 'move', 'ground'),
    (84, 'forward smash', '', 'move', 'ground'),
    (84, 'up smash', '', 'move', 'ground'),
    (84, 'down smash', '', 'move', 'ground'),
    (84, 'neutral air', '', 'move', 'aerial'),
    (84, 'forward air', '', 'move', 'aerial'),
    (84, 'back air', '', 'move', 'aerial'),
    (84, 'up air', '', 'move', 'aerial'),
    (84, 'down air', '', 'move', 'aerial'),
    (84, 'neutral b', '', 'move', 'special'),
    (84, 'side b', '', 'move', 'special'),
    (84, 'up b', '', 'move', 'special'),
    (84, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "wiiFitTrainer"
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

INSERT INTO public.throws AS "wiiFitTrainer"
  ("fighterId", "name", "type")
  VALUES
    (84, 'grab', 'throw'),
    (84, 'dash grab', 'throw'),
    (84, 'pivot grab', 'throw'),
    (84, 'pummel', 'throw'),
    (84, 'forward throw', 'throw'),
    (84, 'backward throw', 'throw'),
    (84, 'up throw', 'throw'),
    (84, 'down throw', 'throw');

INSERT INTO public.grappling AS "wiiFitTrainer"
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

INSERT INTO public.movements AS "wiiFitTrainer"
  ("fighterId", "name", "type")
  VALUES
    (84, 'spot dodge', 'movement'),
    (84, 'forward roll', 'movement'),
    (84, 'backwards roll', 'movement'),
    (84, 'neutral air dodge', 'movement'),
    (84, 'air dodge, down', 'movement'),
    (84, 'air dodge, side + down', 'movement'),
    (84, 'air dodge, left/right', 'movement'),
    (84, 'air dodge, side + up', 'movement'),
    (84, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "wiiFitTrainer"
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

INSERT INTO public.stats AS "wiiFitTrainer"
  ("fighterId", "name", "type")
  VALUES
    (84, 'weight', 'stat'),
    (84, 'gravity', 'stat'),
    (84, 'walk speed', 'stat'),
    (84, 'run speed', 'stat'),
    (84, 'initial dash', 'stat'),
    (84, 'air speed', 'stat'),
    (84, 'total air acceleration', 'stat'),
    (84, 'sh / fh / shff / fhff', 'stat'),
    (84, 'fall speed/fast fall speed', 'stat'),
    (84, 'out of shield, ', 'stat'),
    (84, 'out of shield, ', 'stat'),
    (84, 'out of shield, ', 'stat'),
    (84, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "wiiFitTrainer"
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
