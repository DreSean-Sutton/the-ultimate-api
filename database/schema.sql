set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE public.fighters(
  "fighterId" SERIAL NOT NULL,
  "fighter" VARCHAR(500) NOT NULL,
  "rosterId" VARCHAR NOT NULL,
  "displayName" VARCHAR(500) NOT NULL,
  "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT NOW(),
  PRIMARY KEY("fighterId")
);


CREATE TABLE public.moves(
  "moveId" SERIAL NOT NULL,
  "fighterId" INT REFERENCES public.fighters,
  "name" VARCHAR(50) NOT NULL,
  "damage" VARCHAR(50) NOT NULL,
  "activeFrames" VARCHAR(50) NOT NULL,
  "totalFrames" VARCHAR(50) NOT NULL,
  "hitboxType" VARCHAR(50) NOT NULL,
  "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT NOW(),
  PRIMARY KEY("moveId")
);
