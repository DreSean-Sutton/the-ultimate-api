
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
