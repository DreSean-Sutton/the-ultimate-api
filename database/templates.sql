INSERT INTO public.moves AS "roy"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (69, 'jab 1', 'single', 'move', 'ground'),
    (69, 'jab 2', 'single', 'move', 'ground'),
    (69, 'jab 3', 'single', 'move', 'ground'),
    (69, 'rapid jab', 'multi', 'move', 'ground'),
    (69, 'rapid jab finisher', 'single', 'move', 'ground'),
    (69, 'forward tilt', '', 'move', 'ground'),
    (69, 'up tilt', '', 'move', 'ground'),
    (69, 'down tilt', '', 'move', 'ground'),
    (69, 'dash attack', '', 'move', 'ground'),
    (69, 'forward smash', '', 'move', 'ground'),
    (69, 'up smash', '', 'move', 'ground'),
    (69, 'down smash', '', 'move', 'ground'),
    (69, 'neutral air', '', 'move', 'aerial'),
    (69, 'forward air', '', 'move', 'aerial'),
    (69, 'back air', '', 'move', 'aerial'),
    (69, 'up air', '', 'move', 'aerial'),
    (69, 'down air', '', 'move', 'aerial'),
    (69, 'neutral b', '', 'move', 'special'),
    (69, 'side b', '', 'move', 'special'),
    (69, 'up b', '', 'move', 'special'),
    (69, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "roy"
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

INSERT INTO public.throws AS "roy"
  ("fighterId", "name", "type")
  VALUES
    (69, 'grab', 'throw'),
    (69, 'dash grab', 'throw'),
    (69, 'pivot grab', 'throw'),
    (69, 'pummel', 'throw'),
    (69, 'forward throw', 'throw'),
    (69, 'backward throw', 'throw'),
    (69, 'up throw', 'throw'),
    (69, 'down throw', 'throw');

INSERT INTO public.grappling AS "roy"
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

INSERT INTO public.movements AS "roy"
  ("fighterId", "name", "type")
  VALUES
    (69, 'spot dodge', 'movement'),
    (69, 'forward roll', 'movement'),
    (69, 'backwards roll', 'movement'),
    (69, 'neutral air dodge', 'movement'),
    (69, 'air dodge, down', 'movement'),
    (69, 'air dodge, side + down', 'movement'),
    (69, 'air dodge, left/right', 'movement'),
    (69, 'air dodge, side + up', 'movement'),
    (69, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "roy"
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

INSERT INTO public.stats AS "roy"
  ("fighterId", "name", "type")
  VALUES
    (69, 'weight', 'stat'),
    (69, 'gravity', 'stat'),
    (69, 'walk speed', 'stat'),
    (69, 'run speed', 'stat'),
    (69, 'initial dash', 'stat'),
    (69, 'air speed', 'stat'),
    (69, 'total air acceleration', 'stat'),
    (69, 'sh / fh / shff / fhff', 'stat'),
    (69, 'fall speed/fast fall speed', 'stat'),
    (69, 'out of shield, ', 'stat'),
    (69, 'out of shield, ', 'stat'),
    (69, 'out of shield, ', 'stat'),
    (69, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "roy"
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
