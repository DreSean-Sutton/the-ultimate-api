
set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE public.fighters (
	"fighterId" serial NOT NULL,
	"fighter" TEXT NOT NULL UNIQUE,
	"rosterId" int NOT NULL UNIQUE,
	"displayName" TEXT NOT NULL UNIQUE,
	"createdAt" timestamp with time zone DEFAULT NOW(),
	CONSTRAINT "fighters_pk" PRIMARY KEY ("fighterId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.moves (
	"moveId" serial NOT NULL,
	"fighterId" int NOT NULL,
	"name" TEXT NOT NULL,
	"moveType" TEXT,
	"type" TEXT NOT NULL,
	"createdAt" timestamp with time zone DEFAULT NOW(),
	CONSTRAINT "moves_pk" PRIMARY KEY ("moveId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.hitboxes (
	"moveId" serial NOT NULL,
	"damage" TEXT,
	"activeFrames" TEXT,
	"totalFrames" TEXT,
	"createdAt" timestamp with time zone DEFAULT NOW(),
	CONSTRAINT "hitboxes_pk" PRIMARY KEY ("moveId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.throws (
	"throwId" serial NOT NULL,
	"fighterId" int NOT NULL,
	"name" TEXT NOT NULL,
	"type" TEXT NOT NULL,
	"createdAt" timestamp with time zone DEFAULT NOW(),
	CONSTRAINT "throws_pk" PRIMARY KEY ("throwId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.grappling (
	"throwId" serial NOT NULL,
	"damage" TEXT,
	"activeFrames" TEXT,
	"totalFrames" TEXT,
	"createdAt" timestamp with time zone DEFAULT NOW(),
	CONSTRAINT "grappling_pk" PRIMARY KEY ("throwId")
) WITH (
  OIDS=FALSE
);




ALTER TABLE public.moves ADD CONSTRAINT "moves_fk0" FOREIGN KEY ("fighterId") REFERENCES "fighters"("fighterId");

ALTER TABLE public.hitboxes ADD CONSTRAINT "hitboxes_fk0" FOREIGN KEY ("moveId") REFERENCES "moves"("moveId");

ALTER TABLE public.throws ADD CONSTRAINT "throws_fk0" FOREIGN KEY ("fighterId") REFERENCES "fighters"("fighterId");

ALTER TABLE public.grappling ADD CONSTRAINT "grappling_fk0" FOREIGN KEY ("throwId") REFERENCES "throws"("throwId");

INSERT INTO public.fighters ("fighter", "rosterId", "displayName")
  VALUES
    ('banjo', 80, 'Banjo & Kazooie'),
    ('bayonetta', 69, 'Bayonetta'),
    ('bowser', 16, 'Bowser'),
    ('bowserJr', 63, 'Bowser Jr'),
    ('byleth', 82, 'Byleth'),
    ('captainFalcon', 12, 'Captain Falcon'),
    ('chrom', 29, 'Chrom'),
    ('cloud', 67, 'Cloud'),
    ('corrin', 68, 'Corrin'),
    ('daisy', 15, 'Daisy'),
    ('inkling', 70, 'Inkling'),
    ('joker', 78, 'Joker');

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
    (6, 'side b', 'point blank/full', 'move'),
    (6, 'side b', 'point blank/full', 'move'),
    (6, 'up b', 'grab/launch', 'move'),
    (6, 'down b', 'early/late/latest', 'move'),
    (6, 'down b', 'early/late/latest/landing', 'move');

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
    (7, 'side b: 1', 'single', 'move'),
    (7, 'side b: 2, neutral', 'single', 'move'),
    (7, 'side b: 3, neutral', 'single', 'move'),
    (7, 'side b: 4, neutral', 'single', 'move'),
    (7, 'side b: 2, up', 'single', 'move'),
    (7, 'side b: 3, up', 'single', 'move'),
    (7, 'side b: 4, up', 'single', 'move'),
    (7, 'side b: 3, down', 'single', 'move'),
    (7, 'side b: 4, down', 'single', 'move'),
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
    (8, 'side b, hit 1', 'single', 'move'),
    (8, 'side b, hit 2', 'single', 'move'),
    (8, 'side b, hit 3', 'first/second/third', 'move'),
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

INSERT INTO public.moves AS "inkling"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (11, 'jab 1', 'single', 'move'),
    (11, 'jab 2', 'single', 'move'),
    (11, 'jab 3', 'single', 'move'),
    (11, 'rapid jab', 'multi', 'move'),
    (11, 'rapid jab finisher', 'single', 'move'),
    (11, 'forward tilt', 'single', 'move'),
    (11, 'up tilt', 'single', 'move'),
    (11, 'down tilt', 'first/second', 'move'),
    (11, 'dash attack', 'early/late', 'move'),
    (11, 'forward smash', 'close/sweet', 'move'),
    (11, 'up smash', 'first/close/far', 'move'),
    (11, 'down smash', '(front)(back)', 'move'),
    (11, 'neutral air', 'single', 'move'),
    (11, 'forward air', 'sweet/early/late', 'move'),
    (11, 'back air', 'sweet/close', 'move'),
    (11, 'up air', 'first/second', 'move'),
    (11, 'down air', 'sweet/close', 'move'),
    (11, 'neutral b', 'multi', 'move'),
    (11, 'side b', 'air/grounded', 'move'),
    (11, 'up b', 'grounded/air/landing', 'move'),
    (11, 'down b', 'charge', 'move');

INSERT INTO public.moves AS "joker"
  ("fighterId", "name", "moveType", "type")
  VALUES
    (12, 'jab 1', 'single (arsene)', 'move'),
    (12, 'jab 2', 'single (arsene)', 'move'),
    (12, 'jab 3', 'single (arsene)', 'move'),
    (12, 'forward tilt', 'first/second (arsene)', 'move'),
    (12, 'up tilt', 'first/multi/final', 'move'),
    (12, 'down tilt', 'late/early', 'move'),
    (12, 'dash attack', 'first/second', 'move'),
    (12, 'forward smash', 'single', 'move'),
    (12, 'up smash', 'single', 'move'),
    (12, 'down smash', 'front/back', 'move'),
    (12, 'neutral air', 'single (front/back)', 'move'),
    (12, 'forward air', 'first/second', 'move'),
    (12, 'back air', 'single', 'move'),
    (12, 'up air', 'multi/final', 'move'),
    (12, 'down air', 'single (Arsene: first/second', 'move'),
    (12, 'neutral b', 'close/med/far', 'move'),
    (12, 'side b', 'contact/erupt', 'move'),
    (12, 'side b, arsene', 'contact/erupt', 'move'),
    (12, 'up b (grappling hook)', 'recovery', 'move'),
    (12, 'up b (grappling attack)', 'grounded/air', 'move'),
    (12, 'down b, rebel''s guard', 'minimal/additional endlag', 'move'),
    (12, 'down b, counterattack', 'counter', 'move'),
    (12, 'down b, arsene', 'multiplier (minimum/maximum)', 'move');

INSERT INTO public.hitboxes AS "banjo"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.2%', '4-6', '27'),
    ('2.2%', '4-6', '24'),
    ('3.8%', '5-7', '31'),
    ('0.4%', '5 [rehit: 2]', null),
    ('1.6%', '7-8', '41'),
    ('9.0/7.0%', '7-9', '28'),
    ('10.0%', '11-14', '31'),
    ('6.0/5.0/4.0%', '12-17/18-21', '37'),
    ('12.0/8.0%', '9-12/13-20', '36'),
    ('16.0%', '19-21', '52'),
    ('1.0/1.5/3.6%', '9-10/13-25 [rehit: 2]/26-27', '65'),
    ('15.0%', '13-17', '46'),
    ('0.8/4.2%', '10-11(13-14/16-17..)/31-32', '47'),
    ('15.0/12.0%', '15-17/18', '51'),
    ('1.6/4.8%', '8-9/12-13/16-17', '43'),
    ('1.6/5.8%', '7-8/9-11', '33'),
    ('10.0/2.0%', '15-45/1-2', '56'),
    ('5.4/4.6/3.8%', '13-22/23-52/53-102', '49'),
    ('22.0/16.0%', '18-35/36-53', '82'),
    ('3.0%', '15(31)', '58'),
    ('0.5/8.5%', '10-143', '44');

INSERT INTO public.hitboxes AS "bayonetta"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('1.4%', '9-12', '31'),
    ('1.4%', '7-8', '31'),
    ('2.2%', '7-8', '39'),
    ('0.5/0.2%', '6 [rehit: 4]', null),
    ('5.0%', '4-5/11-12', '62'),
    ('3.0%', '12', '31'),
    ('3.0%', '12', '39'),
    ('7.0%', '14-15', '39'),
    ('1.5/6.0%', '7-9/10-12/13-15', '31'),
    ('5.0/6.0%', '7-8', '28'),
    ('10.0/8.0%', '15-20/21-26', '42'),
    ('16.0/14.0%', '17-21', '66'),
    ('17.0/16.0/15.0%', '18-19/20-21/22-23', '64'),
    ('15.0%', '17-18/22/23-25', '65'),
    ('8.0/6.0/3.0%', '9-17/18-25 (26-66)', '32'),
    ('4.0%', '7-9', '37'),
    ('3.3%', '7-9', '39'),
    ('7.0%', '12-15', '46'),
    ('13.0/10.0%', '11-14', '34'),
    ('7.5/3.0%', '9-18 (21-65)', '29'),
    ('7.0/8.0/9.0/5.0%', '18-35/1-2', '52'),
    ('1.3%', '17-26/22-31/32-41/37-46..', '75'),
    ('2.7%', '42/47/57/62..', '100'),
    ('8.0/7.0 (5.0)%', '15-18/19-39 (1-11/20-24)', '66 (67)'),
    ('6.0/7.0/6.0%', '7-9/10-14/15-19', '31'),
    ('6.5/5.0%', '8-25/1', '43'),
    ('3.0/0.2/3.0%', '6/11-25 [rehit: 3]/27-28', '31'),
    (null, '8-27', '66');

INSERT INTO public.hitboxes AS "bowser"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('4.0%', '7-8', '25'),
    ('7.0%', '9-11', '25'),
    ('13.0%', '10-14', '37'),
    ('11.0%', '11-16', '40'),
    ('7.0/8.0%', '10-12/15-17', '45'),
    ('12.0/10.0%', '11-14/15-20', '55'),
    ('23.0%', '22-23/24-27', '69'),
    ('22.0/16.0/12.0%', '16-23/37', '57'),
    ('16.0/15.0%', '12-14/28-30', '72'),
    ('6.0/6.0/6.0/6.0%', '8-29/14-29/18-29/18-29', '47'),
    ('13.0/12.0%', '11-14', '41'),
    ('19.0%', '9-11', '44'),
    ('15.0%', '9-13', '44'),
    ('16.0/2.0%', '17-49/1-6', '77'),
    ('1.8%', '23 [rehit: 7]', '77/31'),
    (null, '6', '52'),
    ('1.0/6/0%', '6-38 [rehit: 5]/39', '81'),
    ('7.0/1.0/2.0%', '6-7/8-11/12-15/16-19../48-51', null),
    ('4.0/20.0/11.0%', '11/37../1-2', '66'),
    ('20.0/11.0%', '31../1-2', null);

INSERT INTO public.hitboxes AS "bowserJr"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.0%', '3-4', '19'),
    ('2.0%', '2-3', '21'),
    ('0.5%', '4 [rehit: 3]', null),
    ('3.0%', '6-7', '42'),
    ('6.0/8.0%', '7-9', '31'),
    ('6.0%', '7-14', '30'),
    ('2.0/6.0%', '4-6/12-14/23-25', '40'),
    ('1.8/4.0%', '8/11/14/17/20/25-26', '47'),
    ('1.0/11.0%', '18/21/24/27/30/35-37', '55'),
    ('1.0/1.7/1.4/6.0%', '7-8/9/12/15/18/22-23', '53'),
    ('18.0%', '12-14', '59'),
    ('6.5/5.5/3.5/8.0/7.0/5.0%', '7-8/(9-13)(14-19)', '43'),
    ('11.0/9.0/7.0/5.0/2.0%', '10-13(14-17)(18-23)/2', '43'),
    ('14.0/10.0/8.0%', '12-13(14-18)', '45'),
    ('10.0/6.5%', '6-9/10-13', '25'),
    ('1.5/2.5/2.0%', '15-38 [rehit: 3]/39', '56'),
    ('10.0-20.0/7.0-14.0%', '37-97', '72-132'),
    ('4.0-7.3%', null, null),
    ('16.3/10.0%', '3-14', '58'),
    ('5.0/13.0%', null, null),
    ('15.0/10.0%', '8-9/13-14', '39'),
    ('4.0%', '48', '67');

INSERT INTO public.hitboxes AS "byleth"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('1.5%', '4-5', '22'),
    ('2.0%', '4-5', '24'),
    ('4.5%', '5-7', '34'),
    ('0.4%', '11 [rehit: 3]', null),
    ('3.5%', '6-7', '48'),
    ('11.0%', '8-10', '34'),
    ('10.0%', '9-15', '34'),
    ('8.0%', '13-15', '35'),
    ('9.0/13.0%', '9-11', '44'),
    ('(12.0/18.0)(11.5/17.25)(13.0/19.5)%', '23-25', '63'),
    ('2.0/2.0/2.0/10.0%', '13-16/17/21/25-27/28-29', '56'),
    ('23.0/23.0%', '19-21/29-31', '74'),
    ('2.5/3.0/1.0%', '6-26 [rehit: 7]/28/2', '51'),
    ('12.75/8.5%', '12-13', '39'),
    ('15.0/10.0 (7.5/5.0)%', '13-14 (15-17)', '46'),
    ('3.0/5.5%', '10-19 [rehit: 5]/20-23', '48'),
    ('19.0%', '22-24', '59'),
    ('12.0/29.0%', '45-61/114', '80/160'),
    ('17.25/11.5%', '20/21/22-24 (21-24)', '65(61)'),
    ('1.0/3.0/6.5%', '9/10-17/46 (10-17/46)', '46'),
    ('30.0/8.0 (25.0/6.0)%', '62-67/2-5', '133');

INSERT INTO public.hitboxes AS "captainFalcon"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('1.5%', '3', '17'),
    ('1.5%', '5', '18'),
    ('5.0%', '6-7', '32'),
    ('0.6%', '5 [rehit: 2]', null),
    ('3.0%', '6-7', '49'),
    ('8.0/9.0%', '7-10', '29'),
    ('11.0%', '14-17', '36'),
    ('10.0%', '11-12', '34'),
    ('10.0/6.0%', '7-9/10-16', '34'),
    ('19.0/20.0%', '19-22', '59'),
    ('7.0/12.0/14.0%', '22-23/28-29', '45'),
    ('14.0/18.0%', '19-20/29-30', '48'),
    ('4.0/6.0%', '7-8/13-15', '39'),
    ('22.0/6.0 (3.0)%', '14 (15-30)', '45'),
    ('13.0/8.0%', '10-11/12-15', '35'),
    ('10.0/9.0/8.0%', '7-10/11-12', '31'),
    ('14.0%', '16-18', '44'),
    ('25.0/28.0 (22.0/25.0)%', '53-57 (62-66)', '103 (117)'),
    ('10.0%', '5/10-25', '27/71'),
    ('10.0%', '5/19-35', '44'),
    ('5.0/13.0%', '14-30', null),
    ('15.0/11.0/7.0%', '13-16/17-23/224-33', '68 (65)'),
    ('15.0/12.0/9/0/9.0%', '14-18/19-24/25-27/1-2', '56');

INSERT INTO public.hitboxes AS "chrom"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('6.5%', '3-4', '19'),
    ('10.9%', '8-10', '33'),
    ('10.4%', '6/7-8/9-11', '38'),
    ('9.0%', '7-8', '21'),
    ('12.0%', '13-16', '45'),
    ('18.0%', '13-14', '53'),
    ('1.0/(2.0)/10.0%', '12/(13/15/17/19)/22-23', '58'),
    ('12.3/14.2%', '6-7/21-22', '62'),
    ('4.7/6.6%', '6-7/15-21', '45'),
    ('9.0%', '10-12', '29'),
    ('10.9%', '8-10', '35'),
    ('7.6%', '5-12', '41'),
    ('14.2/11.875%', '16-17', '51'),
    ('8.0-50.0%', '(21/260) 10-14 after release', '44-283'),
    ('2.8%', '9-11', '39/29'),
    ('2.8%', '5-7', '38'),
    ('3.8%', '4-6', '43'),
    ('5.2%', '7-9', '58'),
    ('2.8%', '4-6', '38'),
    ('3.8%', '5-7', '43'),
    ('6.4%', '6-10', '44'),
    ('3.8%', '5-7', '44'),
    ('(2.0)/4.2%', '(7/10/13/16)/19-21', '71'),
    ('6.0/1.5/6.0/6.0%', '10-11/39-47 [rehit: 7]/54+/1-4', null),
    (null, '8-29', '67'),
    (null, '4-5', '40');

INSERT INTO public.hitboxes AS "cloud"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.5%', '4-5', '29'),
    ('2.0%', '5-6', '32'),
    ('3.5%', '6-7', '37'),
    ('11.0%', '8-10', '34'),
    ('8.0%', '6-9', '32'),
    ('7.0%', '7-17', '40'),
    ('11.0/8.0%', '9-13/14-18', '45'),
    ('3.0/2.0/(13.0/12.0)%', '19/24/28', '66'),
    ('13.0/8.0%', '12-14/15-16', '45'),
    ('3.0/11.0%', '8-9/21-23', '49'),
    ('8.0%', '5-15', '38'),
    ('13.0/14.0/11.0%', '18-19/(20-25)', '53'),
    ('13.0%', '11-12', '42'),
    ('11.0/8.0%', '8-9/10-13', '44'),
    ('13.0/8.0%', '11-13/14-39', '64'),
    ('8.0/6.0 (6.4/4.8)%', '18-68', '53 (60)'),
    ('6.0/2.0/3.0 (4.8/1.6/2.4)%', '16-63 [impact: 1/7/13/19/25/28-29]', '60'),
    ('4.0%', '10-11', '40'),
    ('3.0%', '2-3', '31'),
    ('3.0/3.0/6.0%', '2-3/11-12/25-26', '55'),
    ('5.0/3.0/10.0%', '10-11/15-16/21-22/28/38-39', '60'),
    ('3.0/4.0%', '7/10-15', null),
    ('6.0/7.0%', '12..', null),
    ('4.5/3.5%', '7-16/1-3', null),
    ('1.0%', '12-14/22-26 (14-17/25-29)', '84 (87)');

INSERT INTO public.hitboxes AS "corrin"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.0/2.5%', '5-6', '27'),
    ('2.0%', '4-5', '29'),
    ('3.0/4.0%', '6-7', '30'),
    ('0.5%', '4 [rehit: 4]', null),
    ('3.0%', '3-4', '39'),
    ('10.5%', '8-9', '34'),
    ('9.0%', '7-16', '35'),
    ('7.5%', '5-7', '30'),
    ('2.0/3.0%', '(12/14/16/18/20)/23', '49'),
    ('0.5/11.0/12.0/16.7%', '12../17-18', '56'),
    ('10.0/13.0/15.0%', '13-17', '51'),
    ('11.0/9.0/14.0%', '13-15', '49'),
    ('7.0/5.5%', '6-7/8-19', '46'),
    ('9.0%', '9-12', '35'),
    ('12.0/9.0%', '13/14-16', '41'),
    ('10.0%', '7-12', '37'),
    ('2.0/3.0%', '12-28 [rehit: 2]/1-5', '51'),
    ('4.0-11.0%', '17-71', '61-95'),
    ('10.0-20.0%', '2 (24-86)', '61-95'),
    ('7.0%', '4', null),
    ('8.0/15.0%', '10', '37'),
    (null, null, '35/19'),
    (null, null, '29'),
    ('12.0/7.0%', '10-17/18-24', '56 (45)'),
    ('5.0/7.0%', '6/14-21/(22-28)', '60 (45)'),
    ('4.5/1.2/3.0%', '18-19/(20/22/24/26/28)/29-30', null),
    (null, '7-26', '66'),
    (null, '27-31', '66');

INSERT INTO public.hitboxes AS "Daisy"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.0%', '2', '27'),
    ('3.0%', '2-3', '29'),
    ('7.0/8.0/6.0%', '7/8-9/10-15', '36'),
    ('8.0/10.0%', '9-13', '37'),
    ('7.0%', '8-9', '23'),
    ('4.0/6.0%', '6-9/17-19', '37'),
    ('15.0/13.5/18.0%', '15-17', '45'),
    ('17.0/15.0/12.0/10.0/12.0%', '14-16/17-20', '44'),
    ('2.0/3.0%', '6-27 [rehit: 2/3]/30-31', '54'),
    ('13.0/6.0/5.0%', '5-8/9-19', '48'),
    ('14.0/15.0%', '16-20', '57'),
    ('12.0/7.0%', '6-7', '53'),
    ('4.0/6.0%', '10-13/15-19', '45'),
    ('2.0/1.0/5.0%', '12-13/18-19/24-25/30-31', '38'),
    (null, '9-34', '62'),
    ('3.5%/spore', '2/6/8/12/14/17', '60'),
    ('12.0%', '13-36', '(+18) 62/87'),
    ('12.0%', '13-36', '(+18) 87'),
    ('3.0/1.0/4.0%', '7/11/16/21/26/31', null),
    ('8.3-27.6%', null, '39');

INSERT INTO public.hitboxes AS "inkling"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.0%', '3-4', '19'),
    ('2.0%', '2-3', '21'),
    ('3.5%', '4-5', '29'),
    ('0.4%', '4 [rehit: 3]', null),
    ('2.5%', '6', '48'),
    ('9.0%', '8-10', '34'),
    ('6.0%', '7-12', '29'),
    ('3.0/6.0%', '5-8/12-15', '31'),
    ('8.0/6.0%', '6', '48'),
    ('14.0/16.0%', '16-17', '51'),
    ('4.0/15.0/10.0%', '9-10/18-20', '57'),
    ('12.5/11.0%', '(11-12/13-15)(20-21/22-24)', '49'),
    ('7.0%', '6-9', '31'),
    ('12.0/10.0/7.0%', '10-11/12-21', '41'),
    ('10.0/7.5%', '7-11', '36'),
    ('4.5/6.5%', '12-15/17-20', '43'),
    ('12.0/10.0%', '16-17', '61'),
    ('0.3%', '16 [rehit: 4]', '36'),
    ('4.0-11.0%', '16+', '17/35'),
    ('8.0/6.0%', '12/15-21/1-10', '40'),
    ('9.4-15.0%', '20-159', '47-65');

INSERT INTO public.hitboxes AS "joker"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.0 (2.7)%', '4-5(4-5)', '23'),
    ('1.5 (2.2)%', '3-4(3-4)', '23'),
    ('4.0 (7.1)%', '3-4', '34'),
    ('3.0/5.0 (3.0/10.0)%', '8-9/13-15(8-9/13-19)', '34'),
    ('4.0/1.0/1.0 (4.0/1.7/3.9)%', '8-9/11-19/20-23', '40'),
    ('6.0/(13.0)%', '8-9/10-11/12-14', '37'),
    ('2.0/6.0 (2.0/12.0)%', '6-7/15-21', '45'),
    ('14.0 (22.0)%', '16-18(16-19)', '47'),
    ('12.0 (17.0)%', '10-14', '51'),
    ('12.0 (18.0)%', '12-13/16-17', '51'),
    ('7.0 (7.0/4.0)%', '12-27', '54'),
    ('2.0/5.0 (2.0/13.0)%', '7-8/12-14', '47'),
    ('9.0 (16.0)%', '7-8', '31'),
    ('0.7/3.0 (0.7/10.0)%', '5-18 [rehit: 3]/20-21', '39'),
    ('8.0 (8.0/8.0)%', '13-16 (13-16/15-16)', '46'),
    ('5.0/3.0/1.0%', '12/37/65..', '36/61/92'),
    ('1.0/2.0% [rehit: 1%]', '16-42/1-19 [rehit: 45]', '52'),
    ('1.0/2.0% [rehit: 1%]', '16-32 (1-15/16-27) [rehit: 45]', '52'),
    (null, '20-26', '59/44'),
    ('11.0/5.0%', '5', '28'),
    (null, '3+', '52/33'),
    ('2.4%', '8-9', '30'),
    ('1.6x (12%/50%)', '4-31', '57');

INSERT INTO public.throws AS "banjo"
  ("fighterId", "name", "type")
  VALUES
    (1, 'grab', 'throw'),
    (1, 'dash grab', 'throw'),
    (1, 'pivot grab', 'throw'),
    (1, 'pummel', 'throw'),
    (1, 'forward throw', 'throw'),
    (1, 'backward throw', 'throw'),
    (1, 'up throw', 'throw'),
    (1, 'down throw', 'throw');

INSERT INTO public.throws AS "bayonetta"
  ("fighterId", "name", "type")
  VALUES
    (2, 'grab', 'throw'),
    (2, 'dash grab', 'throw'),
    (2, 'pivot grab', 'throw'),
    (2, 'pummel', 'throw'),
    (2, 'forward throw', 'throw'),
    (2, 'backward throw', 'throw'),
    (2, 'up throw', 'throw'),
    (2, 'down throw', 'throw');

INSERT INTO public.throws AS "bowser"
  ("fighterId", "name", "type")
  VALUES
    (3, 'grab', 'throw'),
    (3, 'dash grab', 'throw'),
    (3, 'pivot grab', 'throw'),
    (3, 'pummel', 'throw'),
    (3, 'forward throw', 'throw'),
    (3, 'backward throw', 'throw'),
    (3, 'up throw', 'throw'),
    (3, 'down throw', 'throw');

INSERT INTO public.throws AS "bowserJr"
  ("fighterId", "name", "type")
  VALUES
    (4, 'grab', 'throw'),
    (4, 'dash grab', 'throw'),
    (4, 'pivot grab', 'throw'),
    (4, 'pummel', 'throw'),
    (4, 'forward throw', 'throw'),
    (4, 'backward throw', 'throw'),
    (4, 'up throw', 'throw'),
    (4, 'down throw', 'throw');

INSERT INTO public.throws AS "byleth"
  ("fighterId", "name", "type")
  VALUES
    (5, 'grab', 'throw'),
    (5, 'dash grab', 'throw'),
    (5, 'pivot grab', 'throw'),
    (5, 'pummel', 'throw'),
    (5, 'forward throw', 'throw'),
    (5, 'backward throw', 'throw'),
    (5, 'up throw', 'throw'),
    (5, 'down throw', 'throw');

INSERT INTO public.throws AS "captainFalcon"
  ("fighterId", "name", "type")
  VALUES
    (6, 'grab', 'throw'),
    (6, 'dash grab', 'throw'),
    (6, 'pivot grab', 'throw'),
    (6, 'pummel', 'throw'),
    (6, 'forward throw', 'throw'),
    (6, 'backward throw', 'throw'),
    (6, 'up throw', 'throw'),
    (6, 'down throw', 'throw');

INSERT INTO public.throws AS "chrom"
  ("fighterId", "name", "type")
  VALUES
    (7, 'grab', 'throw'),
    (7, 'dash grab', 'throw'),
    (7, 'pivot grab', 'throw'),
    (7, 'pummel', 'throw'),
    (7, 'forward throw', 'throw'),
    (7, 'backward throw', 'throw'),
    (7, 'up throw', 'throw'),
    (7, 'down throw', 'throw');

INSERT INTO public.throws AS "cloud"
  ("fighterId", "name", "type")
  VALUES
    (8, 'grab', 'throw'),
    (8, 'dash grab', 'throw'),
    (8, 'pivot grab', 'throw'),
    (8, 'pummel', 'throw'),
    (8, 'forward throw', 'throw'),
    (8, 'backward throw', 'throw'),
    (8, 'up throw', 'throw'),
    (8, 'down throw', 'throw');

INSERT INTO public.throws AS "corrin"
  ("fighterId", "name", "type")
  VALUES
    (9, 'grab', 'throw'),
    (9, 'dash grab', 'throw'),
    (9, 'pivot grab', 'throw'),
    (9, 'pummel', 'throw'),
    (9, 'forward throw', 'throw'),
    (9, 'backward throw', 'throw'),
    (9, 'up throw', 'throw'),
    (9, 'down throw', 'throw');

INSERT INTO public.throws AS "daisy"
  ("fighterId", "name", "type")
  VALUES
    (10, 'grab', 'throw'),
    (10, 'dash grab', 'throw'),
    (10, 'pivot grab', 'throw'),
    (10, 'pummel', 'throw'),
    (10, 'forward throw', 'throw'),
    (10, 'backward throw', 'throw'),
    (10, 'up throw', 'throw'),
    (10, 'down throw', 'throw');

INSERT INTO public.throws AS "inkling"
  ("fighterId", "name", "type")
  VALUES
    (11, 'grab', 'throw'),
    (11, 'dash grab', 'throw'),
    (11, 'pivot grab', 'throw'),
    (11, 'pummel', 'throw'),
    (11, 'forward throw', 'throw'),
    (11, 'backward throw', 'throw'),
    (11, 'up throw', 'throw'),
    (11, 'down throw', 'throw');

INSERT INTO public.throws AS "joker"
  ("fighterId", "name", "type")
  VALUES
    (12, 'grab', 'throw'),
    (12, 'dash grab', 'throw'),
    (12, 'pivot grab', 'throw'),
    (12, 'pummel', 'throw'),
    (12, 'forward throw', 'throw'),
    (12, 'backward throw', 'throw'),
    (12, 'up throw', 'throw'),
    (12, 'down throw', 'throw');

INSERT INTO public.grappling AS "banjo"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '7-8', '36'),
    (null, '10-11', '44'),
    (null, '11-12', '39'),
    ('1.4%', '1', '19'),
    ('5.4/3.0%', '9/11', '33'),
    ('11.4%', '36', '53'),
    ('5.4/3.0%', '13/15', '39'),
    ('5.6%', '34', '55');

INSERT INTO public.grappling AS "bayonetta"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '7-8', '37'),
    (null, '10-11', '45'),
    (null, '11-12', '40'),
    ('0.6/0.7%', '1/13', '25'),
    ('7.0/3.0%', '14/15', '42'),
    ('3.0/6.0%', '14/15', '53'),
    ('3.0/4.5%', '9/10', '35'),
    ('3.0/5.0%', '20/21', '46');

INSERT INTO public.grappling AS "bowser"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '8-10', '40'),
    (null, '11-13', '48'),
    (null, '12-14', '43'),
    ('1.6%', '2', '21'),
    ('12.0%', '36', '58'),
    ('12.0%', '19', '38'),
    ('0.5/2.0/6.0%', '21-49 [rehit: 4]/57', '74'),
    ('10.0/4.0%', '35/37', '84');

INSERT INTO public.grappling AS "bowserJr"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '11-13', '40'),
    (null, '14-16', '48'),
    (null, '15-17', '43'),
    ('1.3%', '1', '19'),
    ('3.0/7.0%', '14/16', '34'),
    ('11.0%', '24', '61'),
    ('7.0%', '18', '37'),
    ('1.2/4.0%', '16-49 [rehit: 5]/50', '77');

