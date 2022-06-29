INSERT INTO public.moves AS "pikachu"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (57, 'jab 1', 'single', 'move'),
    (57, 'jab 2', 'single', 'move'),
    (57, 'jab 3', 'single', 'move'),
    (57, 'rapid jab', 'multi', 'move'),
    (57, 'rapid jab finisher', 'single', 'move'),
    (57, 'forward tilt', '', 'move'),
    (57, 'up tilt', '', 'move'),
    (57, 'down tilt', '', 'move'),
    (57, 'dash attack', '', 'move'),
    (57, 'forward smash', '', 'move'),
    (57, 'up smash', '', 'move'),
    (57, 'down smash', '', 'move'),
    (57, 'neutral air', '', 'move'),
    (57, 'forward air', '', 'move'),
    (57, 'back air', '', 'move'),
    (57, 'up air', '', 'move'),
    (57, 'down air', '', 'move'),
    (57, 'neutral b', '', 'move'),
    (57, 'side b', '', 'move'),
    (57, 'up b', '', 'move'),
    (57, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "pikachu"
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

INSERT INTO public.throws AS "pikachu"
  ("fighterId", "name", "type")
  VALUES
    (57, 'grab', 'throw'),
    (57, 'dash grab', 'throw'),
    (57, 'pivot grab', 'throw'),
    (57, 'pummel', 'throw'),
    (57, 'forward throw', 'throw'),
    (57, 'backward throw', 'throw'),
    (57, 'up throw', 'throw'),
    (57, 'down throw', 'throw');

INSERT INTO public.grappling AS "pikachu"
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

INSERT INTO public.movements AS "pikachu"
  ("fighterId", "name", "type")
  VALUES
    (57, 'spot dodge', 'movement'),
    (57, 'forward roll', 'movement'),
    (57, 'backwards roll', 'movement'),
    (57, 'neutral air dodge', 'movement'),
    (57, 'air dodge, down', 'movement'),
    (57, 'air dodge, side + down', 'movement'),
    (57, 'air dodge, left/right', 'movement'),
    (57, 'air dodge, side + up', 'movement'),
    (57, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "pikachu"
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

INSERT INTO public.stats AS "pikachu"
  ("fighterId", "name", "type")
  VALUES
    (57, 'weight', 'stat'),
    (57, 'gravity', 'stat'),
    (57, 'walk speed', 'stat'),
    (57, 'run speed', 'stat'),
    (57, 'initial dash', 'stat'),
    (57, 'air speed', 'stat'),
    (57, 'total air acceleration', 'stat'),
    (57, 'sh / fh / shff / fhff', 'stat'),
    (57, 'fall speed/fast fall speed', 'stat'),
    (57, 'out of shield, ', 'stat'),
    (57, 'out of shield, ', 'stat'),
    (57, 'out of shield, ', 'stat'),
    (57, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "pikachu"
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
