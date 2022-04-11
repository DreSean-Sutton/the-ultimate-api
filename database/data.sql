INSERT INTO public.fighters ("fighter", "rosterId", "displayName")
  VALUES
    ('banjo', '73', 'banjo & kazooie'),
    ('bayonetta', '63', 'bayonetta'),
    ('inkling', '64', 'inkling'),
    ('joker', '71', 'joker');

INSERT INTO public.moves AS "banjo"
  ("fighterId", "name", "damage", "activeFrames", "totalFrames", "hitboxType")
  VALUES
    (1, 'jab 1', '2.2%', '4-6', '27', 'single'),
    (1, 'jab 2', '2.2%', '4-6', '24', 'single'),
    (1, 'jab 3', '3.8%', '5-7', '31', 'single'),
    (1, 'rapid jab', '0.4%', '5 [rehit: 2]', '--', 'multi'),
    (1, 'rapid jab finisher', '1.6%', '7-8', '41', 'single'),
    (1, 'forward tilt', '9.0/7.0%', '7-9', '28', 'tipper/close'),
    (1, 'up tilt', '10.0%', '11-14', '31', 'single'),
    (1, 'down tilt', '6.0/5.0/4.0%', '12-17/18-21', '37', 'tipper/close/late'),
    (1, 'dash attack', '12.0/8.0%', '9-12/13-20', '36', 'early/late'),
    (1, 'forward smash', '16.0%', '19-21', '52', 'single'),
    (1, 'up smash', '1.0/1.5/3.6%', '9-10/13-25 [rehit: 2]/26-27', '65', 'first/multi/final'),
    (1, 'down smash', '15.0%', '13-17', '46', 'single'),
    (1, 'neutral air', '0.8/4.2%', '10-11(13-14/16-17..)/31-32', '47', 'multi/final'),
    (1, 'forward air', '15.0/12.0%', '15-17/18', '51', 'early/late'),
    (1, 'back air', '1.6/4.8%', '8-9/12-13/16-17', '43', 'multi/final'),
    (1, 'up air', '1.6/5.8%', '7-8/9-11', '33', 'first/second'),
    (1, 'down air', '10.0/2.0%', '15-45/1-2', '56', 'falling/landing'),
    (1, 'neutral special', '5.4/4.6/3.8%', '13-22/23-52/53-102', '49', 'early/late/latest'),
    (1, 'side special', '22.0/16.0%', '18-35/36-53', '82', 'early/late'),
    (1, 'up special', '3.0%', '15(31)', '58', '(charged)'),
    (1, 'down special', '0.5/8.5%', '10-143', '44',  'contact/explosion');

