

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



CREATE TABLE public.movements (
	"movementId" serial NOT NULL,
	"fighterId" int NOT NULL,
	"name" TEXT NOT NULL,
	"type" TEXT NOT NULL,
	"createdAt" timestamp with time zone DEFAULT NOW(),
	CONSTRAINT "movements_pk" PRIMARY KEY ("movementId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.dodging (
	"movementId" serial NOT NULL,
	"activeFrames" TEXT NOT NULL,
	"totalFrames" TEXT NOT NULL,
	"createdAt" timestamp with time zone DEFAULT NOW(),
	CONSTRAINT "dodging_pk" PRIMARY KEY ("movementId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.stats (
	"statId" serial NOT NULL,
	"fighterId" int NOT NULL,
	"name" TEXT NOT NULL,
	"type" TEXT NOT NULL,
	"createdAt" timestamp with time zone DEFAULT NOW(),
	CONSTRAINT "stats_pk" PRIMARY KEY ("statId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.miscellaneous (
	"statId" serial NOT NULL,
	"statValue" TEXT NOT NULL,
	"createdAt" timestamp with time zone DEFAULT NOW(),
	CONSTRAINT "miscellaneous_pk" PRIMARY KEY ("statId")
) WITH (
  OIDS=FALSE
);



ALTER TABLE public.moves ADD CONSTRAINT "moves_fk0" FOREIGN KEY ("fighterId") REFERENCES "fighters"("fighterId") ON DELETE CASCADE;

ALTER TABLE public.hitboxes ADD CONSTRAINT "hitboxes_fk0" FOREIGN KEY ("moveId") REFERENCES "moves"("moveId") ON DELETE CASCADE;

ALTER TABLE public.throws ADD CONSTRAINT "throws_fk0" FOREIGN KEY ("fighterId") REFERENCES "fighters"("fighterId") ON DELETE CASCADE;

ALTER TABLE public.grappling ADD CONSTRAINT "grappling_fk0" FOREIGN KEY ("throwId") REFERENCES "throws"("throwId") ON DELETE CASCADE;

ALTER TABLE public.movements ADD CONSTRAINT "movements_fk0" FOREIGN KEY ("fighterId") REFERENCES "fighters"("fighterId") ON DELETE CASCADE;

ALTER TABLE public.dodging ADD CONSTRAINT "dodging_fk0" FOREIGN KEY ("movementId") REFERENCES "movements"("movementId") ON DELETE CASCADE;

ALTER TABLE public.stats ADD CONSTRAINT "stats_fk0" FOREIGN KEY ("fighterId") REFERENCES "fighters"("fighterId") ON DELETE CASCADE;

ALTER TABLE public.miscellaneous ADD CONSTRAINT "miscellaneous_fk0" FOREIGN KEY ("statId") REFERENCES "stats"("statId") ON DELETE CASCADE;


-- FightersData

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
    ('darkPit', 33, 'Dark Pit'),
    ('darkSamus', 5, 'Dark Samus'),
    ('diddy', 36, 'Diddy Kong'),
    ('inkling', 70, 'Inkling'),
    ('joker', 78, 'Joker');

-- MovesData

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

INSERT INTO public.hitboxes AS "darkPit"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.0%', '4-5', '25'),
    ('2.0%', '5-6', '29'),
    ('4.0%', '3', '31'),
    ('0.5%', '6 [rehit: 2]', null),
    ('2.0%', '4', '47'),
    ('7.0/10.0%', '10-14', '39'),
    ('4.0/5.0%', '6-8/15-16', '32'),
    ('6.0%', '6-7', '25'),
    ('11.0%', '7-9', '38'),
    ('5.0/10.0%', '10/21-22', '54'),
    ('3.0/2.0/8.0%', '6-7/10/18', '51'),
    ('12.0/10.0%', '5-6/18-20', '40'),
    ('0.7/4.5%', '4-23 [rehit: 2/3]/25', '54'),
    ('2.5/6.0%', '11-12/14-15/18-19', '46'),
    ('8.0/12.0%', '10-12', '40'),
    ('1.5/5.0%', '10-12/13-15/16-18/19-21/22-23', '40'),
    ('10.0%', '10/11-12', '36'),
    ('5.5-14.0%', '16-55 (17-56)', '46/43/42/40'),
    ('12.0%', '16-35', '79/49'),
    ('9.5%', '16-35', '104/51'),
    (null, 'i-frames: (9-19/15-19)', '40'),
    (null, '7 (+18)', '43-124');

INSERT INTO public.hitboxes AS "darkSamus"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('3.0%', '3-4', '17'),
    ('8.0%', '6-9', '29'),
    ('8.0/9.0/10.0%', '8-10', '33'),
    ('13.0/12.0%', '15-18', '39'),
    ('12.0%', '6-8', '44'),
    ('10.0/6.0%', '8-9/10-13/14-18', '41'),
    ('12.0/14.0%', '10-11', '48'),
    ('3.0/6.0%', '11-24 [rehit: 2/4]/27-28', '56'),
    ('10.0/12.0%', '9-10/17-18', '44'),
    ('10.0/9/0/8.0%', '8-11/14-15/16-22', '45'),
    ('3.0/1.6/5.0%', '6-7/12-13/18-19/24-25/30-31', '59'),
    ('12.0/14.0/9.0%', '9-10/11-14', '41'),
    ('3.0/1.2/4.0%', '5/7-14 [rehit: 3]/16-17', '39'),
    ('10.0/14.0%', '17-18;29-21/22-23', '48'),
    ('2.5/4.0%', '8-15/16-19', '59'),
    ('5.0-26.1%', '3-62 (from release)/(+13)', '31'),
    ('28.0%', '16-75', '60'),
    ('8.0%', '18-137', '59'),
    ('12.0%', '21-70', '59'),
    ('3.0/1.0/2.0%', '4-6/7-11/12-14/15-24/25-26', null),
    ('1.0%', '5-26 [rehit: 2]/27-28', null),
    ('4.0/5.0%', '33-82', '47/(44/48)');

INSERT INTO public.hitboxes AS "diddy"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.0%', '3', '19'),
    ('1.5%', '5', '20'),
    ('4.0%', '5', '34'),
    ('10.0/7.0%', '10-11/12-16', '36'),
    ('6.0%', '6-11', '29'),
    ('5.5%', '4-5', '18'),
    ('2.0/2.0/3.0%', '8-9/16-17/22-23', '40'),
    ('5.0/11.0%', '12-13/21-23', '50'),
    ('2.5/6.0%', '5-8/12-15/19-23', '53'),
    ('12.0/15.0%', '7-8/12-13', '50'),
    ('6.0%', '8-20', '48'),
    ('10.0/8.0%', '6-9/10-16', '46'),
    ('9.0%', '5-8', '30'),
    ('7.0%', '4-7', '36'),
    ('13.0/10.0%', '15-16', '46'),
    ('3.3-15.0/2.0%', '16/17-121/124', '48'),
    ('23.0%', '123', '228'),
    (null, '18-36', '47/61'),
    ('14.0/10.0%', '6-10/11-25', '32'),
    ('10.0/8.0/6.0%', '8-9/10-16/17-35', null),
    ('18.0%', '1-2', '57-59'),
    (null, '20', '39');

INSERT INTO public.hitboxes AS "inkling"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    ('2.0%', '3-4', '19'),
    ('2.0%', '2-3', '21'),
    ('3.5%', '4-5', '29'),
    ('0.4%', '4 [rehit: 3]', null),
    ('2.5%', '6', '48'),
    ('10.0%', '8-10', '34'),
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

INSERT INTO public.throws AS "darkPit"
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

INSERT INTO public.throws AS "darkSamus"
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

INSERT INTO public.throws AS "diddy"
  ("fighterId", "name", "type")
  VALUES
    (13, 'grab', 'throw'),
    (13, 'dash grab', 'throw'),
    (13, 'pivot grab', 'throw'),
    (13, 'pummel', 'throw'),
    (13, 'forward throw', 'throw'),
    (13, 'backward throw', 'throw'),
    (13, 'up throw', 'throw'),
    (13, 'down throw', 'throw');

INSERT INTO public.throws AS "inkling"
  ("fighterId", "name", "type")
  VALUES
    (14, 'grab', 'throw'),
    (14, 'dash grab', 'throw'),
    (14, 'pivot grab', 'throw'),
    (14, 'pummel', 'throw'),
    (14, 'forward throw', 'throw'),
    (14, 'backward throw', 'throw'),
    (14, 'up throw', 'throw'),
    (14, 'down throw', 'throw');

INSERT INTO public.throws AS "joker"
  ("fighterId", "name", "type")
  VALUES
    (15, 'grab', 'throw'),
    (15, 'dash grab', 'throw'),
    (15, 'pivot grab', 'throw'),
    (15, 'pummel', 'throw'),
    (15, 'forward throw', 'throw'),
    (15, 'backward throw', 'throw'),
    (15, 'up throw', 'throw'),
    (15, 'down throw', 'throw');

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

INSERT INTO public.grappling AS "darkPit"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '6-7', '34'),
    (null, '9-10', '42'),
    (null, '10-11', '37'),
    ('1.3%', '1', '19'),
    ('6.0/4.0%', '12/14', '27'),
    ('8.0%', '29', '38'),
    ('4.0/7.0%', '13/15', '37'),
    ('2.0/4.0%', '13/16', '31');

INSERT INTO public.grappling AS "darkSamus"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '15-22', '59'),
    (null, '17-24', '67'),
    (null, '18-25', '62'),
    ('1.3%', '1', '19'),
    ('10.0%', '16', '41'),
    ('10.0%', '12', '49'),
    ('5.0/7.0%', '15/16', '41'),
    ('8.0%', '21', '37');

INSERT INTO public.grappling AS "diddy"
  ("damage", "activeFrames", "totalFrames")
  VALUES
    (null, '7-8', '36'),
    (null, '10-11', '44'),
    (null, '11-12', '39'),
    ('1.0%', '1', '16'),
    ('9.0%', '21', '31'),
    ('12.0%', '18', '51'),
    ('1.0/4.0%', '17/19', '26'),
    ('7.0%', '22', '31');

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

INSERT INTO public.movements AS "banjo"
  ("fighterId", "name", "type")
  VALUES
    (1, 'spot dodge', 'movements'),
    (1, 'forward roll', 'movements'),
    (1, 'backwards roll', 'movements'),
    (1, 'neutral air dodge', 'movements'),
    (1, 'air dodge, down', 'movements'),
    (1, 'air dodge, side + down', 'movements'),
    (1, 'air dodge, left/right', 'movements'),
    (1, 'air dodge, side + up', 'movements'),
    (1, 'air dodge up', 'movements');

INSERT INTO public.movements AS "bayonetta"
  ("fighterId", "name", "type")
  VALUES
    (2, 'spot dodge', 'movements'),
    (2, 'forward roll', 'movements'),
    (2, 'backwards roll', 'movements'),
    (2, 'neutral air dodge', 'movements'),
    (2, 'air dodge, down', 'movements'),
    (2, 'air dodge, side + down', 'movements'),
    (2, 'air dodge, left/right', 'movements'),
    (2, 'air dodge, side + up', 'movements'),
    (2, 'air dodge up', 'movements');

INSERT INTO public.movements AS "bowser"
  ("fighterId", "name", "type")
  VALUES
    (3, 'spot dodge', 'movements'),
    (3, 'forward roll', 'movements'),
    (3, 'backwards roll', 'movements'),
    (3, 'neutral air dodge', 'movements'),
    (3, 'air dodge, down', 'movements'),
    (3, 'air dodge, side + down', 'movements'),
    (3, 'air dodge, left/right', 'movements'),
    (3, 'air dodge, side + up', 'movements'),
    (3, 'air dodge up', 'movements');

INSERT INTO public.movements AS "bowserJr"
  ("fighterId", "name", "type")
  VALUES
    (4, 'spot dodge', 'movements'),
    (4, 'forward roll', 'movements'),
    (4, 'backwards roll', 'movements'),
    (4, 'neutral air dodge', 'movements'),
    (4, 'air dodge, down', 'movements'),
    (4, 'air dodge, side + down', 'movements'),
    (4, 'air dodge, left/right', 'movements'),
    (4, 'air dodge, side + up', 'movements'),
    (4, 'air dodge up', 'movements'),
    (4, 'up b, air dodge', 'movements');

INSERT INTO public.movements AS "byleth"
  ("fighterId", "name", "type")
  VALUES
    (5, 'spot dodge', 'movements'),
    (5, 'forward roll', 'movements'),
    (5, 'backwards roll', 'movements'),
    (5, 'neutral air dodge', 'movements'),
    (5, 'air dodge, down', 'movements'),
    (5, 'air dodge, side + down', 'movements'),
    (5, 'air dodge, left/right', 'movements'),
    (5, 'air dodge, side + up', 'movements'),
    (5, 'air dodge up', 'movements');

INSERT INTO public.movements AS "captainFalcon"
  ("fighterId", "name", "type")
  VALUES
    (6, 'spot dodge', 'movements'),
    (6, 'forward roll', 'movements'),
    (6, 'backwards roll', 'movements'),
    (6, 'neutral air dodge', 'movements'),
    (6, 'air dodge, down', 'movements'),
    (6, 'air dodge, side + down', 'movements'),
    (6, 'air dodge, left/right', 'movements'),
    (6, 'air dodge, side + up', 'movements'),
    (6, 'air dodge up', 'movements');

INSERT INTO public.movements AS "chrom"
  ("fighterId", "name", "type")
  VALUES
    (7, 'spot dodge', 'movements'),
    (7, 'forward roll', 'movements'),
    (7, 'backwards roll', 'movements'),
    (7, 'neutral air dodge', 'movements'),
    (7, 'air dodge, down', 'movements'),
    (7, 'air dodge, side + down', 'movements'),
    (7, 'air dodge, left/right', 'movements'),
    (7, 'air dodge, side + up', 'movements'),
    (7, 'air dodge up', 'movements');

INSERT INTO public.movements AS "cloud"
  ("fighterId", "name", "type")
  VALUES
    (8, 'spot dodge', 'movements'),
    (8, 'forward roll', 'movements'),
    (8, 'backwards roll', 'movements'),
    (8, 'neutral air dodge', 'movements'),
    (8, 'air dodge, down', 'movements'),
    (8, 'air dodge, side + down', 'movements'),
    (8, 'air dodge, left/right', 'movements'),
    (8, 'air dodge, side + up', 'movements'),
    (8, 'air dodge up', 'movements');

INSERT INTO public.movements AS "corrin"
  ("fighterId", "name", "type")
  VALUES
    (9, 'spot dodge', 'movements'),
    (9, 'forward roll', 'movements'),
    (9, 'backwards roll', 'movements'),
    (9, 'neutral air dodge', 'movements'),
    (9, 'air dodge, down', 'movements'),
    (9, 'air dodge, side + down', 'movements'),
    (9, 'air dodge, left/right', 'movements'),
    (9, 'air dodge, side + up', 'movements'),
    (9, 'air dodge up', 'movements');

INSERT INTO public.movements AS "daisy"
  ("fighterId", "name", "type")
  VALUES
    (10, 'spot dodge', 'movements'),
    (10, 'forward roll', 'movements'),
    (10, 'backwards roll', 'movements'),
    (10, 'neutral air dodge', 'movements'),
    (10, 'air dodge, down', 'movements'),
    (10, 'air dodge, side + down', 'movements'),
    (10, 'air dodge, left/right', 'movements'),
    (10, 'air dodge, side + up', 'movements'),
    (10, 'air dodge up', 'movements');

INSERT INTO public.movements AS "darkPit"
  ("fighterId", "name", "type")
  VALUES
    (11, 'spot dodge', 'movements'),
    (11, 'forward roll', 'movements'),
    (11, 'backwards roll', 'movements'),
    (11, 'neutral air dodge', 'movements'),
    (11, 'air dodge, down', 'movements'),
    (11, 'air dodge, side + down', 'movements'),
    (11, 'air dodge, left/right', 'movements'),
    (11, 'air dodge, side + up', 'movements'),
    (11, 'air dodge up', 'movements');

INSERT INTO public.movements AS "darkSamus"
  ("fighterId", "name", "type")
  VALUES
    (12, 'spot dodge', 'movements'),
    (12, 'forward roll', 'movements'),
    (12, 'backwards roll', 'movements'),
    (12, 'neutral air dodge', 'movements'),
    (12, 'air dodge, down', 'movements'),
    (12, 'air dodge, side + down', 'movements'),
    (12, 'air dodge, left/right', 'movements'),
    (12, 'air dodge, side + up', 'movements'),
    (12, 'air dodge up', 'movements');

INSERT INTO public.movements AS "diddy"
  ("fighterId", "name", "type")
  VALUES
    (13, 'spot dodge', 'movement'),
    (13, 'forward roll', 'movement'),
    (13, 'backwards roll', 'movement'),
    (13, 'neutral air dodge', 'movement'),
    (13, 'air dodge, down', 'movement'),
    (13, 'air dodge, side + down', 'movement'),
    (13, 'air dodge, left/right', 'movement'),
    (13, 'air dodge, side + up', 'movement'),
    (13, 'air dodge up', 'movement');

INSERT INTO public.movements AS "inkling"
  ("fighterId", "name", "type")
  VALUES
    (14, 'spot dodge', 'movement'),
    (14, 'forward roll', 'movement'),
    (14, 'backwards roll', 'movement'),
    (14, 'neutral air dodge', 'movement'),
    (14, 'air dodge, down', 'movement'),
    (14, 'air dodge, side + down', 'movement'),
    (14, 'air dodge, left/right', 'movement'),
    (14, 'air dodge, side + up', 'movement'),
    (14, 'air dodge up', 'movement');

INSERT INTO public.movements AS "joker"
  ("fighterId", "name", "type")
  VALUES
    (15, 'spot dodge', 'movement'),
    (15, 'forward roll', 'movement'),
    (15, 'backwards roll', 'movement'),
    (15, 'neutral air dodge', 'movement'),
    (15, 'air dodge, down', 'movement'),
    (15, 'air dodge, side + down', 'movement'),
    (15, 'air dodge, left/right', 'movement'),
    (15, 'air dodge, side + up', 'movement'),
    (15, 'air dodge up', 'movement');

INSERT INTO public.dodging AS "banjo"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-30', '45'),
    ('3-21', '62'),
    ('3-21', '69'),
    ('3-21', '75'),
    ('3-21', '88'),
    ('3-21', '97');

INSERT INTO public.dodging AS "bayonetta"
  ("activeFrames", "totalFrames")
  VALUES
    ('6-17 (bw: 2-5)', '20/25'),
    ('6-15 (bw: 2-5', '31'),
    ('6-16 (bw: 3-6', '36'),
    ('5-31 (bw: 1-4', '45'),
    ('5-21 (bw: 1-4', '63'),
    ('5-21 (bw: 1-4', '69'),
    ('5-21 (bw: 1-4', '74'),
    ('5-21 (bw: 1-4', '85'),
    ('5-21 (bw: 1-4', '93');

INSERT INTO public.dodging AS "bowser"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-18', '23/28'),
    ('4-16', '32'),
    ('5-17', '37'),
    ('4-32', '46'),
    ('4-22', '63'),
    ('4-22', '67'),
    ('4-22', '75'),
    ('4-22', '88'),
    ('4-22', '95');

INSERT INTO public.dodging AS "bowserJr"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-30', '48'),
    ('3-21', '67'),
    ('3-21', '77'),
    ('3-21', '82'),
    ('3-21', '93'),
    ('3-21', '108'),
    ('3-30', '33');

INSERT INTO public.dodging AS "byleth"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-30', '49'),
    ('3-21', '68'),
    ('3-21', '76'),
    ('3-21', '83'),
    ('3-21', '97'),
    ('3-21', '111');

INSERT INTO public.dodging AS "captainFalcon"
  ("activeFrames", "totalFrames")
  VALUES
    ('21/26', '21/26'),
    ('4-15', '30'),
    ('5-16', '35'),
    ('3-30', '42'),
    ('3-21', '62'),
    ('3-21', '66'),
    ('3-21', '72'),
    ('3-21', '85'),
    ('3-21', '94');

INSERT INTO public.dodging AS "chrom"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-29', '44'),
    ('3-21', '62'),
    ('3-21', '68'),
    ('3-21', '74'),
    ('3-21', '87'),
    ('3-21', '97');

INSERT INTO public.dodging AS "cloud"
  ("activeFrames", "totalFrames")
  VALUES
    ('9-10', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-30', '47'),
    ('3-21', '64'),
    ('3-21', '72'),
    ('3-21', '79'),
    ('3-21', '94'),
    ('3-21', '104');

INSERT INTO public.dodging AS "corrin"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-29', '49'),
    ('3-21', '67'),
    ('3-21', '75'),
    ('3-21', '81'),
    ('3-21', '97'),
    ('3-21', '107');

INSERT INTO public.dodging AS "daisy"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '21/26'),
    ('4-15', '30'),
    ('5-16', '35'),
    ('3-30', '61'),
    ('3-21', '86'),
    ('3-21', '92'),
    ('3-21', '103'),
    ('3-21', '124'),
    ('3-21', '141');

INSERT INTO public.dodging AS "darkPit"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-29', '52'),
    ('3-21', '73'),
    ('3-21', '82'),
    ('3-21', '89'),
    ('3-21', '110'),
    ('3-21', '119');

INSERT INTO public.dodging AS "darkSamus"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '34'),
    ('3-29', '52'),
    ('3-21', '73'),
    ('3-21', '82'),
    ('3-21', '89'),
    ('3-21', '110'),
    ('3-21', '119');

