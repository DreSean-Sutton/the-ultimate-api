INSERT INTO public.moves AS "mythra"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (50, 'jab 1', 'single', 'move'),
    (50, 'jab 2', 'single', 'move'),
    (50, 'jab 3', 'single', 'move'),
    (50, 'rapid jab', 'multi', 'move'),
    (50, 'rapid jab finisher', 'single', 'move'),
    (50, 'forward tilt', '', 'move'),
    (50, 'up tilt', '', 'move'),
    (50, 'down tilt', '', 'move'),
    (50, 'dash attack', '', 'move'),
    (50, 'forward smash', '', 'move'),
    (50, 'up smash', '', 'move'),
    (50, 'down smash', '', 'move'),
    (50, 'neutral air', '', 'move'),
    (50, 'forward air', '', 'move'),
    (50, 'back air', '', 'move'),
    (50, 'up air', '', 'move'),
    (50, 'down air', '', 'move'),
    (50, 'neutral b', '', 'move'),
    (50, 'side b', '', 'move'),
    (50, 'up b', '', 'move'),
    (50, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "mythra"
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

INSERT INTO public.throws AS "mythra"
  ("fighterId", "name", "type")
  VALUES
    (50, 'grab', 'throw'),
    (50, 'dash grab', 'throw'),
    (50, 'pivot grab', 'throw'),
    (50, 'pummel', 'throw'),
    (50, 'forward throw', 'throw'),
    (50, 'backward throw', 'throw'),
    (50, 'up throw', 'throw'),
    (50, 'down throw', 'throw');

INSERT INTO public.grappling AS "mythra"
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

INSERT INTO public.movements AS "mythra"
  ("fighterId", "name", "type")
  VALUES
    (50, 'spot dodge', 'movement'),
    (50, 'forward roll', 'movement'),
    (50, 'backwards roll', 'movement'),
    (50, 'neutral air dodge', 'movement'),
    (50, 'air dodge, down', 'movement'),
    (50, 'air dodge, side + down', 'movement'),
    (50, 'air dodge, left/right', 'movement'),
    (50, 'air dodge, side + up', 'movement'),
    (50, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "mythra"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-29', '39'),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', '');

INSERT INTO public.stats AS "mythra"
  ("fighterId", "name", "type")
  VALUES
    (50, 'weight', 'stat'),
    (50, 'gravity', 'stat'),
    (50, 'walk speed', 'stat'),
    (50, 'run speed', 'stat'),
    (50, 'initial dash', 'stat'),
    (50, 'air speed', 'stat'),
    (50, 'total air acceleration', 'stat'),
    (50, 'sh / fh / shff / fhff', 'stat'),
    (50, 'fall speed/fast fall speed', 'stat'),
    (50, 'out of shield, ', 'stat'),
    (50, 'out of shield, ', 'stat'),
    (50, 'out of shield, ', 'stat'),
    (50, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "mythra"
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
