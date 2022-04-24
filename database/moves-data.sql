INSERT INTO public.moves AS "banjo"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (1, 'jab 1', 'single', 'move'),
    (1, 'jab 2', 'single', 'move'),
    (1, 'jab 3', 'single', 'move'),
    (1, 'rapid jab', 'multi', 'move'),
    (1, 'rapid jab finisher', 'single', 'move'),
    (1, 'forward tilt', 'sweet/close', 'move'),
    (1, 'up tilt', 'single', 'move'),
    (1, 'down tilt', 'sweet/close/late', 'move'),
    (1, 'dash attack', 'early/late', 'move'),
    (1, 'forward smash', 'single', 'move'),
    (1, 'up smash', 'first/multi/final', 'move'),
    (1, 'down smash', 'single', 'move'),
    (1, 'neutral air', 'multi/final', 'move'),
    (1, 'forward air', 'early/late', 'move'),
    (1, 'back air', 'multi/final', 'move'),
    (1, 'up air', 'first/second', 'move'),
    (1, 'down air', 'falling/landing', 'move'),
    (1, 'neutral b', 'early/late/latest', 'move'),
    (1, 'side b', 'early/late', 'move'),
    (1, 'up b', '(charged)', 'move'),
    (1, 'down b', 'contact/explosion', 'move');

INSERT INTO public.moves AS "bayonetta"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (2, 'jab 1', 'single', 'move'),
    (2, 'jab 2', 'single', 'move'),
    (2, 'jab 3', 'single', 'move'),
    (2, 'rapid jab', 'single/multi', 'move'),
    (2, 'rapid jab finisher', 'single', 'move'),
    (2, 'forward tilt 1', 'single', 'move'),
    (2, 'forward tilt 2', 'single', 'move'),
    (2, 'forward tilt 3', 'single', 'move'),
    (2, 'up tilt', 'single/single/final', 'move'),
    (2, 'down tilt', 'close/sweet', 'move'),
    (2, 'dash attack', 'early/late', 'move'),
    (2, 'forward smash', 'sweet/close', 'move'),
    (2, 'up smash', 'early/late/latest', 'move'),
    (2, 'down smash', 'stomp/early/late', 'move'),
    (2, 'neutral air', 'early/late/(extended)', 'move'),
    (2, 'forward air 1', 'single', 'move'),
    (2, 'forward air 2', 'single', 'move'),
    (2, 'forward air 3', 'single', 'move'),
    (2, 'back air', 'sweet/close', 'move'),
    (2, 'up air', 'single/(extended)', 'move'),
    (2, 'down air', 'closest/close/sweet/landing', 'move'),
    (2, 'neutral b', 'multi', 'move'),
    (2, 'neutral b (charged)', 'multi', 'move'),
    (2, 'side b, grounded', 'early/late (second)', 'move'),
    (2, 'afterburner kick, up', 'early/late/latest', 'move'),
    (2, 'afterburner kick, down', 'normal/landing', 'move'),
    (2, 'up b', 'first/multi/final', 'move'),
    (2, 'down b', 'counter', 'move');

INSERT INTO public.moves AS "bowser"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (3, 'jab 1', 'single', 'move'),
    (3, 'jab 2', 'single', 'move'),
    (3, 'forward tilt', 'first', 'move'),
    (3, 'up tilt', 'single', 'move'),
    (3, 'down tilt', 'first/second', 'move'),
    (3, 'dash attack', 'early/late', 'move'),
    (3, 'forward smash', 'early/late', 'move'),
    (3, 'up smash', 'sweet/sour/landing', 'move'),
    (3, 'down smash', 'front/back', 'move'),
    (3, 'neutral air', 'multis', 'move'),
    (3, 'forward air', 'sweet/close', 'move'),
    (3, 'back air', 'single', 'move'),
    (3, 'up air', 'single', 'move'),
    (3, 'down air', 'normal/landing', 'move'),
    (3, 'neutral b', 'multi', 'move'),
    (3, 'side b', 'command grab', 'move'),
    (3, 'up b, grounded', 'multi/final', 'move'),
    (3, 'up b, air', 'first/multi/final', 'move'),
    (3, 'down b, grounded', 'rising/falling/landing', 'move'),
    (3, 'down b, air', 'falling/landing', 'move');

