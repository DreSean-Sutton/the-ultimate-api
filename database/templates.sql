INSERT INTO public.moves AS "pichu"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (56, 'jab 1', 'single', 'move'),
    (56, 'jab 2', 'single', 'move'),
    (56, 'jab 3', 'single', 'move'),
    (56, 'rapid jab', 'multi', 'move'),
    (56, 'rapid jab finisher', 'single', 'move'),
    (56, 'forward tilt', '', 'move'),
    (56, 'up tilt', '', 'move'),
    (56, 'down tilt', '', 'move'),
    (56, 'dash attack', '', 'move'),
    (56, 'forward smash', '', 'move'),
    (56, 'up smash', '', 'move'),
    (56, 'down smash', '', 'move'),
    (56, 'neutral air', '', 'move'),
    (56, 'forward air', '', 'move'),
    (56, 'back air', '', 'move'),
    (56, 'up air', '', 'move'),
    (56, 'down air', '', 'move'),
    (56, 'neutral b', '', 'move'),
    (56, 'side b', '', 'move'),
    (56, 'up b', '', 'move'),
    (56, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "pichu"
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

INSERT INTO public.throws AS "pichu"
  ("fighterId", "name", "type")
  VALUES
    (56, 'grab', 'throw'),
    (56, 'dash grab', 'throw'),
    (56, 'pivot grab', 'throw'),
    (56, 'pummel', 'throw'),
    (56, 'forward throw', 'throw'),
    (56, 'backward throw', 'throw'),
    (56, 'up throw', 'throw'),
    (56, 'down throw', 'throw');

INSERT INTO public.grappling AS "pichu"
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

INSERT INTO public.movements AS "pichu"
  ("fighterId", "name", "type")
  VALUES
    (56, 'spot dodge', 'movement'),
    (56, 'forward roll', 'movement'),
    (56, 'backwards roll', 'movement'),
    (56, 'neutral air dodge', 'movement'),
    (56, 'air dodge, down', 'movement'),
    (56, 'air dodge, side + down', 'movement'),
    (56, 'air dodge, left/right', 'movement'),
    (56, 'air dodge, side + up', 'movement'),
    (56, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "pichu"
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

INSERT INTO public.stats AS "pichu"
  ("fighterId", "name", "type")
  VALUES
    (56, 'weight', 'stat'),
    (56, 'gravity', 'stat'),
    (56, 'walk speed', 'stat'),
    (56, 'run speed', 'stat'),
    (56, 'initial dash', 'stat'),
    (56, 'air speed', 'stat'),
    (56, 'total air acceleration', 'stat'),
    (56, 'sh / fh / shff / fhff', 'stat'),
    (56, 'fall speed/fast fall speed', 'stat'),
    (56, 'out of shield, ', 'stat'),
    (56, 'out of shield, ', 'stat'),
    (56, 'out of shield, ', 'stat'),
    (56, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "pichu"
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
