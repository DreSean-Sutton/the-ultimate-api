INSERT INTO public.moves AS "peach"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (55, 'jab 1', 'single', 'move'),
    (55, 'jab 2', 'single', 'move'),
    (55, 'jab 3', 'single', 'move'),
    (55, 'rapid jab', 'multi', 'move'),
    (55, 'rapid jab finisher', 'single', 'move'),
    (55, 'forward tilt', '', 'move'),
    (55, 'up tilt', '', 'move'),
    (55, 'down tilt', '', 'move'),
    (55, 'dash attack', '', 'move'),
    (55, 'forward smash', '', 'move'),
    (55, 'up smash', '', 'move'),
    (55, 'down smash', '', 'move'),
    (55, 'neutral air', '', 'move'),
    (55, 'forward air', '', 'move'),
    (55, 'back air', '', 'move'),
    (55, 'up air', '', 'move'),
    (55, 'down air', '', 'move'),
    (55, 'neutral b', '', 'move'),
    (55, 'side b', '', 'move'),
    (55, 'up b', '', 'move'),
    (55, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "peach"
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

INSERT INTO public.throws AS "peach"
  ("fighterId", "name", "type")
  VALUES
    (55, 'grab', 'throw'),
    (55, 'dash grab', 'throw'),
    (55, 'pivot grab', 'throw'),
    (55, 'pummel', 'throw'),
    (55, 'forward throw', 'throw'),
    (55, 'backward throw', 'throw'),
    (55, 'up throw', 'throw'),
    (55, 'down throw', 'throw');

INSERT INTO public.grappling AS "peach"
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

INSERT INTO public.movements AS "peach"
  ("fighterId", "name", "type")
  VALUES
    (55, 'spot dodge', 'movement'),
    (55, 'forward roll', 'movement'),
    (55, 'backwards roll', 'movement'),
    (55, 'neutral air dodge', 'movement'),
    (55, 'air dodge, down', 'movement'),
    (55, 'air dodge, side + down', 'movement'),
    (55, 'air dodge, left/right', 'movement'),
    (55, 'air dodge, side + up', 'movement'),
    (55, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "peach"
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

INSERT INTO public.stats AS "peach"
  ("fighterId", "name", "type")
  VALUES
    (55, 'weight', 'stat'),
    (55, 'gravity', 'stat'),
    (55, 'walk speed', 'stat'),
    (55, 'run speed', 'stat'),
    (55, 'initial dash', 'stat'),
    (55, 'air speed', 'stat'),
    (55, 'total air acceleration', 'stat'),
    (55, 'sh / fh / shff / fhff', 'stat'),
    (55, 'fall speed/fast fall speed', 'stat'),
    (55, 'out of shield, ', 'stat'),
    (55, 'out of shield, ', 'stat'),
    (55, 'out of shield, ', 'stat'),
    (55, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "peach"
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
