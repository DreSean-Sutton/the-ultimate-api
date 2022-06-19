INSERT INTO public.moves AS "miiGunner"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (46, 'jab 1', 'single', 'move'),
    (46, 'jab 2', 'single', 'move'),
    (46, 'jab 3', 'single', 'move'),
    (46, 'rapid jab', 'multi', 'move'),
    (46, 'rapid jab finisher', 'single', 'move'),
    (46, 'forward tilt', '', 'move'),
    (46, 'up tilt', '', 'move'),
    (46, 'down tilt', '', 'move'),
    (46, 'dash attack', '', 'move'),
    (46, 'forward smash', '', 'move'),
    (46, 'up smash', '', 'move'),
    (46, 'down smash', '', 'move'),
    (46, 'neutral air', '', 'move'),
    (46, 'forward air', '', 'move'),
    (46, 'back air', '', 'move'),
    (46, 'up air', '', 'move'),
    (46, 'down air', '', 'move'),
    (46, 'neutral b', '', 'move'),
    (46, 'side b', '', 'move'),
    (46, 'up b', '', 'move'),
    (46, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "miiGunner"
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

INSERT INTO public.throws AS "miiGunner"
  ("fighterId", "name", "type")
  VALUES
    (46, 'grab', 'throw'),
    (46, 'dash grab', 'throw'),
    (46, 'pivot grab', 'throw'),
    (46, 'pummel', 'throw'),
    (46, 'forward throw', 'throw'),
    (46, 'backward throw', 'throw'),
    (46, 'up throw', 'throw'),
    (46, 'down throw', 'throw');

INSERT INTO public.grappling AS "miiGunner"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '', ''),
    (null, '', ''),
    (null, '', ''),
    ('1.%', '1', ''),
    ('.0%', '', ''),
    ('.0%', '', ''),
    ('.0%', '', ''),
    ('.0%', '', '');

INSERT INTO public.movements AS "miiGunner"
  ("fighterId", "name", "type")
  VALUES
    (46, 'spot dodge', 'movement'),
    (46, 'forward roll', 'movement'),
    (46, 'backwards roll', 'movement'),
    (46, 'neutral air dodge', 'movement'),
    (46, 'air dodge, down', 'movement'),
    (46, 'air dodge, side + down', 'movement'),
    (46, 'air dodge, left/right', 'movement'),
    (46, 'air dodge, side + up', 'movement'),
    (46, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "miiGunner"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', ''),
    ('5-16', ''),
    ('3-29', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', ''),
    ('3-21', '');

INSERT INTO public.stats AS "miiGunner"
  ("fighterId", "name", "type")
  VALUES
    (46, 'weight', 'stat'),
    (46, 'gravity', 'stat'),
    (46, 'walk speed', 'stat'),
    (46, 'run speed', 'stat'),
    (46, 'initial dash', 'stat'),
    (46, 'air speed', 'stat'),
    (46, 'total air acceleration', 'stat'),
    (46, 'sh / fh / shff / fhff', 'stat'),
    (46, 'fall speed/fast fall speed', 'stat'),
    (46, 'out of shield, ', 'stat'),
    (46, 'out of shield, ', 'stat'),
    (46, 'out of shield, ', 'stat'),
    (46, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "miiGunner"
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
