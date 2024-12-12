CREATE TABLE "sector" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "description" varchar
);

CREATE TABLE "user" (
  "id" integer PRIMARY KEY,
  "fname" varchar,
  "lname" varchar,
  "email" varchar,
  "phone" varchar,
  "adress" varchar,
  "pwd" varchar,
  "age" integer
);

CREATE TABLE "boulder" (
  "id" integer PRIMARY KEY,
  "id_subsector" integer,
  "id_grade" integer,
  "condition" integer,
  "coordinates" varchar
);

CREATE TABLE "subsector" (
  "id" integer PRIMARY KEY,
  "id_sector" integer,
  "name" varchar,
  "description" varchar
);

CREATE TABLE "boulder_climbed" (
  "id" integer PRIMARY KEY,
  "id_user" integer,
  "id_boulder" integer,
  "date" DATE,
  "comments" varchar
);

CREATE TABLE "ranking" (
  "id" integer PRIMARY KEY,
  "id_user" integer,
  "score" integer
);

CREATE TABLE "grade" (
  "id" integer PRIMARY KEY,
  "grade_score" varchar,
  "name" varchar
);

ALTER TABLE "boulder" ADD FOREIGN KEY ("id_subsector") REFERENCES "subsector" ("id");

ALTER TABLE "subsector" ADD FOREIGN KEY ("id_sector") REFERENCES "sector" ("id");

ALTER TABLE "boulder" ADD FOREIGN KEY ("id") REFERENCES "boulder_climbed" ("id_boulder");

ALTER TABLE "user" ADD FOREIGN KEY ("id") REFERENCES "boulder_climbed" ("id_user");

ALTER TABLE "grade" ADD FOREIGN KEY ("id") REFERENCES "boulder" ("id_grade");

ALTER TABLE "user" ADD FOREIGN KEY ("id") REFERENCES "ranking" ("id_user");
