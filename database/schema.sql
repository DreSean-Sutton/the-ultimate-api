set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE public.fighters(
	"fighterId" serial NOT NULL,
	"fighter" TEXT NOT NULL UNIQUE,
	"rosterId" int NOT NULL UNIQUE,
	"displayName" TEXT NOT NULL UNIQUE,
	"createdAt" timestamp with time zone,
	CONSTRAINT "fighters_pk" PRIMARY KEY ("fighterId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.moves(
	"moveId" serial NOT NULL,
	"fighterId" int NOT NULL,
	"name" TEXT NOT NULL,
	"moveType" TEXT,
	"createdAt" timestamp with time zone,
	CONSTRAINT "moves_pk" PRIMARY KEY ("moveId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.hitboxes(
	"moveId" serial NOT NULL,
	"damage" TEXT,
	"activeFrames" TEXT,
	"totalFrames" TEXT,
	"createdAt" timestamp with time zone,
	CONSTRAINT "hitboxes_pk" PRIMARY KEY ("moveId")
) WITH (
  OIDS=FALSE
);




ALTER TABLE public.moves ADD CONSTRAINT "moves_fk0" FOREIGN KEY ("fighterId") REFERENCES "fighters"("fighterId");

ALTER TABLE public.hitboxes ADD CONSTRAINT "hitboxes_fk0" FOREIGN KEY ("moveId") REFERENCES "moves"("moveId");
