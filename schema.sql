CREATE TABLE sector (
  sect_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT
);

CREATE TABLE grade (
  gd_id SERIAL PRIMARY KEY,
  grade_score INTEGER NOT NULL,
  name VARCHAR(3) NOT NULL
);

CREATE TABLE subsector (
  subsect_id SERIAL PRIMARY KEY,
  sect_id INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  FOREIGN KEY (sect_id) REFERENCES sector(sect_id)
);

CREATE TABLE boulder (
  bd_id SERIAL PRIMARY KEY,
  subsect_id INTEGER NOT NULL,
  gd_id INTEGER NOT NULL,
  condition INTEGER check (condition>0),
  coordinates VARCHAR(255),
  FOREIGN KEY (subsect_id) REFERENCES subsector(subsect_id),
  FOREIGN KEY (gd_id) REFERENCES grade(gd_id)
);

CREATE TABLE climber (
  cl_id SERIAL PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  phone VARCHAR(20),
  address TEXT,
  pwd_hash VARCHAR(255) NOT NULL,
  age INTEGER Check (age >0)
);

CREATE TABLE boulder_climbed (
  bdc_id SERIAL PRIMARY KEY,
  cl_id INTEGER NOT NULL,
  bd_id INTEGER NOT NULL,
  date_climb DATE,
  comments TEXT,
  FOREIGN KEY (cl_id) REFERENCES climber(cl_id),
  FOREIGN KEY (bd_id) REFERENCES boulder(bd_id)
);

CREATE TABLE ranking (
  rk_id SERIAL PRIMARY KEY,
  cl_id INTEGER NOT NULL,
  score INTEGER NOT NULL,
  FOREIGN KEY (cl_id) REFERENCES climber(cl_id)
);

-- Index sur les clés étrangères pour accélérer les jointures
CREATE INDEX idx_subsector_sect_id ON subsector (sect_id);
CREATE INDEX idx_boulder_gd_id ON boulder (gd_id);
CREATE INDEX idx_ranking_cl_id ON ranking (cl_id);

-- Index sur les difficultés de blocs
CREATE INDEX idx_boulder_difficulty ON boulder (gd_id);

-- Index sur les scores utilisateurs
CREATE INDEX idx_ranking_score ON ranking (score);
