INSERT INTO public.moves AS "ivysaur"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (61, 'jab 1', 'single', 'move', 'ground'),
    (61, 'jab 2', 'single', 'move', 'ground'),
    (61, 'jab 3', 'single', 'move', 'ground'),
    (61, 'rapid jab', 'multi', 'move', 'ground'),
    (61, 'rapid jab finisher', 'single', 'move', 'ground'),
    (61, 'forward tilt', '', 'move', 'ground'),
    (61, 'up tilt', '', 'move', 'ground'),
    (61, 'down tilt', '', 'move', 'ground'),
    (61, 'dash attack', '', 'move', 'ground'),
    (61, 'forward smash', '', 'move', 'ground'),
    (61, 'up smash', '', 'move', 'ground'),
    (61, 'down smash', '', 'move', 'ground'),
    (61, 'neutral air', '', 'move', 'aerial'),
    (61, 'forward air', '', 'move', 'aerial'),
    (61, 'back air', '', 'move', 'aerial'),
    (61, 'up air', '', 'move', 'aerial'),
    (61, 'down air', '', 'move', 'aerial'),
    (61, 'neutral b', '', 'move', 'special'),
    (61, 'side b', '', 'move', 'special'),
    (61, 'up b', '', 'move', 'special'),
    (61, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "ivysaur"
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

INSERT INTO public.throws AS "ivysaur"
  ("fighterId", "name", "type")
  VALUES
    (61, 'grab', 'throw'),
    (61, 'dash grab', 'throw'),
    (61, 'pivot grab', 'throw'),
    (61, 'pummel', 'throw'),
    (61, 'forward throw', 'throw'),
    (61, 'backward throw', 'throw'),
    (61, 'up throw', 'throw'),
    (61, 'down throw', 'throw');

INSERT INTO public.grappling AS "ivysaur"
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

INSERT INTO public.movements AS "ivysaur"
  ("fighterId", "name", "type")
  VALUES
    (61, 'spot dodge', 'movement'),
    (61, 'forward roll', 'movement'),
    (61, 'backwards roll', 'movement'),
    (61, 'neutral air dodge', 'movement'),
    (61, 'air dodge, down', 'movement'),
    (61, 'air dodge, side + down', 'movement'),
    (61, 'air dodge, left/right', 'movement'),
    (61, 'air dodge, side + up', 'movement'),
    (61, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "ivysaur"
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

INSERT INTO public.stats AS "ivysaur"
  ("fighterId", "name", "type")
  VALUES
    (61, 'weight', 'stat'),
    (61, 'gravity', 'stat'),
    (61, 'walk speed', 'stat'),
    (61, 'run speed', 'stat'),
    (61, 'initial dash', 'stat'),
    (61, 'air speed', 'stat'),
    (61, 'total air acceleration', 'stat'),
    (61, 'sh / fh / shff / fhff', 'stat'),
    (61, 'fall speed/fast fall speed', 'stat'),
    (61, 'out of shield, ', 'stat'),
    (61, 'out of shield, ', 'stat'),
    (61, 'out of shield, ', 'stat'),
    (61, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "ivysaur"
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
