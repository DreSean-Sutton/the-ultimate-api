set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE public.fighters(
	"fighter_id" serial NOT NULL,
	"fighter" TEXT NOT NULL UNIQUE,
	"roster_id" int NOT NULL UNIQUE,
	"display_name" TEXT NOT NULL UNIQUE,
	"createdAt" timestamp with time zone,
	CONSTRAINT "fighters_pk" PRIMARY KEY ("fighter_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.moves(
	"move_id" serial NOT NULL,
	"fighter_id" int NOT NULL,
	"name" TEXT NOT NULL,
	"move_type" TEXT,
	"createdAt" timestamp with time zone,
	CONSTRAINT "moves_pk" PRIMARY KEY ("move_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE public.hitboxes(
	"move_id" serial NOT NULL,
	"damage" TEXT,
	"active_frames" TEXT,
	"total_frames" TEXT,
	"createdAt" timestamp with time zone,
	CONSTRAINT "hitboxes_pk" PRIMARY KEY ("move_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE public.moves ADD CONSTRAINT "moves_fk0" FOREIGN KEY ("fighter_id") REFERENCES "fighters"("fighter_id");

ALTER TABLE public.hitboxes ADD CONSTRAINT "hitboxes_fk0" FOREIGN KEY ("move_id") REFERENCES "moves"("move_id");
