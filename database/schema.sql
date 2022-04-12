set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE public.fighters(
  "fighterId" SERIAL NOT NULL,
  "fighter" TEXT NOT NULL,
  "rosterId" VARCHAR NOT NULL,
  "displayName" TEXT NOT NULL,
  "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  PRIMARY KEY("fighterId")
);


CREATE TABLE public.moves(
  "moveId" SERIAL NOT NULL,
  "fighterId" INT REFERENCES public.fighters,
  "name" TEXT NOT NULL,
  "moveType" TEXT,
  "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  PRIMARY KEY("moveId")
);

CREATE TABLE public.hitboxes(
  "moveId" SERIAL REFERENCES public.moves,
  "damage" TEXT,
  "activeFrames" TEXT,
  "totalFrames" TEXT,
  "createdAt" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  PRIMARY KEY("moveId")
);
