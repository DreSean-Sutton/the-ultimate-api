INSERT INTO public.moves AS "ness"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (51, 'jab 1', 'single', 'move'),
    (51, 'jab 2', 'single', 'move'),
    (51, 'jab 3', 'single', 'move'),
    (51, 'rapid jab', 'multi', 'move'),
    (51, 'rapid jab finisher', 'single', 'move'),
    (51, 'forward tilt', '', 'move'),
    (51, 'up tilt', '', 'move'),
    (51, 'down tilt', '', 'move'),
    (51, 'dash attack', '', 'move'),
    (51, 'forward smash', '', 'move'),
    (51, 'up smash', '', 'move'),
    (51, 'down smash', '', 'move'),
    (51, 'neutral air', '', 'move'),
    (51, 'forward air', '', 'move'),
    (51, 'back air', '', 'move'),
    (51, 'up air', '', 'move'),
    (51, 'down air', '', 'move'),
    (51, 'neutral b', '', 'move'),
    (51, 'side b', '', 'move'),
    (51, 'up b', '', 'move'),
    (51, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "ness"
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

INSERT INTO public.throws AS "ness"
  ("fighterId", "name", "type")
  VALUES
    (51, 'grab', 'throw'),
    (51, 'dash grab', 'throw'),
    (51, 'pivot grab', 'throw'),
    (51, 'pummel', 'throw'),
    (51, 'forward throw', 'throw'),
    (51, 'backward throw', 'throw'),
    (51, 'up throw', 'throw'),
    (51, 'down throw', 'throw');

INSERT INTO public.grappling AS "ness"
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

INSERT INTO public.movements AS "ness"
  ("fighterId", "name", "type")
  VALUES
    (51, 'spot dodge', 'movement'),
    (51, 'forward roll', 'movement'),
    (51, 'backwards roll', 'movement'),
    (51, 'neutral air dodge', 'movement'),
    (51, 'air dodge, down', 'movement'),
    (51, 'air dodge, side + down', 'movement'),
    (51, 'air dodge, left/right', 'movement'),
    (51, 'air dodge, side + up', 'movement'),
    (51, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "ness"
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

INSERT INTO public.stats AS "ness"
  ("fighterId", "name", "type")
  VALUES
    (51, 'weight', 'stat'),
    (51, 'gravity', 'stat'),
    (51, 'walk speed', 'stat'),
    (51, 'run speed', 'stat'),
    (51, 'initial dash', 'stat'),
    (51, 'air speed', 'stat'),
    (51, 'total air acceleration', 'stat'),
    (51, 'sh / fh / shff / fhff', 'stat'),
    (51, 'fall speed/fast fall speed', 'stat'),
    (51, 'out of shield, ', 'stat'),
    (51, 'out of shield, ', 'stat'),
    (51, 'out of shield, ', 'stat'),
    (51, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "ness"
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
