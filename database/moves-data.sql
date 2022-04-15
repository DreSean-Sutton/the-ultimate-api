INSERT INTO public.moves AS "banjo"
  ("fighter_id", "name", "move_type")
  VALUES
    (1, 'jab 1', 'single'),
    (1, 'jab 2', 'single'),
    (1, 'jab 3', 'single'),
    (1, 'rapid jab', 'multi'),
    (1, 'rapid jab finisher', 'single'),
    (1, 'forward tilt', 'sweet/close'),
    (1, 'up tilt', 'single'),
    (1, 'down tilt', 'sweet/close/late'),
    (1, 'dash attack', 'early/late'),
    (1, 'forward smash', 'single'),
    (1, 'up smash', 'first/multi/final'),
    (1, 'down smash', 'single'),
    (1, 'neutral air', 'multi/final'),
    (1, 'forward air', 'early/late'),
    (1, 'back air', 'multi/final'),
    (1, 'up air', 'first/second'),
    (1, 'down air', 'falling/landing'),
    (1, 'neutral b', 'early/late/latest'),
    (1, 'side b', 'early/late'),
    (1, 'up b', '(charged)'),
    (1, 'down b', 'contact/explosion');

INSERT INTO public.moves AS "bayonetta"
  ("fighter_id", "name", "move_type")
  VALUES
    (2, 'jab 1', 'single'),
    (2, 'jab 2', 'single'),
    (2, 'jab 3', 'single'),
    (2, 'rapid jab', 'single/multi'),
    (2, 'rapid jab finisher', 'single'),
    (2, 'forward tilt 1', 'single'),
    (2, 'forward tilt 2', 'single'),
    (2, 'forward tilt 3', 'single'),
    (2, 'up tilt', 'single/single/final'),
    (2, 'down tilt', 'close/sweet'),
    (2, 'dash attack', 'early/late'),
    (2, 'forward smash', 'sweet/close'),
    (2, 'up smash', 'early/late/latest'),
    (2, 'down smash', 'stomp/early/late'),
    (2, 'neutral air', 'early/late/(extended)'),
    (2, 'forward air 1', 'single'),
    (2, 'forward air 2', 'single'),
    (2, 'forward air 3', 'single'),
    (2, 'back air', 'sweet/close'),
    (2, 'up air', 'single/(extended)'),
    (2, 'down air', 'closest/close/sweet/landing'),
    (2, 'neutral b', 'multi'),
    (2, 'neutral b (charged)', 'multi'),
    (2, 'side b, grounded', 'early/late (second)'),
    (2, 'afterburner kick, up', 'early/late/latest'),
    (2, 'afterburner kick, down', 'normal/landing'),
    (2, 'up b', 'first/multi/final'),
    (2, 'down b', 'counter');

INSERT INTO public.moves AS "bowser"
  ("fighter_id", "name", "move_type")
  VALUES
    (3, 'jab 1', 'single'),
    (3, 'jab 2', 'single'),
    (3, 'forward tilt', 'first'),
    (3, 'up tilt', 'single'),
    (3, 'down tilt', 'first/second'),
    (3, 'dash attack', 'early/late'),
    (3, 'forward smash', 'early/late'),
    (3, 'up smash', 'sweet/sour/landing'),
    (3, 'down smash', 'front/back'),
    (3, 'neutral air', 'multis'),
    (3, 'forward air', 'sweet/close'),
    (3, 'back air', 'single'),
    (3, 'up air', 'single'),
    (3, 'down air', 'normal/landing'),
    (3, 'neutral b', 'multi'),
    (3, 'side b', 'command grab'),
    (3, 'up b, grounded', 'multi/final'),
    (3, 'up b, air', 'first/multi/final'),
    (3, 'down b, grounded', 'rising/falling/landing'),
    (3, 'down b, air', 'falling/landing');

INSERT INTO public.moves AS "bowserJr"
  ("fighter_id", "name", "move_type")
  VALUES
    (4, 'jab 1', 'single'),
    (4, 'jab 2', 'single'),
    (4, 'rapid jab', 'multi'),
    (4, 'rapid jab finisher', 'single'),
    (4, 'forward tilt', 'close/sweet'),
    (4, 'up tilt', 'single'),
    (4, 'down tilt', 'multi/final'),
    (4, 'dash attack', 'multi/final'),
    (4, 'forward smash', 'multi/final'),
    (4, 'up smash', 'first/multi/final'),
    (4, 'down smash', 'single'),
    (4, 'neutral air', 'close (early/late/latest/far)(early/late/later)'),
    (4, 'forward air', 'early far/early close (mid far/mid close)(late fair/late close)/landiing'),
    (4, 'back air', 'early far/late far/close'),
    (4, 'up air', 'early/late'),
    (4, 'down air', 'multi/final/landing'),
    (4, 'neutral b', 'early/late'),
    (4, 'side b, dash', 'single'),
    (4, 'side b, spinout', 'early-latest'),
    (4, 'up b, recovery', 'contact/explosion'),
    (4, 'up b, hammer', 'front/back'),
    (4, 'down b', 'explosion');

