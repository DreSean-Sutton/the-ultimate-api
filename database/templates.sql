INSERT INTO public.moves AS "zelda"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (88, 'jab 1', 'single', 'move', 'ground'),
    (88, 'jab 2', 'single', 'move', 'ground'),
    (88, 'jab 3', 'single', 'move', 'ground'),
    (88, 'rapid jab', 'multi', 'move', 'ground'),
    (88, 'rapid jab finisher', 'single', 'move', 'ground'),
    (88, 'forward tilt', '', 'move', 'ground'),
    (88, 'up tilt', '', 'move', 'ground'),
    (88, 'down tilt', '', 'move', 'ground'),
    (88, 'dash attack', '', 'move', 'ground'),
    (88, 'forward smash', '', 'move', 'ground'),
    (88, 'up smash', '', 'move', 'ground'),
    (88, 'down smash', '', 'move', 'ground'),
    (88, 'neutral air', '', 'move', 'aerial'),
    (88, 'forward air', '', 'move', 'aerial'),
    (88, 'back air', '', 'move', 'aerial'),
    (88, 'up air', '', 'move', 'aerial'),
    (88, 'down air', '', 'move', 'aerial'),
    (88, 'neutral b', '', 'move', 'special'),
    (88, 'side b', '', 'move', 'special'),
    (88, 'up b', '', 'move', 'special'),
    (88, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "zelda"
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

INSERT INTO public.throws AS "zelda"
  ("fighterId", "name", "type")
  VALUES
    (88, 'grab', 'throw'),
    (88, 'dash grab', 'throw'),
    (88, 'pivot grab', 'throw'),
    (88, 'pummel', 'throw'),
    (88, 'forward throw', 'throw'),
    (88, 'backward throw', 'throw'),
    (88, 'up throw', 'throw'),
    (88, 'down throw', 'throw');

INSERT INTO public.grappling AS "zelda"
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

INSERT INTO public.movements AS "zelda"
  ("fighterId", "name", "type")
  VALUES
    (88, 'spot dodge', 'movement'),
    (88, 'forward roll', 'movement'),
    (88, 'backwards roll', 'movement'),
    (88, 'neutral air dodge', 'movement'),
    (88, 'air dodge, down', 'movement'),
    (88, 'air dodge, side + down', 'movement'),
    (88, 'air dodge, left/right', 'movement'),
    (88, 'air dodge, side + up', 'movement'),
    (88, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "zelda"
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

INSERT INTO public.stats AS "zelda"
  ("fighterId", "name", "type")
  VALUES
    (88, 'weight', 'stat'),
    (88, 'gravity', 'stat'),
    (88, 'walk speed', 'stat'),
    (88, 'run speed', 'stat'),
    (88, 'initial dash', 'stat'),
    (88, 'air speed', 'stat'),
    (88, 'total air acceleration', 'stat'),
    (88, 'sh / fh / shff / fhff', 'stat'),
    (88, 'fall speed/fast fall speed', 'stat'),
    (88, 'out of shield, ', 'stat'),
    (88, 'out of shield, ', 'stat'),
    (88, 'out of shield, ', 'stat'),
    (88, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "zelda"
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
