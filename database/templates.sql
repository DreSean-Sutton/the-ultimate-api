INSERT INTO public.moves AS "mr.game&watch"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (49, 'jab 1', 'single', 'move'),
    (49, 'jab 2', 'single', 'move'),
    (49, 'jab 3', 'single', 'move'),
    (49, 'rapid jab', 'multi', 'move'),
    (49, 'rapid jab finisher', 'single', 'move'),
    (49, 'forward tilt', '', 'move'),
    (49, 'up tilt', '', 'move'),
    (49, 'down tilt', '', 'move'),
    (49, 'dash attack', '', 'move'),
    (49, 'forward smash', '', 'move'),
    (49, 'up smash', '', 'move'),
    (49, 'down smash', '', 'move'),
    (49, 'neutral air', '', 'move'),
    (49, 'forward air', '', 'move'),
    (49, 'back air', '', 'move'),
    (49, 'up air', '', 'move'),
    (49, 'down air', '', 'move'),
    (49, 'neutral b', '', 'move'),
    (49, 'side b', '', 'move'),
    (49, 'up b', '', 'move'),
    (49, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "mr.game&watch"
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

INSERT INTO public.throws AS "mr.game&watch"
  ("fighterId", "name", "type")
  VALUES
    (49, 'grab', 'throw'),
    (49, 'dash grab', 'throw'),
    (49, 'pivot grab', 'throw'),
    (49, 'pummel', 'throw'),
    (49, 'forward throw', 'throw'),
    (49, 'backward throw', 'throw'),
    (49, 'up throw', 'throw'),
    (49, 'down throw', 'throw');

INSERT INTO public.grappling AS "mr.game&watch"
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

INSERT INTO public.movements AS "mr.game&watch"
  ("fighterId", "name", "type")
  VALUES
    (49, 'spot dodge', 'movement'),
    (49, 'forward roll', 'movement'),
    (49, 'backwards roll', 'movement'),
    (49, 'neutral air dodge', 'movement'),
    (49, 'air dodge, down', 'movement'),
    (49, 'air dodge, side + down', 'movement'),
    (49, 'air dodge, left/right', 'movement'),
    (49, 'air dodge, side + up', 'movement'),
    (49, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "mr.game&watch"
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

INSERT INTO public.stats AS "mr.game&watch"
  ("fighterId", "name", "type")
  VALUES
    (49, 'weight', 'stat'),
    (49, 'gravity', 'stat'),
    (49, 'walk speed', 'stat'),
    (49, 'run speed', 'stat'),
    (49, 'initial dash', 'stat'),
    (49, 'air speed', 'stat'),
    (49, 'total air acceleration', 'stat'),
    (49, 'sh / fh / shff / fhff', 'stat'),
    (49, 'fall speed/fast fall speed', 'stat'),
    (49, 'out of shield, ', 'stat'),
    (49, 'out of shield, ', 'stat'),
    (49, 'out of shield, ', 'stat'),
    (49, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "mr.game&watch"
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