INSERT INTO public.moves AS "byleth"
  ("fighter_id", "name", "move_type")
  VALUES
    (5, 'jab 1', 'single'),
    (5, 'jab 2', 'single'),
    (5, 'jab 3', 'single'),
    (5, 'rapid jab', 'multi'),
    (5, 'rapid jab finisher', 'single'),
    (5, 'forward tilt', 'single'),
    (5, 'up tilt', 'single'),
    (5, 'down tilt', 'single'),
    (5, 'dash attack', 'close/sweet'),
    (5, 'forward smash', 'close/sweet (normal)(down)(up)'),
    (5, 'up smash', 'first/multi/final'),
    (5, 'down smash', 'front/back'),
    (5, 'neutral air', 'multi/final/landing'),
    (5, 'forward air', 'sweet/close'),
    (5, 'back air', 'early sweet/close (late sweet/close)'),
    (5, 'up air', 'multi/final'),
    (5, 'down air', 'single'),
    (5, 'neutral b', 'normal/charged'),
    (5, 'side b', 'sweet/close (air)'),
    (5, 'up b', 'hit/grab/final (air)'),
    (5, 'down b', 'single/shockwave (air)');

INSERT INTO public.moves AS "captainFalcon"
  ("fighter_id", "name", "move_type")
  VALUES
    (6, 'jab 1', 'single'),
    (6, 'jab 2', 'single'),
    (6, 'jab 3', 'single'),
    (6, 'rapid jab', 'multi'),
    (6, 'rapid jab finisher', 'single'),
    (6, 'forward tilt', 'close/sweet'),
    (6, 'up tilt', 'single'),
    (6, 'down tilt', 'single'),
    (6, 'dash attack', 'early/late'),
    (6, 'forward smash', 'no angle/angled'),
    (6, 'up smash', 'close/sweet/second'),
    (6, 'down smash', 'front/back'),
    (6, 'neutral air', 'first/second'),
    (6, 'forward air', 'sweet/close (late)'),
    (6, 'back air', 'early/late'),
    (6, 'up air', 'close/far/late'),
    (6, 'down air', 'single'),
    (6, 'neutral b', 'ground/reverse (air/reverse)'),
    (6, 'side b', 'point blank/full'),
    (6, 'side b', 'point blank/full'),
    (6, 'up b', 'grab/launch'),
    (6, 'down b', 'early/late/latest'),
    (6, 'down b', 'early/late/latest/landing');

INSERT INTO public.moves AS "chrom"
  ("fighter_id", "name", "move_type")
  VALUES
    (7, 'jab', 'single'),
    (7, 'forward tilt', 'single'),
    (7, 'up tilt', 'early/normal/late'),
    (7, 'down tilt', 'single'),
    (7, 'dash attack', 'single'),
    (7, 'forward smash', 'single'),
    (7, 'up smash', 'first/(multi)/final'),
    (7, 'down smash', 'front/back'),
    (7, 'neutral air', 'first/second'),
    (7, 'forward air', 'single'),
    (7, 'back air', 'single'),
    (7, 'up air', 'single'),
    (7, 'down air', 'sweet/sour'),
    -- (7, 'neutral b', 'multi'),
    (7, 'side b: 1', 'single'),
    (7, 'side b: 2, neutral', 'single'),
    (7, 'side b: 3, neutral', 'single'),
    (7, 'side b: 4, neutral', 'single'),
    (7, 'side b: 2, up', 'single'),
    (7, 'side b: 3, up', 'single'),
    (7, 'side b: 4, up', 'single'),
    (7, 'side b: 3, down', 'single'),
    (7, 'side b: 4, down', 'single'),
    (7, 'up b', 'first/multi/falling/landing'),
    (7, 'down b, counter', 'counter'),
    (7, 'down b, attack', 'counter attack');

INSERT INTO public.moves AS "inkling"
  ("fighter_id", "name", "move_type")
  VALUES
    (8, 'jab 1', 'single'),
    (8, 'jab 2', 'single'),
    (8, 'jab 3', 'single'),
    (8, 'rapid jab', 'multi'),
    (8, 'rapid jab finisher', 'single'),
    (8, 'forward tilt', 'single'),
    (8, 'up tilt', 'single'),
    (8, 'down tilt', 'first/second'),
    (8, 'dash attack', 'early/late'),
    (8, 'forward smash', 'close/sweet'),
    (8, 'up smash', 'first/close/far'),
    (8, 'down smash', '(front)(back)'),
    (8, 'neutral air', 'single'),
    (8, 'forward air', 'sweet/early/late'),
    (8, 'back air', 'sweet/close'),
    (8, 'up air', 'first/second'),
    (8, 'down air', 'sweet/close'),
    (8, 'neutral b', 'multi'),
    (8, 'side b', 'air/grounded'),
    (8, 'up b', 'grounded/air/landing'),
    (8, 'down b', 'charge');

INSERT INTO public.moves AS "joker"
  ("fighter_id", "name", "move_type")
  VALUES
    (9, 'jab 1', 'single (arsene)'),
    (9, 'jab 2', 'single (arsene)'),
    (9, 'jab 3', 'single (arsene)'),
    (9, 'forward tilt', 'first/second (arsene)'),
    (9, 'up tilt', 'first/multi/final'),
    (9, 'down tilt', 'late/early'),
    (9, 'dash attack', 'first/second'),
    (9, 'forward smash', 'single'),
    (9, 'up smash', 'single'),
    (9, 'down smash', 'front/back'),
    (9, 'neutral air', 'single (front/back)'),
    (9, 'forward air', 'first/second'),
    (9, 'back air', 'single'),
    (9, 'up air', 'multi/final'),
    (9, 'down air', 'single (Arsene: first/second'),
    (9, 'neutral b', 'close/med/far'),
    (9, 'side b', 'contact/erupt'),
    (9, 'side b, arsene', 'contact/erupt'),
    (9, 'up b (grappling hook)', 'recovery'),
    (9, 'up b (grappling attack)', 'grounded/air'),
    (9, 'down b, rebel''s guard', 'minimal/additional endlag'),
    (9, 'down b, counterattack', 'counter'),
    (9, 'down b, arsene', 'multiplier (minimum/maximum)');
