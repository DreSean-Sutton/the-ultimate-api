INSERT INTO public.moves AS "olimar"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (52, 'jab 1', 'single', 'move'),
    (52, 'jab 2', 'single', 'move'),
    (52, 'jab 3', 'single', 'move'),
    (52, 'rapid jab', 'multi', 'move'),
    (52, 'rapid jab finisher', 'single', 'move'),
    (52, 'forward tilt', '', 'move'),
    (52, 'up tilt', '', 'move'),
    (52, 'down tilt', '', 'move'),
    (52, 'dash attack', '', 'move'),
    (52, 'forward smash', '', 'move'),
    (52, 'up smash', '', 'move'),
    (52, 'down smash', '', 'move'),
    (52, 'neutral air', '', 'move'),
    (52, 'forward air', '', 'move'),
    (52, 'back air', '', 'move'),
    (52, 'up air', '', 'move'),
    (52, 'down air', '', 'move'),
    (52, 'neutral b', '', 'move'),
    (52, 'side b', '', 'move'),
    (52, 'up b', '', 'move'),
    (52, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "olimar"
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

INSERT INTO public.throws AS "olimar"
  ("fighterId", "name", "type")
  VALUES
    (52, 'grab', 'throw'),
    (52, 'dash grab', 'throw'),
    (52, 'pivot grab', 'throw'),
    (52, 'pummel', 'throw'),
    (52, 'forward throw', 'throw'),
    (52, 'backward throw', 'throw'),
    (52, 'up throw', 'throw'),
    (52, 'down throw', 'throw');

INSERT INTO public.grappling AS "olimar"
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

INSERT INTO public.movements AS "olimar"
  ("fighterId", "name", "type")
  VALUES
    (52, 'spot dodge', 'movement'),
    (52, 'forward roll', 'movement'),
    (52, 'backwards roll', 'movement'),
    (52, 'neutral air dodge', 'movement'),
    (52, 'air dodge, down', 'movement'),
    (52, 'air dodge, side + down', 'movement'),
    (52, 'air dodge, left/right', 'movement'),
    (52, 'air dodge, side + up', 'movement'),
    (52, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "olimar"
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

INSERT INTO public.stats AS "olimar"
  ("fighterId", "name", "type")
  VALUES
    (52, 'weight', 'stat'),
    (52, 'gravity', 'stat'),
    (52, 'walk speed', 'stat'),
    (52, 'run speed', 'stat'),
    (52, 'initial dash', 'stat'),
    (52, 'air speed', 'stat'),
    (52, 'total air acceleration', 'stat'),
    (52, 'sh / fh / shff / fhff', 'stat'),
    (52, 'fall speed/fast fall speed', 'stat'),
    (52, 'out of shield, ', 'stat'),
    (52, 'out of shield, ', 'stat'),
    (52, 'out of shield, ', 'stat'),
    (52, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "olimar"
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
