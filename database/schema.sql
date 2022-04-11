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

CREATE TABLE public."characterMoves"(
  "characterId" int NOT NULL,
  "moveId" SERIAL REFERENCES public.moves
);