INSERT INTO public.moves AS "bowserJr"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (4, 'jab 1', 'single', 'move'),
    (4, 'jab 2', 'single', 'move'),
    (4, 'rapid jab', 'multi', 'move'),
    (4, 'rapid jab finisher', 'single', 'move'),
    (4, 'forward tilt', 'close/sweet', 'move'),
    (4, 'up tilt', 'single', 'move'),
    (4, 'down tilt', 'multi/final', 'move'),
    (4, 'dash attack', 'multi/final', 'move'),
    (4, 'forward smash', 'multi/final', 'move'),
    (4, 'up smash', 'first/multi/final', 'move'),
    (4, 'down smash', 'single', 'move'),
    (4, 'neutral air', 'close (early/late/latest/far)(early/late/later)', 'move'),
    (4, 'forward air', 'early far/early close (mid far/mid close)(late fair/late close)/landiing', 'move'),
    (4, 'back air', 'early far/late far/close', 'move'),
    (4, 'up air', 'early/late', 'move'),
    (4, 'down air', 'multi/final/landing', 'move'),
    (4, 'neutral b', 'early/late', 'move'),
    (4, 'side b, dash', 'single', 'move'),
    (4, 'side b, spinout', 'early-latest', 'move'),
    (4, 'up b, recovery', 'contact/explosion', 'move'),
    (4, 'up b, hammer', 'front/back', 'move'),
    (4, 'down b', 'explosion', 'move');

INSERT INTO public.moves AS "byleth"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (5, 'jab 1', 'single', 'move'),
    (5, 'jab 2', 'single', 'move'),
    (5, 'jab 3', 'single', 'move'),
    (5, 'rapid jab', 'multi', 'move'),
    (5, 'rapid jab finisher', 'single', 'move'),
    (5, 'forward tilt', 'single', 'move'),
    (5, 'up tilt', 'single', 'move'),
    (5, 'down tilt', 'single', 'move'),
    (5, 'dash attack', 'close/sweet', 'move'),
    (5, 'forward smash', 'close/sweet (normal)(down)(up)', 'move'),
    (5, 'up smash', 'first/multi/final', 'move'),
    (5, 'down smash', 'front/back', 'move'),
    (5, 'neutral air', 'multi/final/landing', 'move'),
    (5, 'forward air', 'sweet/close', 'move'),
    (5, 'back air', 'early sweet/close (late sweet/close)', 'move'),
    (5, 'up air', 'multi/final', 'move'),
    (5, 'down air', 'single', 'move'),
    (5, 'neutral b', 'normal/charged', 'move'),
    (5, 'side b', 'sweet/close (air)', 'move'),
    (5, 'up b', 'hit/grab/final (air)', 'move'),
    (5, 'down b', 'single/shockwave (air)', 'move');

INSERT INTO public.moves AS "captainFalcon"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (6, 'jab 1', 'single', 'move'),
    (6, 'jab 2', 'single', 'move'),
    (6, 'jab 3', 'single', 'move'),
    (6, 'rapid jab', 'multi', 'move'),
    (6, 'rapid jab finisher', 'single', 'move'),
    (6, 'forward tilt', 'close/sweet', 'move'),
    (6, 'up tilt', 'single', 'move'),
    (6, 'down tilt', 'single', 'move'),
    (6, 'dash attack', 'early/late', 'move'),
    (6, 'forward smash', 'no angle/angled', 'move'),
    (6, 'up smash', 'close/sweet/second', 'move'),
    (6, 'down smash', 'front/back', 'move'),
    (6, 'neutral air', 'first/second', 'move'),
    (6, 'forward air', 'sweet/close (late)', 'move'),
    (6, 'back air', 'early/late', 'move'),
    (6, 'up air', 'close/far/late', 'move'),
    (6, 'down air', 'single', 'move'),
    (6, 'neutral b', 'ground/reverse (air/reverse)', 'move'),
    (6, 'side b, ground', 'point blank/full', 'move'),
    (6, 'side b, air', 'point blank/full', 'move'),
    (6, 'up b', 'grab/launch', 'move'),
    (6, 'down b, ground', 'early/late/latest', 'move'),
    (6, 'down b, air', 'early/late/latest/landing', 'move');