INSERT INTO public.dodging AS "diddy"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-16', '19/24'),
    ('4-14', '28'),
    ('4-15', '33'),
    ('2-27', '44'),
    ('2-19', '62'),
    ('2-19', '68'),
    ('2-19', '74'),
    ('2-19', '86'),
    ('2-19', '96');

INSERT INTO public.dodging AS "inkling"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-16', '29'),
    ('5-16', '34'),
    ('3-29', '50'),
    ('3-21', '70'),
    ('3-21', '76'),
    ('3-21', '84'),
    ('3-21', '100'),
    ('3-21', '112');

INSERT INTO public.dodging AS "joker"
  ("activeFrames", "totalFrames")
  VALUES
    ('3-17', '20/25'),
    ('4-15', '29'),
    ('5-16', '43'),
    ('3-30', '47'),
    ('3-21', '67'),
    ('3-21', '73'),
    ('3-21', '83'),
    ('3-21', '90'),
    ('3-21', '100');

INSERT INTO public.stats AS "banjo"
  ("fighterId", "name", "type")
  VALUES
    (1, 'weight', 'stat'),
    (1, 'gravity', 'stat'),
    (1, 'walk speed', 'stat'),
    (1, 'run speed', 'stat'),
    (1, 'initial dash', 'stat'),
    (1, 'air speed', 'stat'),
    (1, 'total air acceleration', 'stat'),
    (1, 'sh/fh/shff/fhff', 'stat'),
    (1, 'fall speed/fast fall speed', 'stat'),
    (1, 'out of shield, up smash', 'stat'),
    (1, 'out of shield, up air ', 'stat'),
    (1, 'out of shield, back air', 'stat'),
    (1, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "bayonetta"
  ("fighterId", "name", "type")
  VALUES
    (2, 'weight', 'stat'),
    (2, 'gravity', 'stat'),
    (2, 'walk speed', 'stat'),
    (2, 'run speed', 'stat'),
    (2, 'initial dash', 'stat'),
    (2, 'air speed', 'stat'),
    (2, 'total air acceleration', 'stat'),
    (2, 'sh/fh/shff/fhff', 'stat'),
    (2, 'fall speed/fast fall speed', 'stat'),
    (2, 'out of shield, up b', 'stat'),
    (2, 'out of shield, forward air/side b', 'stat'),
    (2, 'out of shield, neutral air/up air', 'stat'),
    (2, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "bowser"
  ("fighterId", "name", "type")
  VALUES
    (3, 'weight', 'stat'),
    (3, 'gravity', 'stat'),
    (3, 'walk speed', 'stat'),
    (3, 'run speed', 'stat'),
    (3, 'initial dash', 'stat'),
    (3, 'air speed', 'stat'),
    (3, 'total air acceleration', 'stat'),
    (3, 'sh/fh/shff/fhff', 'stat'),
    (3, 'fall speed/fast fall speed', 'stat'),
    (3, 'out of shield, up b', 'stat'),
    (3, 'out of shield, side b (air)', 'stat'),
    (3, 'out of shield, neutral air', 'stat'),
    (3, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "bowserJr"
  ("fighterId", "name", "type")
  VALUES
    (4, 'weight', 'stat'),
    (4, 'gravity', 'stat'),
    (4, 'walk speed', 'stat'),
    (4, 'run speed', 'stat'),
    (4, 'initial dash', 'stat'),
    (4, 'air speed', 'stat'),
    (4, 'total air acceleration', 'stat'),
    (4, 'sh/fh/shff/fhff', 'stat'),
    (4, 'fall speed/fast fall speed', 'stat'),
    (3, 'out of shield, up smash', 'stat'),
    (3, 'out of shield, up air', 'stat'),
    (3, 'out of shield, neutral air', 'stat'),
    (3, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "byleth"
  ("fighterId", "name", "type")
  VALUES
    (5, 'weight', 'stat'),
    (5, 'gravity', 'stat'),
    (5, 'walk speed', 'stat'),
    (5, 'run speed', 'stat'),
    (5, 'initial dash', 'stat'),
    (5, 'air speed', 'stat'),
    (5, 'total air acceleration', 'stat'),
    (5, 'sh/fh/shff/fhff', 'stat'),
    (5, 'fall speed/fast fall speed', 'stat'),
    (5, 'out of shield, neutral air', 'stat'),
    (5, 'out of shield, up b', 'stat'),
    (5, 'out of shield, up air/up smash', 'stat'),
    (5, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "captainFalcon"
  ("fighterId", "name", "type")
  VALUES
    (6, 'weight', 'stat'),
    (6, 'gravity', 'stat'),
    (6, 'walk speed', 'stat'),
    (6, 'run speed', 'stat'),
    (6, 'initial dash', 'stat'),
    (6, 'air speed', 'stat'),
    (6, 'total air acceleration', 'stat'),
    (6, 'sh/fh/shff/fhff', 'stat'),
    (6, 'fall speed/fast fall speed', 'stat'),
    (6, 'out of shield, neutral air/up air', 'stat'),
    (6, 'out of shield, back air', 'stat'),
    (6, 'out of shield, up b/jab', 'stat'),
    (6, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "chrom"
  ("fighterId", "name", "type")
  VALUES
    (7, 'weight', 'stat'),
    (7, 'gravity', 'stat'),
    (7, 'walk speed', 'stat'),
    (7, 'run speed', 'stat'),
    (7, 'initial dash', 'stat'),
    (7, 'air speed', 'stat'),
    (7, 'total air acceleration', 'stat'),
    (7, 'sh/fh/shff/fhff', 'stat'),
    (7, 'fall speed/fast fall speed', 'stat'),
    (7, 'out of shield, up air', 'stat'),
    (7, 'out of shield, neutral air', 'stat'),
    (7, 'out of shield, up b', 'stat'),
    (7, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "cloud"
  ("fighterId", "name", "type")
  VALUES
    (8, 'weight', 'stat'),
    (8, 'gravity', 'stat'),
    (8, 'walk speed', 'stat'),
    (8, 'run speed', 'stat'),
    (8, 'initial dash', 'stat'),
    (8, 'air speed', 'stat'),
    (8, 'total air acceleration', 'stat'),
    (8, 'sh/fh/shff/fhff', 'stat'),
    (8, 'fall speed/fast fall speed', 'stat'),
    (8, 'out of shield, up b', 'stat'),
    (8, 'out of shield, neutral air', 'stat'),
    (8, 'out of shield, up air', 'stat'),
    (8, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "corrin"
  ("fighterId", "name", "type")
  VALUES
    (9, 'weight', 'stat'),
    (9, 'gravity', 'stat'),
    (9, 'walk speed', 'stat'),
    (9, 'run speed', 'stat'),
    (9, 'initial dash', 'stat'),
    (9, 'air speed', 'stat'),
    (9, 'total air acceleration', 'stat'),
    (9, 'sh/fh/shff/fhff', 'stat'),
    (9, 'fall speed/fast fall speed', 'stat'),
    (9, 'out of shield, neutral air', 'stat'),
    (9, 'out of shield, up air', 'stat'),
    (9, 'out of shield, forward air', 'stat'),
    (9, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "daisy"
  ("fighterId", "name", "type")
  VALUES
    (10, 'weight', 'stat'),
    (10, 'gravity', 'stat'),
    (10, 'walk speed', 'stat'),
    (10, 'run speed', 'stat'),
    (10, 'initial dash', 'stat'),
    (10, 'air speed', 'stat'),
    (10, 'total air acceleration', 'stat'),
    (10, 'sh/fh/shff/fhff', 'stat'),
    (10, 'fall speed/fast fall speed', 'stat'),
    (10, 'out of shield, up b', 'stat'),
    (10, 'out of shield, neutral air', 'stat'),
    (10, 'out of shield, back air', 'stat'),
    (10, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "darkPit"
  ("fighterId", "name", "type")
  VALUES
    (11, 'weight', 'stat'),
    (11, 'gravity', 'stat'),
    (11, 'walk speed', 'stat'),
    (11, 'run speed', 'stat'),
    (11, 'initial dash', 'stat'),
    (11, 'air speed', 'stat'),
    (11, 'total air acceleration', 'stat'),
    (11, 'sh/fh/shff/fhff', 'stat'),
    (11, 'fall speed/fast fall speed', 'stat'),
    (11, 'out of shield, up smash', 'stat'),
    (11, 'out of shield, neutral air', 'stat'),
    (11, 'out of shield, down air', 'stat'),
    (11, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "darkSamus"
  ("fighterId", "name", "type")
  VALUES
    (12, 'weight', 'stat'),
    (12, 'gravity', 'stat'),
    (12, 'walk speed', 'stat'),
    (12, 'run speed', 'stat'),
    (12, 'initial dash', 'stat'),
    (12, 'air speed', 'stat'),
    (12, 'total air acceleration', 'stat'),
    (12, 'sh/fh/shff/fhff', 'stat'),
    (12, 'fall speed/fast fall speed', 'stat'),
    (12, 'out of shield, up b', 'stat'),
    (12, 'out of shield, up air', 'stat'),
    (12, 'out of shield, neutral air/z air/up smash', 'stat'),
    (12, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "diddy"
  ("fighterId", "name", "type")
  VALUES
    (13, 'weight', 'stat'),
    (13, 'gravity', 'stat'),
    (13, 'walk speed', 'stat'),
    (13, 'run speed', 'stat'),
    (13, 'initial dash', 'stat'),
    (13, 'air speed', 'stat'),
    (13, 'total air acceleration', 'stat'),
    (13, 'sh/fh/shff/fhff', 'stat'),
    (13, 'fall speed/fast fall speed', 'stat'),
    (13, 'out of shield, z-drop banana', 'stat'),
    (13, 'out of shield, up smash', 'stat'),
    (13, 'out of shield, up b/back air', 'stat'),
    (13, 'out of shield, forward air', 'stat'),
    (13, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "inkling"
  ("fighterId", "name", "type")
  VALUES
    (14, 'weight', 'stat'),
    (14, 'gravity', 'stat'),
    (14, 'walk speed', 'stat'),
    (14, 'run speed', 'stat'),
    (14, 'initial dash', 'stat'),
    (14, 'air speed', 'stat'),
    (14, 'total air acceleration', 'stat'),
    (14, 'sh/fh/shff/fhff', 'stat'),
    (14, 'fall speed/fast fall speed', 'stat'),
    (14, 'out of shield, neutral air/up smash', 'stat'),
    (14, 'out of shield, back air', 'stat'),
    (14, 'out of shield, up b', 'stat'),
    (14, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.stats AS "joker"
  ("fighterId", "name", "type")
  VALUES
    (15, 'weight', 'stat'),
    (15, 'gravity', 'stat'),
    (15, 'walk speed', 'stat'),
    (15, 'run speed', 'stat'),
    (15, 'initial dash', 'stat'),
    (15, 'air speed', 'stat'),
    (15, 'total air acceleration', 'stat'),
    (15, 'sh/fh/shff/fhff', 'stat'),
    (15, 'fall speed/fast fall speed', 'stat'),
    (15, 'out of shield, up air', 'stat'),
    (15, 'out of shield, forward air/back air/up smash', 'stat'),
    (15, 'out of shield, neutral air/gun/jab', 'stat'),
    (15, 'out of shield (counters), jump: rebel''s guard/tetrakarn', 'stat'),
    (15, 'shield grab (post-shieldstun)', 'stat');

INSERT INTO public.miscellaneous AS "banjo"
  ("statValue")
  VALUES
    ('106'),
    ('0.11'),
    ('1.06'),
    ('2.18'),
    ('1.68'),
    ('0.92'),
    ('0.07'),
    ('36/44/25/31'),
    ('1.76/2.816'),
    ('9 frames'),
    ('10 frames'),
    ('11 frames'),
    ('11 frames');

INSERT INTO public.miscellaneous AS "bayonetta"
  ("statValue")
  VALUES
    ('81'),
    ('.120'),
    ('0.945'),
    ('1.76'),
    ('1.936'),
    ('1.019'),
    ('0.095'),
    ('38/50/27/35'),
    ('1.77/2.832'),
    ('6 frames'),
    ('10 frames'),
    ('12 frames'),
    ('11 frames');

INSERT INTO public.miscellaneous AS "bowser"
  ("statValue")
  VALUES
    ('135'),
    ('0.125'),
    ('0.901'),
    ('1.971'),
    ('2.255'),
    ('1.155'),
    ('0.05'),
    ('31/45/22/31'),
    ('1.77/2.832'),
    ('6 frames'),
    ('9 frames'),
    ('11 frames'),
    ('12 frames');

INSERT INTO public.miscellaneous AS "bowserJr"
  ("statValue")
  VALUES
    ('108'),
    ('0.092'),
    ('0.924'),
    ('1.566'),
    ('1.76'),
    ('1.134'),
    ('0.08'),
    ('38/52/26/36'),
    ('1.65/2.64'),
    ('7 frames'),
    ('9 frames'),
    ('10 frames'),
    ('15 frames');

INSERT INTO public.miscellaneous AS "byleth"
  ("statValue")
  VALUES
    ('97'),
    ('0.089'),
    ('0.97'),
    ('1.43'),
    ('1.8'),
    ('0.89'),
    ('0.053'),
    ('35/45/24/31'),
    ('1.6/2.56'),
    ('9 frames'),
    ('9 frames'),
    ('13 frames'),
    ('10 frames');

INSERT INTO public.miscellaneous AS "captainFalcon"
  ("statValue")
  VALUES
    ('104'),
    ('0.120'),
    ('0.987'),
    ('2.552'),
    ('1.98'),
    ('1.218'),
    ('0.075'),
    ('34/48/24/34'),
    ('1.865/2.984'),
    ('10 frames'),
    ('13 frames'),
    ('14 frames'),
    ('10 frames');

INSERT INTO public.miscellaneous AS "chrom"
  ("statValue")
  VALUES
    ('95'),
    ('0.114'),
    ('1.208'),
    ('2.145'),
    ('2.2'),
    ('1.302'),
    ('0.05'),
    ('30/44/20/31'),
    ('1.8/2.88'),
    ('8 frames'),
    ('9 frames'),
    ('10 frames'),
    ('11 frames');

INSERT INTO public.miscellaneous AS "cloud"
  ("statValue")
  VALUES
    ('100'),
    ('0.098 (limit: 0.1078'),
    ('1.155 (limit: 1.32825'),
    ('2.167 (limit: 2.3837'),
    ('2.145 (limit: 2.3595'),
    ('1.155 (limit: 1.386'),
    ('0.07 (limit: 0.084'),
    ('37/49/26/34'),
    ('1.68/2.688 (limit: 1.848/2.9568'),
    ('7 frames'),
    ('8 frames'),
    ('11 frames'),
    ('13 frames');

INSERT INTO public.miscellaneous AS "corrin"
  ("statValue")
  VALUES
    ('98'),
    ('0.092'),
    ('1.208'),
    ('1.595'),
    ('1.892'),
    ('1.019'),
    ('0.05'),
    ('37/50/26/35'),
    ('1.65/2.64'),
    ('9 frames'),
    ('10 frames'),
    ('12 frames'),
    ('11 frames');

INSERT INTO public.miscellaneous AS "daisy"
  ("statValue")
  VALUES
    ('89'),
    ('0.070'),
    ('0.924'),
    ('1.595'),
    ('1.826'),
    ('1.029'),
    ('0.12'),
    ('41/57/28/40'),
    ('1.19/1.904'),
    ('7 frames'),
    ('8 frames'),
    ('9 frames'),
    ('10 frames');

INSERT INTO public.miscellaneous AS "darkPit"
  ("statValue")
  VALUES
    ('96'),
    ('0.081'),
    ('1.259'),
    ('1.828'),
    ('2.09'),
    ('0.935'),
    ('0.075'),
    ('38/52/26/37'),
    ('1.48/2.368'),
    ('6 frames'),
    ('7 frames'),
    ('13 frames'),
    ('10 frames');

INSERT INTO public.miscellaneous AS "darkSamus"
  ("statValue")
  VALUES
    ('108'),
    ('0.075'),
    ('1.115'),
    ('1.654'),
    ('1.87'),
    ('1.103'),
    ('0.09'),
    ('44/61/31/3l/43'),
    ('1.33/2.168'),
    ('4 frames'),
    ('8 frames'),
    ('11 frames'),
    ('19 frames');

INSERT INTO public.miscellaneous AS "diddy"
  ("statValue")
  VALUES
    ('90'),
    ('0.125'),
    ('1.313'),
    ('2.006'),
    ('2.09'),
    ('0.924'),
    ('0.05'),
    ('36/51/26/36'),
    ('1.75/2.8'),
    ('4 frames'),
    ('5 frames'),
    ('8 frames'),
    ('9 frames'),
    ('11 frames');

INSERT INTO public.miscellaneous AS "inkling"
  ("statValue")
  VALUES
    ('94'),
    ('0.087'),
    ('1.134'),
    ('1.925'),
    ('2.118'),
    ('1.208'),
    ('0.08'),
    ('40/52/27/36'),
    ('1.58/2.528'),
    ('9 frames'),
    ('10 frames'),
    ('12 frames'),
    ('12 frames');

INSERT INTO public.miscellaneous AS "joker"
  ("statValue")
  VALUES
    ('93'),
    ('0.127'),
    ('1.12'),
    ('2.06'),
    ('1.9'),
    ('1.1'),
    ('0.08'),
    ('30/45/210/30'),
    ('1.63/3.097'),
    ('8 frames'),
    ('10 frames'),
    ('15 frames'),
    ('6 frames/7 frames'),
    ('10 frames');
