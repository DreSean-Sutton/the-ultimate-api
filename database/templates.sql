INSERT INTO public.moves AS "squirtle"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (60, 'jab 1', 'single', 'move'),
    (60, 'jab 2', 'single', 'move'),
    (60, 'jab 3', 'single', 'move'),
    (60, 'rapid jab', 'multi', 'move'),
    (60, 'rapid jab finisher', 'single', 'move'),
    (60, 'forward tilt', '', 'move'),
    (60, 'up tilt', '', 'move'),
    (60, 'down tilt', '', 'move'),
    (60, 'dash attack', '', 'move'),
    (60, 'forward smash', '', 'move'),
    (60, 'up smash', '', 'move'),
    (60, 'down smash', '', 'move'),
    (60, 'neutral air', '', 'move'),
    (60, 'forward air', '', 'move'),
    (60, 'back air', '', 'move'),
    (60, 'up air', '', 'move'),
    (60, 'down air', '', 'move'),
    (60, 'neutral b', '', 'move'),
    (60, 'side b', '', 'move'),
    (60, 'up b', '', 'move'),
    (60, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "squirtle"
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

INSERT INTO public.throws AS "squirtle"
  ("fighterId", "name", "type")
  VALUES
    (60, 'grab', 'throw'),
    (60, 'dash grab', 'throw'),
    (60, 'pivot grab', 'throw'),
    (60, 'pummel', 'throw'),
    (60, 'forward throw', 'throw'),
    (60, 'backward throw', 'throw'),
    (60, 'up throw', 'throw'),
    (60, 'down throw', 'throw');

INSERT INTO public.grappling AS "squirtle"
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

INSERT INTO public.movements AS "squirtle"
  ("fighterId", "name", "type")
  VALUES
    (60, 'spot dodge', 'movement'),
    (60, 'forward roll', 'movement'),
    (60, 'backwards roll', 'movement'),
    (60, 'neutral air dodge', 'movement'),
    (60, 'air dodge, down', 'movement'),
    (60, 'air dodge, side + down', 'movement'),
    (60, 'air dodge, left/right', 'movement'),
    (60, 'air dodge, side + up', 'movement'),
    (60, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "squirtle"
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

INSERT INTO public.stats AS "squirtle"
  ("fighterId", "name", "type")
  VALUES
    (60, 'weight', 'stat'),
    (60, 'gravity', 'stat'),
    (60, 'walk speed', 'stat'),
    (60, 'run speed', 'stat'),
    (60, 'initial dash', 'stat'),
    (60, 'air speed', 'stat'),
    (60, 'total air acceleration', 'stat'),
    (60, 'sh / fh / shff / fhff', 'stat'),
    (60, 'fall speed/fast fall speed', 'stat'),
    (60, 'out of shield, ', 'stat'),
    (60, 'out of shield, ', 'stat'),
    (60, 'out of shield, ', 'stat'),
    (60, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "squirtle"
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