INSERT INTO public.moves AS "chrom"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (7, 'jab', 'single', 'move'),
    (7, 'forward tilt', 'single', 'move'),
    (7, 'up tilt', 'early/normal/late', 'move'),
    (7, 'down tilt', 'single', 'move'),
    (7, 'dash attack', 'single', 'move'),
    (7, 'forward smash', 'single', 'move'),
    (7, 'up smash', 'first/(multi)/final', 'move'),
    (7, 'down smash', 'front/back', 'move'),
    (7, 'neutral air', 'first/second', 'move'),
    (7, 'forward air', 'single', 'move'),
    (7, 'back air', 'single', 'move'),
    (7, 'up air', 'single', 'move'),
    (7, 'down air', 'sweet/sour', 'move'),
    (7, 'neutral b', '(earliest/latest)', 'move'),
    (7, 'side b (hit 1)', 'single', 'move'),
    (7, 'side b (hit 2), neutral', 'single', 'move'),
    (7, 'side b (hit 3), neutral', 'single', 'move'),
    (7, 'side b (hit 4), neutral', 'single', 'move'),
    (7, 'side b (hit 2), up', 'single', 'move'),
    (7, 'side b (hit 3), up', 'single', 'move'),
    (7, 'side b (hit 4), up', 'single', 'move'),
    (7, 'side b (hit 3), down', 'single', 'move'),
    (7, 'side b (hit 4), down', 'single', 'move'),
    (7, 'up b', 'first/multi/falling/landing', 'move'),
    (7, 'down b, counter', 'counter', 'move'),
    (7, 'down b, attack', 'counter attack', 'move');

INSERT INTO public.moves AS "cloud"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (8, 'jab 1', 'single', 'move'),
    (8, 'jab 2', 'single', 'move'),
    (8, 'jab 3', 'single', 'move'),
    (8, 'forward tilt', 'single', 'move'),
    (8, 'up tilt', 'single', 'move'),
    (8, 'down tilt', 'first/second', 'move'),
    (8, 'dash attack', 'early/late', 'move'),
    (8, 'forward smash', 'first/second/(final close/far', 'move'),
    (8, 'up smash', 'early/late', 'move'),
    (8, 'down smash', 'front/back', 'move'),
    (8, 'neutral air', 'single', 'move'),
    (8, 'forward air', 'early/tipper/late', 'move'),
    (8, 'back air', 'single', 'move'),
    (8, 'up air', 'early/late', 'move'),
    (8, 'down air', 'early/late', 'move'),
    (8, 'neutral b', 'early/late (air early/late)', 'move'),
    (8, 'neutral b, limit', 'first/multi/final', 'move'),
    (8, 'side b, (hit 1)', 'single', 'move'),
    (8, 'side b, (hit 2)', 'single', 'move'),
    (8, 'side b, (hit 3)', 'first/second/third', 'move'),
    (8, 'side b, limit', 'hits 1-2/3-4/final', 'move'),
    (8, 'up b, rising', 'first/second', 'move'),
    (8, 'up b, falling', 'first/landing', 'move'),
    (8, 'up b, limit', 'falling/landing', 'move'),
    (8, 'down b, charged', 'ground (air)', 'move');

INSERT INTO public.moves AS "corrin"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (9, 'jab 1', 'close/tipper', 'move'),
    (9, 'jab 2', 'single', 'move'),
    (9, 'jab 3', 'close/tipper', 'move'),
    (9, 'rapid jab', 'multi', 'move'),
    (9, 'rapid jab finisher', 'single', 'move'),
    (9, 'forward tilt', 'single', 'move'),
    (9, 'up tilt', 'single', 'move'),
    (9, 'down tilt', 'single', 'move'),
    (9, 'dash attack', '(multi)/final', 'move'),
    (9, 'forward smash', 'charging/close/far/tipper', 'move'),
    (9, 'up smash', 'close/far/tipper', 'move'),
    (9, 'down smash', 'front/back/tipper', 'move'),
    (9, 'neutral air', 'early/late', 'move'),
    (9, 'forward air', 'single', 'move'),
    (9, 'back air', 'early/late', 'move'),
    (9, 'up air', 'first', 'move'),
    (9, 'down air', 'falling/landing', 'move'),
    (9, 'neutral b, projectile', 'charge/release', 'move'),
    (9, 'neutral b, chomp', 'charge/release', 'move'),
    (9, 'side b, pin', 'single', 'move'),
    (9, 'side b, pin (air)', 'close/tipper', 'move'),
    (9, 'side b, pin cancel', 'ground contact/air contact', 'move'),
    (9, 'side b, pin jump', null, 'move'),
    (9, 'side b, pin kick', 'early/late (over edge)', 'move'),
    (9, 'side b, back kick', 'early/late (over edge)', 'move'),
    (9, 'up b', 'first/(multi)/final', 'move'),
    (9, 'down b', 'counter', 'move'),
    (9, 'down b', 'counter attack', 'move');

