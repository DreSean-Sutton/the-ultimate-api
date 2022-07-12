INSERT INTO public.moves AS "charizard"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (62, 'jab 1', 'single', 'move', 'ground'),
    (62, 'jab 2', 'single', 'move', 'ground'),
    (62, 'jab 3', 'single', 'move', 'ground'),
    (62, 'rapid jab', 'multi', 'move', 'ground'),
    (62, 'rapid jab finisher', 'single', 'move', 'ground'),
    (62, 'forward tilt', '', 'move', 'ground'),
    (62, 'up tilt', '', 'move', 'ground'),
    (62, 'down tilt', '', 'move', 'ground'),
    (62, 'dash attack', '', 'move', 'ground'),
    (62, 'forward smash', '', 'move', 'ground'),
    (62, 'up smash', '', 'move', 'ground'),
    (62, 'down smash', '', 'move', 'ground'),
    (62, 'neutral air', '', 'move', 'aerial'),
    (62, 'forward air', '', 'move', 'aerial'),
    (62, 'back air', '', 'move', 'aerial'),
    (62, 'up air', '', 'move', 'aerial'),
    (62, 'down air', '', 'move', 'aerial'),
    (62, 'neutral b', '', 'move', 'special'),
    (62, 'side b', '', 'move', 'special'),
    (62, 'up b', '', 'move', 'special'),
    (62, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "charizard"
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

INSERT INTO public.throws AS "charizard"
  ("fighterId", "name", "type")
  VALUES
    (62, 'grab', 'throw'),
    (62, 'dash grab', 'throw'),
    (62, 'pivot grab', 'throw'),
    (62, 'pummel', 'throw'),
    (62, 'forward throw', 'throw'),
    (62, 'backward throw', 'throw'),
    (62, 'up throw', 'throw'),
    (62, 'down throw', 'throw');

INSERT INTO public.grappling AS "charizard"
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

INSERT INTO public.movements AS "charizard"
  ("fighterId", "name", "type")
  VALUES
    (62, 'spot dodge', 'movement'),
    (62, 'forward roll', 'movement'),
    (62, 'backwards roll', 'movement'),
    (62, 'neutral air dodge', 'movement'),
    (62, 'air dodge, down', 'movement'),
    (62, 'air dodge, side + down', 'movement'),
    (62, 'air dodge, left/right', 'movement'),
    (62, 'air dodge, side + up', 'movement'),
    (62, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "charizard"
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

INSERT INTO public.stats AS "charizard"
  ("fighterId", "name", "type")
  VALUES
    (62, 'weight', 'stat'),
    (62, 'gravity', 'stat'),
    (62, 'walk speed', 'stat'),
    (62, 'run speed', 'stat'),
    (62, 'initial dash', 'stat'),
    (62, 'air speed', 'stat'),
    (62, 'total air acceleration', 'stat'),
    (62, 'sh / fh / shff / fhff', 'stat'),
    (62, 'fall speed/fast fall speed', 'stat'),
    (62, 'out of shield, ', 'stat'),
    (62, 'out of shield, ', 'stat'),
    (62, 'out of shield, ', 'stat'),
    (62, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "charizard"
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