INSERT INTO public.moves AS "bayonetta"
  ("fighterId", "name", "damage", "activeFrames", "totalFrames", "hitboxType")
  VALUES
    (2, 'jab 1', '1.4%', '9-12', '31', 'single'),
    (2, 'jab 2', '1.4%', '7-8', '31', 'single'),
    (2, 'jab 3', '2.2%', '7-8', '39', 'single'),
    (2, 'rapid jab', '0.5/0.2%', '6 [rehit: 4]', '--', 'single/multi'),
    (2, 'rapid jab finisher', '5.0%', '4-5/11-12', '62', 'single'),
    (2, 'forward tilt 1', '3.0%', '12', '31', 'single'),
    (2, 'forward tilt 2', '3.0%', '12', '39', 'single'),
    (2, 'forward tilt 3', '7.0%', '14-15', '39', 'single'),
    (2, 'up tilt', '1.5/6.0%', '7-9/10-12/13-15', '31', 'single/single/final'),
    (2, 'down tilt', '5.0/6.0%', '7-8', '28', 'close/tipper'),
    (2, 'dash attack', '10.0/8.0%', '15-20/21-26', '42', 'early/late'),
    (2, 'forward smash', '16.0/14.0%', '17-21', '66', 'tipper/close'),
    (2, 'up smash', '17.0/16.0/15.0%', '18-19/20-21/22-23', '64', 'early/late/latest'),
    (2, 'down smash', '15.0%', '17-18/22/23-25', '65', 'stomp/early/late'),
    (2, 'neutral air', '8.0/6.0/3.0%', '9-17/18-25 (26-66)', '32', 'early/late/(extended)'),
    (2, 'forward air 1', '4.0%', '7-9', '37', 'single'),
    (2, 'forward air 2', '3.3%', '7-9', '39', 'single'),
    (2, 'forward air 3', '7.0%', '12-15', '46', 'single'),
    (2, 'back air', '13.0/10.0%', '11-14', '34', 'tipper/close'),
    (2, 'up air', '7.5/3.0%', '9-18 (21-65)', '29', 'single/(extended)'),
    (2, 'down air', '7.0/8.0/9.0/5.0%', '18-35/1-2', '52', 'closest/close/tipper/landing'),
    (2, 'neutral special', '1.3%', '17-26/22-31/32-41/37-46..', '75', 'multi'),
    (2, 'neutral special (charged)', '2.7%', '42/47/57/62..', '100', 'multi'),
    -- (2, 'side special (ground)', '8.0/7.0/5.0%', '15-16', '82', 'early/late'),
    (2, 'afterburner kick, up', '6.0/7.0/6.0%', '7-9/10-14/15-19', '31', 'early/late/latest'),
    (2, 'afterburner kick, down', '6.5/5.0%', '8-25/1', '43', 'normal/landing'),
    (2, 'up special', '3.0/0.2/3.0%', '6/11-25 [rehit: 3]/27-28', '31', 'first/multi/final'),
    (2, 'down special', '--', '8-27', '66',  'counter');

INSERT INTO public.moves AS "inkling"
  ("fighterId", "name", "damage", "activeFrames", "totalFrames", "hitboxType")
  VALUES
    (3, 'jab 1', '2.0%', '3-4', '19', 'single'),
    (3, 'jab 2', '2.0%', '2-3', '21', 'single'),
    (3, 'jab 3', '3.5%', '4-5', '29', 'single'),
    (3, 'rapid jab', '0.4%', '4 [rehit: 3]', '--', 'multi'),
    (3, 'rapid jab finisher', '9.0%', '6', '48', 'single'),
    (3, 'forward tilt', '6.0%', '8-10', '34', 'single'),
    (3, 'up tilt', '6.0%', '7-12', '29', 'single'),
    (3, 'down tilt', '3.0/6.0%', '5-8/12-15', '31', 'first/second'),
    (3, 'dash attack', '8.9/6.0%', '6', '48', 'early/late'),
    (3, 'forward smash', '14.0/16.0%', '16-17', '51', 'close/tipper'),
    (3, 'up smash', '4.0/15.0/10.0%', '9-10/18-20', '57', 'first/close/far'),
    (3, 'down smash', '12.5/11.0%', '(11-12/13-15)(20-21/22-24)', '49', '(front)(back)'),
    (3, 'neutral air', '7.0%', '6-9', '31', 'single'),
    (3, 'forward air', '12.0/10.0/7.0%', '10-11/12-21', '41', 'tipper/early/late'),
    (3, 'back air', '10.0/7.5%', '7-11', '36', 'tipper/close'),
    (3, 'up air', '4.5/6.5%', '12-15/17-20', '43', 'first/second'),
    (3, 'down air', '12.0/10.0%', '16-17', '61', 'tipper/close'),
    (3, 'neutral special', '0.3%', '16 [rehit: 4]', '36', 'multi'),
    (3, 'side special', '4.0-11.0%', '16+', '17/35', 'air/grounded'),
    (3, 'up special', '8.0/6.0%', '12/15-21/1-10', '40', 'grounded/air/landing'),
    (3, 'down special', '9.4-15.0%', '20-159', '47-65',  'charge');