INSERT INTO public.moves AS "daisy"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (10, 'jab 1', 'single', 'move'),
    (10, 'jab 2', 'single', 'move'),
    (10, 'forward tilt', 'close/mid hit/late', 'move'),
    (10, 'up tilt', 'close/far', 'move'),
    (10, 'down tilt', 'single', 'move'),
    (10, 'dash attack', 'first/second', 'move'),
    (10, 'forward smash', 'golf/tennis/pan', 'move'),
    (10, 'up smash', 'early tip/early hand/early sides/late tip/late hand', 'move'),
    (10, 'down smash', 'multi/final', 'move'),
    (10, 'neutral air', 'early/late hands/late hips', 'move'),
    (10, 'forward air', 'close/far', 'move'),
    (10, 'back air', 'early/late', 'move'),
    (10, 'up air', 'first/second', 'move'),
    (10, 'down air', 'multi far/multi close/final', 'move'),
    (10, 'neutral b', 'counter', 'move'),
    (10, 'neutral b', 'counter attack', 'move'),
    (10, 'side b, ground', '(endlag on hit) normal/over edge', 'move'),
    (10, 'side b, air', '(endlag on hit)', 'move'),
    (10, 'up b', 'first/multi/final', 'move'),
    (10, 'down b', 'slot machine', 'move');

INSERT INTO public.moves AS "darkPit"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (11, 'jab 1', 'single', 'move'),
    (11, 'jab 2', 'single', 'move'),
    (11, 'jab 3', 'single', 'move'),
    (11, 'rapid jab', 'multi', 'move'),
    (11, 'rapid jab finisher', 'single', 'move'),
    (11, 'forward tilt', 'close/tipper', 'move'),
    (11, 'up tilt', 'first/second', 'move'),
    (11, 'down tilt', 'single', 'move'),
    (11, 'dash attack', 'single', 'move'),
    (11, 'forward smash', 'first/second', 'move'),
    (11, 'up smash', 'first/second/third', 'move'),
    (11, 'down smash', 'front/back', 'move'),
    (11, 'neutral air', 'multi/final', 'move'),
    (11, 'forward air', 'multi/final', 'move'),
    (11, 'back air', 'close/tipper', 'move'),
    (11, 'up air', 'multi/final', 'move'),
    (11, 'down air', 'early/late', 'move'),
    (11, 'neutral b', 'ground/ground up/air/air up', 'move'),
    (11, 'side b, ground', 'air/grounded', 'move'),
    (11, 'side b, air', 'air/grounded', 'move'),
    (11, 'up b', 'recovery', 'move'),
    (11, 'down b', 'shield (endlag)', 'move');

INSERT INTO public.moves AS "darkSamus"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (12, 'jab 1', 'single', 'move'),
    (12, 'jab 2', 'single', 'move'),
    (12, 'forward tilt', 'close/middle/far', 'move'),
    (12, 'up tilt', 'late/early', 'move'),
    (12, 'down tilt', 'single', 'move'),
    (12, 'dash attack', 'early/late/latest', 'move'),
    (12, 'forward smash', 'close/far', 'move'),
    (12, 'up smash', 'multi/final', 'move'),
    (12, 'down smash', 'front/back', 'move'),
    (12, 'neutral air', 'hit 1/early hit 2/late', 'move'),
    (12, 'forward air', 'first/multi/final', 'move'),
    (12, 'back air', 'early close/early far/late', 'move'),
    (12, 'up air', 'first/multi/final', 'move'),
    (12, 'down air', 'early/meteor/late', 'move'),
    (12, 'z air', 'first/second', 'move'),
    (12, 'neutral b', '(charge time)', 'move'),
    (12, 'neutral b, full charge', 'single', 'move'),
    (12, 'side b, homing', 'single', 'move'),
    (12, 'side b, super', 'single', 'move'),
    (12, 'up b, ground', 'first/multi/final', 'move'),
    (12, 'up b, air', 'multi', 'move'),
    (12, 'down b', '(total frames: holding down/air)', 'move');

