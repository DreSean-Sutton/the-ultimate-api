INSERT INTO public.moves AS "palutena"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (54, 'jab 1', 'single', 'move'),
    (54, 'jab 2', 'single', 'move'),
    (54, 'jab 3', 'single', 'move'),
    (54, 'rapid jab', 'multi', 'move'),
    (54, 'rapid jab finisher', 'single', 'move'),
    (54, 'forward tilt', '', 'move'),
    (54, 'up tilt', '', 'move'),
    (54, 'down tilt', '', 'move'),
    (54, 'dash attack', '', 'move'),
    (54, 'forward smash', '', 'move'),
    (54, 'up smash', '', 'move'),
    (54, 'down smash', '', 'move'),
    (54, 'neutral air', '', 'move'),
    (54, 'forward air', '', 'move'),
    (54, 'back air', '', 'move'),
    (54, 'up air', '', 'move'),
    (54, 'down air', '', 'move'),
    (54, 'neutral b', '', 'move'),
    (54, 'side b', '', 'move'),
    (54, 'up b', '', 'move'),
    (54, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "palutena"
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

INSERT INTO public.throws AS "palutena"
  ("fighterId", "name", "type")
  VALUES
    (54, 'grab', 'throw'),
    (54, 'dash grab', 'throw'),
    (54, 'pivot grab', 'throw'),
    (54, 'pummel', 'throw'),
    (54, 'forward throw', 'throw'),
    (54, 'backward throw', 'throw'),
    (54, 'up throw', 'throw'),
    (54, 'down throw', 'throw');

INSERT INTO public.grappling AS "palutena"
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

INSERT INTO public.movements AS "palutena"
  ("fighterId", "name", "type")
  VALUES
    (54, 'spot dodge', 'movement'),
    (54, 'forward roll', 'movement'),
    (54, 'backwards roll', 'movement'),
    (54, 'neutral air dodge', 'movement'),
    (54, 'air dodge, down', 'movement'),
    (54, 'air dodge, side + down', 'movement'),
    (54, 'air dodge, left/right', 'movement'),
    (54, 'air dodge, side + up', 'movement'),
    (54, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "palutena"
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

INSERT INTO public.stats AS "palutena"
  ("fighterId", "name", "type")
  VALUES
    (54, 'weight', 'stat'),
    (54, 'gravity', 'stat'),
    (54, 'walk speed', 'stat'),
    (54, 'run speed', 'stat'),
    (54, 'initial dash', 'stat'),
    (54, 'air speed', 'stat'),
    (54, 'total air acceleration', 'stat'),
    (54, 'sh / fh / shff / fhff', 'stat'),
    (54, 'fall speed/fast fall speed', 'stat'),
    (54, 'out of shield, ', 'stat'),
    (54, 'out of shield, ', 'stat'),
    (54, 'out of shield, ', 'stat'),
    (54, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "palutena"
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
