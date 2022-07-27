INSERT INTO public.moves AS "simon"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (75, 'jab 1', 'single', 'move', 'ground'),
    (75, 'jab 2', 'single', 'move', 'ground'),
    (75, 'jab 3', 'single', 'move', 'ground'),
    (75, 'rapid jab', 'multi', 'move', 'ground'),
    (75, 'rapid jab finisher', 'single', 'move', 'ground'),
    (75, 'forward tilt', '', 'move', 'ground'),
    (75, 'up tilt', '', 'move', 'ground'),
    (75, 'down tilt', '', 'move', 'ground'),
    (75, 'dash attack', '', 'move', 'ground'),
    (75, 'forward smash', '', 'move', 'ground'),
    (75, 'up smash', '', 'move', 'ground'),
    (75, 'down smash', '', 'move', 'ground'),
    (75, 'neutral air', '', 'move', 'aerial'),
    (75, 'forward air', '', 'move', 'aerial'),
    (75, 'back air', '', 'move', 'aerial'),
    (75, 'up air', '', 'move', 'aerial'),
    (75, 'down air', '', 'move', 'aerial'),
    (75, 'neutral b', '', 'move', 'special'),
    (75, 'side b', '', 'move', 'special'),
    (75, 'up b', '', 'move', 'special'),
    (75, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "simon"
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

INSERT INTO public.throws AS "simon"
  ("fighterId", "name", "type")
  VALUES
    (75, 'grab', 'throw'),
    (75, 'dash grab', 'throw'),
    (75, 'pivot grab', 'throw'),
    (75, 'pummel', 'throw'),
    (75, 'forward throw', 'throw'),
    (75, 'backward throw', 'throw'),
    (75, 'up throw', 'throw'),
    (75, 'down throw', 'throw');

INSERT INTO public.grappling AS "simon"
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

INSERT INTO public.movements AS "simon"
  ("fighterId", "name", "type")
  VALUES
    (75, 'spot dodge', 'movement'),
    (75, 'forward roll', 'movement'),
    (75, 'backwards roll', 'movement'),
    (75, 'neutral air dodge', 'movement'),
    (75, 'air dodge, down', 'movement'),
    (75, 'air dodge, side + down', 'movement'),
    (75, 'air dodge, left/right', 'movement'),
    (75, 'air dodge, side + up', 'movement'),
    (75, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "simon"
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

INSERT INTO public.stats AS "simon"
  ("fighterId", "name", "type")
  VALUES
    (75, 'weight', 'stat'),
    (75, 'gravity', 'stat'),
    (75, 'walk speed', 'stat'),
    (75, 'run speed', 'stat'),
    (75, 'initial dash', 'stat'),
    (75, 'air speed', 'stat'),
    (75, 'total air acceleration', 'stat'),
    (75, 'sh / fh / shff / fhff', 'stat'),
    (75, 'fall speed/fast fall speed', 'stat'),
    (75, 'out of shield, ', 'stat'),
    (75, 'out of shield, ', 'stat'),
    (75, 'out of shield, ', 'stat'),
    (75, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "simon"
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
