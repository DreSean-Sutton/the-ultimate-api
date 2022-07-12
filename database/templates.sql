INSERT INTO public.moves AS "richter"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (64, 'jab 1', 'single', 'move', 'ground'),
    (64, 'jab 2', 'single', 'move', 'ground'),
    (64, 'jab 3', 'single', 'move', 'ground'),
    (64, 'rapid jab', 'multi', 'move', 'ground'),
    (64, 'rapid jab finisher', 'single', 'move', 'ground'),
    (64, 'forward tilt', '', 'move', 'ground'),
    (64, 'up tilt', '', 'move', 'ground'),
    (64, 'down tilt', '', 'move', 'ground'),
    (64, 'dash attack', '', 'move', 'ground'),
    (64, 'forward smash', '', 'move', 'ground'),
    (64, 'up smash', '', 'move', 'ground'),
    (64, 'down smash', '', 'move', 'ground'),
    (64, 'neutral air', '', 'move', 'aerial'),
    (64, 'forward air', '', 'move', 'aerial'),
    (64, 'back air', '', 'move', 'aerial'),
    (64, 'up air', '', 'move', 'aerial'),
    (64, 'down air', '', 'move', 'aerial'),
    (64, 'neutral b', '', 'move', 'special'),
    (64, 'side b', '', 'move', 'special'),
    (64, 'up b', '', 'move', 'special'),
    (64, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "richter"
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

INSERT INTO public.throws AS "richter"
  ("fighterId", "name", "type")
  VALUES
    (64, 'grab', 'throw'),
    (64, 'dash grab', 'throw'),
    (64, 'pivot grab', 'throw'),
    (64, 'pummel', 'throw'),
    (64, 'forward throw', 'throw'),
    (64, 'backward throw', 'throw'),
    (64, 'up throw', 'throw'),
    (64, 'down throw', 'throw');

INSERT INTO public.grappling AS "richter"
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

INSERT INTO public.movements AS "richter"
  ("fighterId", "name", "type")
  VALUES
    (64, 'spot dodge', 'movement'),
    (64, 'forward roll', 'movement'),
    (64, 'backwards roll', 'movement'),
    (64, 'neutral air dodge', 'movement'),
    (64, 'air dodge, down', 'movement'),
    (64, 'air dodge, side + down', 'movement'),
    (64, 'air dodge, left/right', 'movement'),
    (64, 'air dodge, side + up', 'movement'),
    (64, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "richter"
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

INSERT INTO public.stats AS "richter"
  ("fighterId", "name", "type")
  VALUES
    (64, 'weight', 'stat'),
    (64, 'gravity', 'stat'),
    (64, 'walk speed', 'stat'),
    (64, 'run speed', 'stat'),
    (64, 'initial dash', 'stat'),
    (64, 'air speed', 'stat'),
    (64, 'total air acceleration', 'stat'),
    (64, 'sh / fh / shff / fhff', 'stat'),
    (64, 'fall speed/fast fall speed', 'stat'),
    (64, 'out of shield, ', 'stat'),
    (64, 'out of shield, ', 'stat'),
    (64, 'out of shield, ', 'stat'),
    (64, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "richter"
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