INSERT INTO public.moves AS "diddy"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (13, 'jab 1', 'single', 'move'),
    (13, 'jab 2', 'single', 'move'),
    (13, 'jab 3', 'single', 'move'),
    (13, 'forward tilt', 'early/late', 'move'),
    (13, 'up tilt', 'single', 'move'),
    (13, 'down tilt', 'single', 'move'),
    (13, 'dash attack', 'multi/final', 'move'),
    (13, 'forward smash', 'first/second', 'move'),
    (13, 'up smash', 'first/second/third', 'move'),
    (13, 'down smash', 'front/back', 'move'),
    (13, 'neutral air', 'single', 'move'),
    (13, 'forward air', 'early/late', 'move'),
    (13, 'back air', 'single', 'move'),
    (13, 'up air', 'single', 'move'),
    (13, 'down air', 'early/late', 'move'),
    (13, 'neutral b', 'projectile/melee', 'move'),
    (13, 'neutral b, misfire', 'explosion', 'move'),
    (13, 'side b', 'air/grounded', 'move'),
    (13, 'side b, attack', 'early/late', 'move'),
    (13, 'up b', 'early/late/latest', 'move'),
    (13, 'up b, explosion', 'explosion', 'move'),
    (13, 'down b', 'banana item', 'move');

INSERT INTO public.moves AS "inkling"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (14, 'jab 1', 'single', 'move'),
    (14, 'jab 2', 'single', 'move'),
    (14, 'jab 3', 'single', 'move'),
    (14, 'rapid jab', 'multi', 'move'),
    (14, 'rapid jab finisher', 'single', 'move'),
    (14, 'forward tilt', 'single', 'move'),
    (14, 'up tilt', 'single', 'move'),
    (14, 'down tilt', 'first/second', 'move'),
    (14, 'dash attack', 'early/late', 'move'),
    (14, 'forward smash', 'close/sweet', 'move'),
    (14, 'up smash', 'first/close/far', 'move'),
    (14, 'down smash', '(front)(back)', 'move'),
    (14, 'neutral air', 'single', 'move'),
    (14, 'forward air', 'sweet/early/late', 'move'),
    (14, 'back air', 'sweet/close', 'move'),
    (14, 'up air', 'first/second', 'move'),
    (14, 'down air', 'sweet/close', 'move'),
    (14, 'neutral b', 'multi', 'move'),
    (14, 'side b', 'air/grounded', 'move'),
    (14, 'up b', 'grounded/air/landing', 'move'),
    (14, 'down b', 'charge', 'move');

INSERT INTO public.moves AS "joker"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (15, 'jab 1', 'single (arsene)', 'move'),
    (15, 'jab 2', 'single (arsene)', 'move'),
    (15, 'jab 3', 'single (arsene)', 'move'),
    (15, 'forward tilt', 'first/second (arsene)', 'move'),
    (15, 'up tilt', 'first/multi/final', 'move'),
    (15, 'down tilt', 'late/early', 'move'),
    (15, 'dash attack', 'first/second', 'move'),
    (15, 'forward smash', 'single', 'move'),
    (15, 'up smash', 'single', 'move'),
    (15, 'down smash', 'front/back', 'move'),
    (15, 'neutral air', 'single (front/back)', 'move'),
    (15, 'forward air', 'first/second', 'move'),
    (15, 'back air', 'single', 'move'),
    (15, 'up air', 'multi/final', 'move'),
    (15, 'down air', 'single (Arsene: first/second', 'move'),
    (15, 'neutral b', 'close/med/far', 'move'),
    (15, 'side b', 'contact/erupt', 'move'),
    (15, 'side b, arsene', 'contact/erupt', 'move'),
    (15, 'up b (grappling hook)', 'recovery', 'move'),
    (15, 'up b (grappling attack)', 'grounded/air', 'move'),
    (15, 'down b, rebel''s guard', 'minimal/additional endlag', 'move'),
    (15, 'down b, counterattack', 'counter', 'move'),
    (15, 'down b, arsene', 'multiplier (minimum/maximum)', 'move');
