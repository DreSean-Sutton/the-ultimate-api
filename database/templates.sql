INSERT INTO public.moves AS "fighterName"
  ("fighterId", "name", "moveType", "type", "category")
  VALUES
    (, 'jab 1', 'single', 'move', 'ground'),
    (, 'jab 2', 'single', 'move', 'ground'),
    (, 'jab 3', 'single', 'move', 'ground'),
    (, 'rapid jab', 'multi', 'move', 'ground'),
    (, 'rapid jab finisher', 'single', 'move', 'ground'),
    (, 'forward tilt', '', 'move', 'ground'),
    (, 'up tilt', '', 'move', 'ground'),
    (, 'down tilt', '', 'move', 'ground'),
    (, 'dash attack', '', 'move', 'ground'),
    (, 'forward smash', '', 'move', 'ground'),
    (, 'up smash', '', 'move', 'ground'),
    (, 'down smash', '', 'move', 'ground'),
    (, 'neutral air', '', 'move', 'aerial'),
    (, 'forward air', '', 'move', 'aerial'),
    (, 'back air', '', 'move', 'aerial'),
    (, 'up air', '', 'move', 'aerial'),
    (, 'down air', '', 'move', 'aerial'),
    (, 'neutral b', '', 'move', 'special'),
    (, 'side b', '', 'move', 'special'),
    (, 'up b', '', 'move', 'special'),
    (, 'down b', '', 'move', 'special');

INSERT INTO public.hitboxes AS "fighterName"
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

INSERT INTO public.throws AS "fighterName"
  ("fighterId", "name", "type")
  VALUES
    (, 'grab', 'throw'),
    (, 'dash grab', 'throw'),
    (, 'pivot grab', 'throw'),
    (, 'pummel', 'throw'),
    (, 'forward throw', 'throw'),
    (, 'backward throw', 'throw'),
    (, 'up throw', 'throw'),
    (, 'down throw', 'throw');

INSERT INTO public.grappling AS "fighterName"
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

INSERT INTO public.movements AS "fighterName"
  ("fighterId", "name", "type")
  VALUES
    (, 'spot dodge', 'movement'),
    (, 'forward roll', 'movement'),
    (, 'backwards roll', 'movement'),
    (, 'neutral air dodge', 'movement'),
    (, 'air dodge, down', 'movement'),
    (, 'air dodge, side + down', 'movement'),
    (, 'air dodge, left/right', 'movement'),
    (, 'air dodge, side + up', 'movement'),
    (, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "fighterName"
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

INSERT INTO public.stats AS "fighterName"
  ("fighterId", "name", "type")
  VALUES
    (, 'weight', 'stat'),
    (, 'gravity', 'stat'),
    (, 'walk speed', 'stat'),
    (, 'run speed', 'stat'),
    (, 'initial dash', 'stat'),
    (, 'air speed', 'stat'),
    (, 'total air acceleration', 'stat'),
    (, 'sh / fh / shff / fhff', 'stat'),
    (, 'fall speed/fast fall speed', 'stat'),
    (, 'out of shield, ', 'stat'),
    (, 'out of shield, ', 'stat'),
    (, 'out of shield, ', 'stat'),
    (, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "fighterName"
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
