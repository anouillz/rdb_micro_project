-- Exemple d'insertion des données dans les tables

-- Insertion de données dans la table sector
INSERT INTO sector (name, description) VALUES
  ('Apremont', 'Un site magnifique.'),
  ('Franchard', 'Une célèbre zone de bloc.'),
  ('Nord FontaineBleau', 'Un site d escalade de renommée mondiale.'),
  ('Nemours', 'Un paradis de l escalade.');

-- Insertion de données dans la table grade
INSERT INTO grade (grade_score, name) VALUES
  ('20', '7A'),
  ('10', '6C'),
  ('60', '8B'),
  ('5', '5A'),
  ('500', '9A');

-- Insertion de données dans la table subsector
INSERT INTO subsector (sect_id, name, description) VALUES
  (1, 'Apremont Belvédère', 'Un sous-secteur classique avec de nombreux blocs emblématiques.'),
  (1, 'Apremont Bizons', 'Un vaste sous-secteur avec une grande variété de difficultés.'),
  (2, 'Cuisinière', 'Secteur principal de Franchard.'),
  (3, 'Le Calvaire', 'Un sous-secteur bien connu.'),
  (4, 'La Fosse aux Loups', 'Sous-secteur célèbre de Nemours.');

-- Insertion de données dans la table boulder
INSERT INTO boulder (subsect_id, gd_id, condition, coordinates) VALUES
  (1, 1, 5, '48.4023,2.7053'),
  (1, 2, 4, '48.4024,2.7055'),
  (2, 3, 3, '48.4071,2.7131'),
  (3, 4, 2, '40.4123,-1.2345'),
  (4, 5, 1, '-32.3411,19.3178');

-- Insertion de données dans la table climber
INSERT INTO climber (fname, lname, email, phone, address, pwd_hash, age) VALUES
  ('Alice', 'Durand', 'alice.durand@example.com', '0612345678', '12 rue des Érables, Paris', 'hashed_password1', 55),
  ('Bob', 'Martin', 'bob.martin@example.com', '0623456789', '34 avenue des Champs, Lyon', 'hashed_password2', 30),
  ('Charlie', 'Dupont', 'charlie.dupont@example.com', '0634567890', '56 boulevard Haussmann, Lille', 'hashed_password3', 22),
  ('Diane', 'Lemoine', 'diane.lemoine@example.com', '0645678901', '78 rue des Acacias, Bordeaux', 'hashed_password4', 28),
  ('Ethan', 'Morel', 'ethan.morel@example.com', '0656789012', '90 avenue du Maréchal, Nice', 'hashed_password5', 35);

-- Insertion de données dans la table boulder_climbed
INSERT INTO boulder_climbed (cl_id, bd_id, date_climb, comments) VALUES
  (1, 1, '2023-06-15', 'Un bloc classique, très agréable à grimper.'),
  (2, 2, '2023-06-16', 'Conditions idéales, bloc technique.'),
  (3, 3, '2023-06-17', 'Bloc difficile mais satisfaisant.'),
  (4, 4, '2023-07-01', 'Bloc au paysage magnifique, mais très physique.'),
  (5, 5, '2023-07-02', 'Bloc extrême, un vrai défi.');

-- Insertion de données dans la table ranking
INSERT INTO ranking (cl_id, score) VALUES
  (1, 1500),
  (2, 1250),
  (3, 1100),
  (4, 1450),
  (5, 1700);

