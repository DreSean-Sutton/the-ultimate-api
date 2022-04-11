set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE public.characters(
  "characterId" SERIAL NOT NULL,
  "character" VARCHAR(500) NOT NULL,
  "rosterId" VARCHAR NOT NULL,
  "displayName" VARCHAR(500) NOT NULL,
  "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT NOW(),
  PRIMARY KEY("characterId")
);


CREATE TABLE public.moves(
  "moveId" SERIAL NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "damage" VARCHAR(50) NOT NULL,
  "activeFrames" VARCHAR(50) NOT NULL,
  "totalFrames" VARCHAR(50) NOT NULL,
  "hitboxType" VARCHAR(50) NOT NULL,
  "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT NOW(),
  PRIMARY KEY("moveId")
);

CREATE TABLE public.characterMoves(
  "characterId" int NOT NULL,
  -- "throwId" SERIAL REFERENCES public.throws,
  -- "attributeid" SERIAL REFERENCES public.attributes,
  -- "miscellaneousId" SERIAL REFERENCES public.miscellaneous,
  "moveId" SERIAL REFERENCES public.moves
);


-- INSERT INTO/DATA SECTION

INSERT INTO public.characters ("character", "rosterId", "displayName")
  VALUES
    ('banjo', '73', 'banjo & kazooie'),
    ('bayonetta', '63', 'bayonetta'),
    ('inkling', '64', 'inkling'),
    ('joker', '71', 'joker');

INSERT INTO public.moves AS "banjo"
  ("name", "damage", "activeFrames", "totalFrames", "hitboxType")
  VALUES
    ('jab 1', '2.2%', '4-6', '27', 'single'),
    ('jab 2', '2.2%', '4-6', '24', 'single'),
    ('jab 3', '3.8%', '5-7', '31', 'single'),
    ('rapid jab', '0.4%', '5 [rehit: 2]', '--', 'multi'),
    ('rapid jab finisher', '1.6%', '7-8', '41', 'single'),
    ('forward tilt', '9.0/7.0%', '7-9', '28', 'tipper/close'),
    ('up tilt', '10.0%', '11-14', '31', 'single'),
    ('down tilt', '6.0/5.0/4.0%', '12-17/18-21', '37', 'tipper/close/late'),
    ('dash attack', '12.0/8.0%', '9-12/13-20', '36', 'early/late'),
    ('forward smash', '16.0%', '19-21', '52', 'single'),
    ('up smash', '1.0/1.5/3.6%', '9-10/13-25 [rehit: 2]/26-27', '65', 'first/multi/final'),
    ('down smash', '15.0%', '13-17', '46', 'single'),
    ('neutral air', '0.8/4.2%', '10-11(13-14/16-17..)/31-32', '47', 'multi/final'),
    ('forward air', '15.0/12.0%', '15-17/18', '51', 'early/late'),
    ('back air', '1.6/4.8%', '8-9/12-13/16-17', '43', 'multi/final'),
    ('up air', '1.6/5.8%', '7-8/9-11', '33', 'first/second'),
    ('down air', '10.0/2.0%', '15-45/1-2', '56', 'falling/landing'),
    ('neutral special', '5.4/4.6/3.8%', '13-22/23-52/53-102', '49', 'early/late/latest'),
    ('side special', '22.0/16.0%', '18-35/36-53', '82', 'early/late'),
    ('up special', '3.0%', '15(31)', '58', '(charged)'),
    ('down special', '0.5/8.5%', '10-143', '44',  'contact/explosion');

