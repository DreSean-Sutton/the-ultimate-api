INSERT INTO public.moves AS "miiBrawler"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (45, 'jab 1', 'single', 'move'),
    (45, 'jab 2', 'single', 'move'),
    (45, 'jab 3', 'single', 'move'),
    (45, 'rapid jab', 'multi', 'move'),
    (45, 'rapid jab finisher', 'single', 'move'),
    (45, 'forward tilt', '', 'move'),
    (45, 'up tilt', '', 'move'),
    (45, 'down tilt', '', 'move'),
    (45, 'dash attack', '', 'move'),
    (45, 'forward smash', '', 'move'),
    (45, 'up smash', '', 'move'),
    (45, 'down smash', '', 'move'),
    (45, 'neutral air', '', 'move'),
    (45, 'forward air', '', 'move'),
    (45, 'back air', '', 'move'),
    (45, 'up air', '', 'move'),
    (45, 'down air', '', 'move'),
    (45, 'neutral b', '', 'move'),
    (45, 'side b', '', 'move'),
    (45, 'up b', '', 'move'),
    (45, 'down b', '', 'move');

INSERT INTO public.hitboxes AS "miiBrawler"
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

INSERT INTO public.throws AS "miiBrawler"
  ("fighterId", "name", "type")
  VALUES
    (45, 'grab', 'throw'),
    (45, 'dash grab', 'throw'),
    (45, 'pivot grab', 'throw'),
    (45, 'pummel', 'throw'),
    (45, 'forward throw', 'throw'),
    (45, 'backward throw', 'throw'),
    (45, 'up throw', 'throw'),
    (45, 'down throw', 'throw');

INSERT INTO public.grappling AS "miiBrawler"
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

INSERT INTO public.movements AS "miiBrawler"
  ("fighterId", "name", "type")
  VALUES
    (45, 'spot dodge', 'movement'),
    (45, 'forward roll', 'movement'),
    (45, 'backwards roll', 'movement'),
    (45, 'neutral air dodge', 'movement'),
    (45, 'air dodge, down', 'movement'),
    (45, 'air dodge, side + down', 'movement'),
    (45, 'air dodge, left/right', 'movement'),
    (45, 'air dodge, side + up', 'movement'),
    (45, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "miiBrawler"
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

INSERT INTO public.stats AS "miiBrawler"
  ("fighterId", "name", "type")
  VALUES
    (45, 'weight', 'stat'),
    (45, 'gravity', 'stat'),
    (45, 'walk speed', 'stat'),
    (45, 'run speed', 'stat'),
    (45, 'initial dash', 'stat'),
    (45, 'air speed', 'stat'),
    (45, 'total air acceleration', 'stat'),
    (45, 'sh / fh / shff / fhff', 'stat'),
    (45, 'fall speed/fast fall speed', 'stat'),
    (45, 'out of shield, ', 'stat'),
    (45, 'out of shield, ', 'stat'),
    (45, 'out of shield, ', 'stat'),
    (45, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "miiBrawler"
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
