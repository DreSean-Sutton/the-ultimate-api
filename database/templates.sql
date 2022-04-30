INSERT INTO public.moves AS "template"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (, 'jab 1', 'single', 'move'),
    (, 'jab 2', 'single', 'move'),
    (, 'jab 3', 'single', 'move'),
    (, 'rapid jab', 'multi', 'move'),
    (, 'rapid jab finisher', 'single', 'move'),
    (, 'forward tilt', '', 'move'),
    (, 'up tilt', '', 'move'),
    (, 'down tilt', '', 'move'),
    (, 'dash attack', '', 'move'),
    (, 'forward smash', '', 'move'),
    (, 'up smash', '', 'move'),
    (, 'down smash', '', 'move'),
    (, 'neutral air', '', 'move'),
    (, 'forward air', '', 'move'),
    (, 'back air', '', 'move'),
    (, 'up air', '', 'move'),
    (, 'down air', '', 'move'),
    (, 'neutral b', '', 'move'),
    (, 'side b', '', 'move'),
    (, 'up b', '', 'move'),
    (, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "template"
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

INSERT INTO public.throws AS "template"
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

INSERT INTO public.grappling AS "template"
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

INSERT INTO public.movements AS "template"
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

INSERT INTO public.dodging AS "template"
  ("activeFrames", "totalFrames")
  VALUES
    ('', '20/25'),
    ('', ''),
    ('', ''),
    ('', ''),
    ('same', ''),
    ('same', ''),
    ('same', ''),
    ('same', ''),
    ('same', '');

INSERT INTO public.stats AS "template"
  ("fighterId", "name", "type")
  VALUES
    (, 'weight', 'stat'),
    (, 'gravity', 'stat'),
    (, 'walk speed', 'stat'),
    (, 'run speed', 'stat'),
    (, 'initial dash', 'stat'),
    (, 'air speed', 'stat'),
    (, 'total air acceleration', 'stat'),
    (, 'sh/fh/shff/fhff', 'stat'),
    (, 'fall speed/fast fall speed', 'stat'),
    (, 'out of shield, neutral air/up smash', 'stat'),
    (, 'out of shield, back air', 'stat'),
    (, 'out of shield, up b', 'stat'),
    (, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "template"
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
