CREATE TABLE sector (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT
);

CREATE TABLE grade (
  id SERIAL PRIMARY KEY,
  grade_score VARCHAR(10) NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE subsector (
  id SERIAL PRIMARY KEY,
  id_sector INTEGER,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  FOREIGN KEY (id_sector) REFERENCES sector(id)
);

CREATE TABLE boulder (
  id SERIAL PRIMARY KEY,
  id_subsector INTEGER,
  id_grade INTEGER,
  condition INTEGER check (condition>0),
  coordinates VARCHAR(255),
  FOREIGN KEY (id_subsector) REFERENCES subsector(id),
  FOREIGN KEY (id_grade) REFERENCES grade(id)
);




CREATE TABLE "user" (
  id SERIAL PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  phone VARCHAR(20),
  address TEXT,
  pwd VARCHAR(255) NOT NULL,
  age INTEGER Check (age >0)
);

CREATE TABLE boulder_climbed (
  id SERIAL PRIMARY KEY,
  id_user INTEGER,
  id_boulder INTEGER,
  date DATE,
  comments TEXT,
  FOREIGN KEY (id_user) REFERENCES "user"(id),
  FOREIGN KEY (id_boulder) REFERENCES boulder(id)
);

CREATE TABLE ranking (
  id SERIAL PRIMARY KEY,
  id_user INTEGER,
  score INTEGER,
  FOREIGN KEY (id_user) REFERENCES "user"(id)
);
