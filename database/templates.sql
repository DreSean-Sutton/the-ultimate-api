INSERT INTO public.moves AS "samus"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (71, 'jab 1', 'single', 'move', 'ground'),
    (71, 'jab 2', 'single', 'move', 'ground'),
    (71, 'jab 3', 'single', 'move', 'ground'),
    (71, 'rapid jab', 'multi', 'move', 'ground'),
    (71, 'rapid jab finisher', 'single', 'move', 'ground'),
    (71, 'forward tilt', '', 'move', 'ground'),
    (71, 'up tilt', '', 'move', 'ground'),
    (71, 'down tilt', '', 'move', 'ground'),
    (71, 'dash attack', '', 'move', 'ground'),
    (71, 'forward smash', '', 'move', 'ground'),
    (71, 'up smash', '', 'move', 'ground'),
    (71, 'down smash', '', 'move', 'ground'),
    (71, 'neutral air', '', 'move', 'aerial'),
    (71, 'forward air', '', 'move', 'aerial'),
    (71, 'back air', '', 'move', 'aerial'),
    (71, 'up air', '', 'move', 'aerial'),
    (71, 'down air', '', 'move', 'aerial'),
    (71, 'neutral b', '', 'move', 'special'),
    (71, 'side b', '', 'move', 'special'),
    (71, 'up b', '', 'move', 'special'),
    (71, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "samus"
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

INSERT INTO public.throws AS "samus"
  ("fighterId", "name", "type")
  VALUES
    (71, 'grab', 'throw'),
    (71, 'dash grab', 'throw'),
    (71, 'pivot grab', 'throw'),
    (71, 'pummel', 'throw'),
    (71, 'forward throw', 'throw'),
    (71, 'backward throw', 'throw'),
    (71, 'up throw', 'throw'),
    (71, 'down throw', 'throw');

INSERT INTO public.grappling AS "samus"
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

INSERT INTO public.movements AS "samus"
  ("fighterId", "name", "type")
  VALUES
    (71, 'spot dodge', 'movement'),
    (71, 'forward roll', 'movement'),
    (71, 'backwards roll', 'movement'),
    (71, 'neutral air dodge', 'movement'),
    (71, 'air dodge, down', 'movement'),
    (71, 'air dodge, side + down', 'movement'),
    (71, 'air dodge, left/right', 'movement'),
    (71, 'air dodge, side + up', 'movement'),
    (71, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "samus"
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

INSERT INTO public.stats AS "samus"
  ("fighterId", "name", "type")
  VALUES
    (71, 'weight', 'stat'),
    (71, 'gravity', 'stat'),
    (71, 'walk speed', 'stat'),
    (71, 'run speed', 'stat'),
    (71, 'initial dash', 'stat'),
    (71, 'air speed', 'stat'),
    (71, 'total air acceleration', 'stat'),
    (71, 'sh / fh / shff / fhff', 'stat'),
    (71, 'fall speed/fast fall speed', 'stat'),
    (71, 'out of shield, ', 'stat'),
    (71, 'out of shield, ', 'stat'),
    (71, 'out of shield, ', 'stat'),
    (71, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "samus"
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