INSERT INTO public.grappling AS "byleth"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '6-7', '39'),
    (null, '10-11', '48'),
    (null, '11-12', '42'),
    ('1.5%', '1', '22'),
    ('6.0%', '13', '35'),
    ('7.0%', '30', '43'),
    ('9.0%', '15', '37'),
    ('5.0%', '13', '31');

INSERT INTO public.grappling AS "captainFalcon"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '6-7', '35'),
    (null, '9-10', '43'),
    (null, '10-11', '38'),
    ('1.3%', '1', '19'),
    ('3.5/4.0%', '11/13', '32'),
    ('3.5/4.0%', '12/13', '45'),
    ('4.0/5.0%', '12/14', '37'),
    ('6.0%', '21', '39');

INSERT INTO public.grappling AS "chrom"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '7-8', '36'),
    (null, '10-11', '44'),
    (null, '11-12', '39'),
    ('1.3%', '1', '19'),
    ('5.0%', '15', '31'),
    ('5.0%', '8', '44'),
    ('6.0%', '13', '44'),
    ('5.0%', '16', '41');

INSERT INTO public.grappling AS "cloud"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '9-10', '36'),
    (null, '12-13', '44'),
    (null, '13-14', '39'),
    ('1.3%', '1', '18'),
    ('4.0/3.0%', '7/9', '35'),
    ('3.0/3.0%', '13/15', '31'),
    ('2.0/2.5/4.0%', '8/13/15', '50'),
    ('7.0%', '18', '43');

