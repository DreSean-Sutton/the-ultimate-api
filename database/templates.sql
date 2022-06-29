INSERT INTO public.moves AS "piranhaPlant"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (58, 'jab 1', 'single', 'move'),
    (58, 'jab 2', 'single', 'move'),
    (58, 'jab 3', 'single', 'move'),
    (58, 'rapid jab', 'multi', 'move'),
    (58, 'rapid jab finisher', 'single', 'move'),
    (58, 'forward tilt', '', 'move'),
    (58, 'up tilt', '', 'move'),
    (58, 'down tilt', '', 'move'),
    (58, 'dash attack', '', 'move'),
    (58, 'forward smash', '', 'move'),
    (58, 'up smash', '', 'move'),
    (58, 'down smash', '', 'move'),
    (58, 'neutral air', '', 'move'),
    (58, 'forward air', '', 'move'),
    (58, 'back air', '', 'move'),
    (58, 'up air', '', 'move'),
    (58, 'down air', '', 'move'),
    (58, 'neutral b', '', 'move'),
    (58, 'side b', '', 'move'),
    (58, 'up b', '', 'move'),
    (58, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "piranhaPlant"
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

INSERT INTO public.throws AS "piranhaPlant"
  ("fighterId", "name", "type")
  VALUES
    (58, 'grab', 'throw'),
    (58, 'dash grab', 'throw'),
    (58, 'pivot grab', 'throw'),
    (58, 'pummel', 'throw'),
    (58, 'forward throw', 'throw'),
    (58, 'backward throw', 'throw'),
    (58, 'up throw', 'throw'),
    (58, 'down throw', 'throw');

INSERT INTO public.grappling AS "piranhaPlant"
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

INSERT INTO public.movements AS "piranhaPlant"
  ("fighterId", "name", "type")
  VALUES
    (58, 'spot dodge', 'movement'),
    (58, 'forward roll', 'movement'),
    (58, 'backwards roll', 'movement'),
    (58, 'neutral air dodge', 'movement'),
    (58, 'air dodge, down', 'movement'),
    (58, 'air dodge, side + down', 'movement'),
    (58, 'air dodge, left/right', 'movement'),
    (58, 'air dodge, side + up', 'movement'),
    (58, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "piranhaPlant"
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

INSERT INTO public.stats AS "piranhaPlant"
  ("fighterId", "name", "type")
  VALUES
    (58, 'weight', 'stat'),
    (58, 'gravity', 'stat'),
    (58, 'walk speed', 'stat'),
    (58, 'run speed', 'stat'),
    (58, 'initial dash', 'stat'),
    (58, 'air speed', 'stat'),
    (58, 'total air acceleration', 'stat'),
    (58, 'sh / fh / shff / fhff', 'stat'),
    (58, 'fall speed/fast fall speed', 'stat'),
    (58, 'out of shield, ', 'stat'),
    (58, 'out of shield, ', 'stat'),
    (58, 'out of shield, ', 'stat'),
    (58, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "piranhaPlant"
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