INSERT INTO public.moves AS "bayonetta"
  ("name", "damage", "activeFrames", "totalFrames", "hitboxType")
  VALUES
    ('jab 1', '1.4%', '9-12', '31', 'single'),
    ('jab 2', '1.4%', '7-8', '31', 'single'),
    ('jab 3', '2.2%', '7-8', '39', 'single'),
    ('rapid jab', '0.5/0.2%', '6 [rehit: 4]', '--', 'single/multi'),
    ('rapid jab finisher', '5.0%', '4-5/11-12', '62', 'single'),
    ('forward tilt 1', '3.0%', '12', '31', 'single'),
    ('forward tilt 2', '3.0%', '12', '39', 'single'),
    ('forward tilt 3', '7.0%', '14-15', '39', 'single'),
    ('up tilt', '1.5/6.0%', '7-9/10-12/13-15', '31', 'single/single/final'),
    ('down tilt', '5.0/6.0%', '7-8', '28', 'close/tipper'),
    ('dash attack', '10.0/8.0%', '15-20/21-26', '42', 'early/late'),
    ('forward smash', '16.0/14.0%', '17-21', '66', 'tipper/close'),
    ('up smash', '17.0/16.0/15.0%', '18-19/20-21/22-23', '64', 'early/late/latest'),
    ('down smash', '15.0%', '17-18/22/23-25', '65', 'stomp/early/late'),
    ('neutral air', '8.0/6.0/3.0%', '9-17/18-25 (26-66)', '32', 'early/late/(extended)'),
    ('forward air 1', '4.0%', '7-9', '37', 'single'),
    ('forward air 2', '3.3%', '7-9', '39', 'single'),
    ('forward air 3', '7.0%', '12-15', '46', 'single'),
    ('back air', '13.0/10.0%', '11-14', '34', 'tipper/close'),
    ('up air', '7.5/3.0%', '9-18 (21-65)', '29', 'single/(extended)'),
    ('down air', '7.0/8.0/9.0/5.0%', '18-35/1-2', '52', 'closest/close/tipper/landing'),
    ('neutral special', '1.3%', '17-26/22-31/32-41/37-46..', '75', 'multi'),
    ('neutral special (charged)', '2.7%', '42/47/57/62..', '100', 'multi'),
    -- ('side special (ground)', '8.0/7.0/5.0%', '15-16', '82', 'early/late'),
    ('afterburner kick, up', '6.0/7.0/6.0%', '7-9/10-14/15-19', '31', 'early/late/latest'),
    ('afterburner kick, down', '6.5/5.0%', '8-25/1', '43', 'normal/landing'),
    ('up special', '3.0/0.2/3.0%', '6/11-25 [rehit: 3]/27-28', '31', 'first/multi/final'),
    ('down special', '--', '8-27', '66',  'counter');

INSERT INTO public.moves AS "inkling"
  ("name", "damage", "activeFrames", "totalFrames", "hitboxType")
  VALUES
    ('jab 1', '2.0%', '3-4', '19', 'single'),
    ('jab 2', '2.0%', '2-3', '21', 'single'),
    ('jab 3', '3.5%', '4-5', '29', 'single'),
    ('rapid jab', '0.4%', '4 [rehit: 3]', '--', 'multi'),
    ('rapid jab finisher', '9.0%', '6', '48', 'single'),
    ('forward tilt', '6.0%', '8-10', '34', 'single'),
    ('up tilt', '6.0%', '7-12', '29', 'single'),
    ('down tilt', '3.0/6.0%', '5-8/12-15', '31', 'first/second'),
    ('dash attack', '8.9/6.0%', '6', '48', 'early/late'),
    ('forward smash', '14.0/16.0%', '16-17', '51', 'close/tipper'),
    ('up smash', '4.0/15.0/10.0%', '9-10/18-20', '57', 'first/close/far'),
    ('down smash', '12.5/11.0%', '(11-12/13-15)(20-21/22-24)', '49', '(front)(back)'),
    ('neutral air', '7.0%', '6-9', '31', 'single'),
    ('forward air', '12.0/10.0/7.0%', '10-11/12-21', '41', 'tipper/early/late'),
    ('back air', '10.0/7.5%', '7-11', '36', 'tipper/close'),
    ('up air', '4.5/6.5%', '12-15/17-20', '43', 'first/second'),
    ('down air', '12.0/10.0%', '16-17', '61', 'tipper/close'),
    ('neutral special', '0.3%', '16 [rehit: 4]', '36', 'multi'),
    ('side special', '4.0-11.0%', '16+', '17/35', 'air/grounded'),
    ('up special', '8.0/6.0%', '12/15-21/1-10', '40', 'grounded/air/landing'),
    ('down special', '9.4-15.0%', '20-159', '47-65',  'charge');