INSERT INTO public.grappling AS "corrin"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '7-8', '36'),
    (null, '10-11', '44'),
    (null, '11-12', '39'),
    ('1.3%', '1', '19'),
    ('5.0/2.0%', '14/15', '34'),
    ('6.5/2.0%', '12/13', '37'),
    ('6.5/3.0%', '12/13', '51'),
    ('6.5/3.0', '26/27', '54');

INSERT INTO public.grappling AS "daisy"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '6-7', '36'),
    (null, '9-10', '44'),
    (null, '10-11', '39'),
    ('1.3%', '1', '19'),
    ('2.0/6.0%', '14/16', '39'),
    ('2.0/9.0%', '20/21', '49'),
    ('2.0/6.0%', '19/26', '49'),
    ('1.0/7.0%', '34/43', '64');

INSERT INTO public.grappling AS "inkling"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '8-9', '34'),
    (null, '9-10', '41'),
    (null, '10-11', '37'),
    ('1.3%', '1', '18'),
    ('5.0/3.0%', '22/23', '39'),
    ('9.0%', '17', '36'),
    ('3.0/3.0%', '21/22', '36'),
    ('7.0%', '20', '34');

INSERT INTO public.grappling AS "joker"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '6-7', '34'),
    (null, '8-9', '42'),
    (null, '9-10', '37'),
    ('1.5%', '1', '19'),
    ('8.0%', '9', '29'),
    ('10.0%', '14', '39'),
    ('7.0%', '16', '37'),
    ('7.0%', '23', '40');