INSERT INTO public.moves AS "joker"
  ("fighterId", "name", "damage", "activeFrames", "totalFrames", "hitboxType")
  VALUES
    (4, 'jab 1', '2.0 (2.7)%', '4-5(4-5)', '23', 'single (arsene)'),
    (4, 'jab 2', '1.5 (2.2)%', '3-4(3-4)', '23', 'single (arsene)'),
    (4, 'jab 3', '4.0 (7.1)%', '3-4', '34', 'single (arsene)'),
    (4, 'rapid jab', '--', '--', '--', '--'),
    (4, 'rapid jab finisher', '--', '--', '--', '--'),
    (4, 'forward tilt', '3.0/5.0 (3.0/10.0)%', '8-9/13-15(8-9/13-19)', '34', 'first/second (arsene)'),
    (4, 'up tilt', '4.0/1.0/1.0 (4.0/1.7/3.9)%', '8-9/11-19/20-23', '40', 'first/multi/final'),
    (4, 'down tilt', '6.0/(13.0)%', '8-9/10-11/12-14', '37', 'late/early'),
    (4, 'dash attack', '2.0/6.0 (2.0/12.0)%', '6-7/15-21', '45', 'first/second'),
    (4, 'forward smash', '14.0 (22.0)%', '16-18(16-19)', '47', 'single'),
    (4, 'up smash', '12.0 (17.0)%', '10-14', '51', 'single'),
    (4, 'down smash', '12.0 (18.0)%', '12-13/16-17', '51', 'front/back'),
    (4, 'neutral air', '7.0 (7.0/4.0)%', '12-27', '54', 'single (front/back)'),
    (4, 'forward air', '2.0/5.0 (2.0/13.0)%', '7-8/12-14', '47', 'first/second'),
    (4, 'back air', '9.0 (16.0)%', '7-8', '31', 'single'),
    (4, 'up air', '0.7/3.0 (0.7/10.0)%', '5-18 [rehit: 3]/20-21', '39', 'multi/final'),
    (4, 'down air', '8.0 (8.0/8.0)%', '13-16 (13-16/15-16)', '46', 'single (first/second'),
    (4, 'neutral b', '5.0/3.0/1.0%', '12/37/65..', '36/61/92', 'close/med/far'),
    (4, 'side b', '1.0/2.0% [rehit: 1%]', '16-42/1-19 [rehit: 45]', '52', 'contact/erupt'),
    (4, 'side b, arsene', '1.0/2.0% [rehit: 1%]', '16-32 (1-15/16-27) [rehit: 45]', '52', 'contact/erupt'),
    (4, 'up b (grappling hook)', '--', '20-26', '59/44', 'recovery'),
    (4, 'up b (grappling attack)', '11.0/5.0%', '5', '28', 'grounded/air');
    -- ('down b', '--', '3+', '52/33',  'minimal/additional endlag'),
    -- ('down b', '--', '3+', '52/33',  'minimal/additional endlag'),
    -- ('down b', '--', '3+', '52/33',  'minimal/additional endlag'),
    -- ('down b', '--', '3+', '52/33',  'minimal/additional endlag');

-- DO $$
--   BEGIN
--     FOR "fighterId" in 1..21 LOOP
--     INSERT INTO public."characterMoves" ("fighterId")
--       VALUES (1);
--     END LOOP;
--     FOR "fighterId" in 22..48 LOOP
--     INSERT INTO public."characterMoves" ("fighterId")
--       VALUES (2);
--     END LOOP;
--     FOR "fighterId" in 49..69 LOOP
--     INSERT INTO public."characterMoves" ("fighterId")
--       VALUES (3);
--     END LOOP;
--     FOR "fighterId" in 70..91 LOOP
--     INSERT INTO public."characterMoves" ("fighterId")
--       VALUES (4);
--     END LOOP;
--   END;
-- $$;