INSERT INTO public.moves AS "joker"
  ("name", "damage", "activeFrames", "totalFrames", "hitboxType")
  VALUES
    ('jab 1', '2.0 (2.7)%', '4-5(4-5)', '23', 'single (arsene)'),
    ('jab 2', '1.5 (2.2)%', '3-4(3-4)', '23', 'single (arsene)'),
    ('jab 3', '4.0 (7.1)%', '3-4', '34', 'single (arsene)'),
    ('rapid jab', '--', '--', '--', '--'),
    ('rapid jab finisher', '--', '--', '--', '--'),
    ('forward tilt', '3.0/5.0 (3.0/10.0)%', '8-9/13-15(8-9/13-19)', '34', 'first/second (arsene)'),
    ('up tilt', '4.0/1.0/1.0 (4.0/1.7/3.9)%', '8-9/11-19/20-23', '40', 'first/multi/final'),
    ('down tilt', '6.0/(13.0)%', '8-9/10-11/12-14', '37', 'late/early'),
    ('dash attack', '2.0/6.0 (2.0/12.0)%', '6-7/15-21', '45', 'first/second'),
    ('forward smash', '14.0 (22.0)%', '16-18(16-19)', '47', 'single'),
    ('up smash', '12.0 (17.0)%', '10-14', '51', 'single'),
    ('down smash', '12.0 (18.0)%', '12-13/16-17', '51', 'front/back'),
    ('neutral air', '7.0 (7.0/4.0)%', '12-27', '54', 'single (front/back)'),
    ('forward air', '2.0/5.0 (2.0/13.0)%', '7-8/12-14', '47', 'first/second'),
    ('back air', '9.0 (16.0)%', '7-8', '31', 'single'),
    ('up air', '0.7/3.0 (0.7/10.0)%', '5-18 [rehit: 3]/20-21', '39', 'multi/final'),
    ('down air', '8.0 (8.0/8.0)%', '13-16 (13-16/15-16)', '46', 'single (first/second'),
    ('neutral b', '5.0/3.0/1.0%', '12/37/65..', '36/61/92', 'close/med/far'),
    ('side b', '1.0/2.0% [rehit: 1%]', '16-42/1-19 [rehit: 45]', '52', 'contact/erupt'),
    ('side b, arsene', '1.0/2.0% [rehit: 1%]', '16-32 (1-15/16-27) [rehit: 45]', '52', 'contact/erupt'),
    ('up b (grappling hook)', '--', '20-26', '59/44', 'recovery'),
    ('up b (grappling attack)', '11.0/5.0%', '5', '28', 'grounded/air');
    -- ('down b', '--', '3+', '52/33',  'minimal/additional endlag'),
    -- ('down b', '--', '3+', '52/33',  'minimal/additional endlag'),
    -- ('down b', '--', '3+', '52/33',  'minimal/additional endlag'),
    -- ('down b', '--', '3+', '52/33',  'minimal/additional endlag');

DO $$
  BEGIN
    FOR "characterId" in 1..21 LOOP
    INSERT INTO public.characterMoves ("characterId")
      VALUES (1);
    END LOOP;
    FOR "characterId" in 22..48 LOOP
    INSERT INTO public.characterMoves ("characterId")
      VALUES (2);
    END LOOP;
    FOR "characterId" in 49..69 LOOP
    INSERT INTO public.characterMoves ("characterId")
      VALUES (3);
    END LOOP;
    FOR "characterId" in 70..91 LOOP
    INSERT INTO public.characterMoves ("characterId")
      VALUES (4);
    END LOOP;
  END;
$$;
