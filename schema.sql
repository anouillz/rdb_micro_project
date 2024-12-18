CREATE TABLE sector (
  sect_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT
);

CREATE TABLE grade (
  gd_id SERIAL PRIMARY KEY,
  score VARCHAR(10) NOT NULL,
  name VARCHAR(3) NOT NULL
);

CREATE TABLE subsector (
  subsect_id SERIAL PRIMARY KEY,
  sect_id INTEGER,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  FOREIGN KEY (sect_id) REFERENCES sector(sect_id)
);

CREATE TABLE boulder (
  bd_id SERIAL PRIMARY KEY,
  subsect_id INTEGER,
  gd_id INTEGER,
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
  cl_id INTEGER,
  bd_id INTEGER,
  date DATE,
  comments TEXT,
  FOREIGN KEY (cl_id) REFERENCES climber(cl_id),
  FOREIGN KEY (bd_id) REFERENCES boulder(bd_id)
);

CREATE TABLE ranking (
  rk_id SERIAL PRIMARY KEY,
  cl_id INTEGER,
  score INTEGER,
  FOREIGN KEY (cl_id) REFERENCES climber(cl_id)
);
