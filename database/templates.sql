INSERT INTO public.moves AS "pacMan"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (53, 'jab 1', 'single', 'move'),
    (53, 'jab 2', 'single', 'move'),
    (53, 'jab 3', 'single', 'move'),
    (53, 'rapid jab', 'multi', 'move'),
    (53, 'rapid jab finisher', 'single', 'move'),
    (53, 'forward tilt', '', 'move'),
    (53, 'up tilt', '', 'move'),
    (53, 'down tilt', '', 'move'),
    (53, 'dash attack', '', 'move'),
    (53, 'forward smash', '', 'move'),
    (53, 'up smash', '', 'move'),
    (53, 'down smash', '', 'move'),
    (53, 'neutral air', '', 'move'),
    (53, 'forward air', '', 'move'),
    (53, 'back air', '', 'move'),
    (53, 'up air', '', 'move'),
    (53, 'down air', '', 'move'),
    (53, 'neutral b', '', 'move'),
    (53, 'side b', '', 'move'),
    (53, 'up b', '', 'move'),
    (53, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "pacMan"
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

INSERT INTO public.throws AS "pacMan"
  ("fighterId", "name", "type")
  VALUES
    (53, 'grab', 'throw'),
    (53, 'dash grab', 'throw'),
    (53, 'pivot grab', 'throw'),
    (53, 'pummel', 'throw'),
    (53, 'forward throw', 'throw'),
    (53, 'backward throw', 'throw'),
    (53, 'up throw', 'throw'),
    (53, 'down throw', 'throw');

INSERT INTO public.grappling AS "pacMan"
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

INSERT INTO public.movements AS "pacMan"
  ("fighterId", "name", "type")
  VALUES
    (53, 'spot dodge', 'movement'),
    (53, 'forward roll', 'movement'),
    (53, 'backwards roll', 'movement'),
    (53, 'neutral air dodge', 'movement'),
    (53, 'air dodge, down', 'movement'),
    (53, 'air dodge, side + down', 'movement'),
    (53, 'air dodge, left/right', 'movement'),
    (53, 'air dodge, side + up', 'movement'),
    (53, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "pacMan"
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

INSERT INTO public.stats AS "pacMan"
  ("fighterId", "name", "type")
  VALUES
    (53, 'weight', 'stat'),
    (53, 'gravity', 'stat'),
    (53, 'walk speed', 'stat'),
    (53, 'run speed', 'stat'),
    (53, 'initial dash', 'stat'),
    (53, 'air speed', 'stat'),
    (53, 'total air acceleration', 'stat'),
    (53, 'sh / fh / shff / fhff', 'stat'),
    (53, 'fall speed/fast fall speed', 'stat'),
    (53, 'out of shield, ', 'stat'),
    (53, 'out of shield, ', 'stat'),
    (53, 'out of shield, ', 'stat'),
    (53, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "pacMan"
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
