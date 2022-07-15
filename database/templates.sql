INSERT INTO public.moves AS "Rosalina and Luma"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (68, 'jab 1', 'single', 'move', 'ground'),
    (68, 'jab 2', 'single', 'move', 'ground'),
    (68, 'jab 3', 'single', 'move', 'ground'),
    (68, 'rapid jab', 'multi', 'move', 'ground'),
    (68, 'rapid jab finisher', 'single', 'move', 'ground'),
    (68, 'forward tilt', '', 'move', 'ground'),
    (68, 'up tilt', '', 'move', 'ground'),
    (68, 'down tilt', '', 'move', 'ground'),
    (68, 'dash attack', '', 'move', 'ground'),
    (68, 'forward smash', '', 'move', 'ground'),
    (68, 'up smash', '', 'move', 'ground'),
    (68, 'down smash', '', 'move', 'ground'),
    (68, 'neutral air', '', 'move', 'aerial'),
    (68, 'forward air', '', 'move', 'aerial'),
    (68, 'back air', '', 'move', 'aerial'),
    (68, 'up air', '', 'move', 'aerial'),
    (68, 'down air', '', 'move', 'aerial'),
    (68, 'neutral b', '', 'move', 'special'),
    (68, 'side b', '', 'move', 'special'),
    (68, 'up b', '', 'move', 'special'),
    (68, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "Rosalina and Luma"
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

INSERT INTO public.throws AS "Rosalina and Luma"
  ("fighterId", "name", "type")
  VALUES
    (68, 'grab', 'throw'),
    (68, 'dash grab', 'throw'),
    (68, 'pivot grab', 'throw'),
    (68, 'pummel', 'throw'),
    (68, 'forward throw', 'throw'),
    (68, 'backward throw', 'throw'),
    (68, 'up throw', 'throw'),
    (68, 'down throw', 'throw');

INSERT INTO public.grappling AS "Rosalina and Luma"
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

INSERT INTO public.movements AS "Rosalina and Luma"
  ("fighterId", "name", "type")
  VALUES
    (68, 'spot dodge', 'movement'),
    (68, 'forward roll', 'movement'),
    (68, 'backwards roll', 'movement'),
    (68, 'neutral air dodge', 'movement'),
    (68, 'air dodge, down', 'movement'),
    (68, 'air dodge, side + down', 'movement'),
    (68, 'air dodge, left/right', 'movement'),
    (68, 'air dodge, side + up', 'movement'),
    (68, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "Rosalina and Luma"
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

INSERT INTO public.stats AS "Rosalina and Luma"
  ("fighterId", "name", "type")
  VALUES
    (68, 'weight', 'stat'),
    (68, 'gravity', 'stat'),
    (68, 'walk speed', 'stat'),
    (68, 'run speed', 'stat'),
    (68, 'initial dash', 'stat'),
    (68, 'air speed', 'stat'),
    (68, 'total air acceleration', 'stat'),
    (68, 'sh / fh / shff / fhff', 'stat'),
    (68, 'fall speed/fast fall speed', 'stat'),
    (68, 'out of shield, ', 'stat'),
    (68, 'out of shield, ', 'stat'),
    (68, 'out of shield, ', 'stat'),
    (68, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "Rosalina and Luma"
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
