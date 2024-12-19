-- Requêtes pour les fonctionnalités du projet

-- UTILISATEUR

-- Création d'un compte utilisateur
INSERT INTO climber (fname, lname, email, phone, address, pwd_hash, age) VALUES
  ('John', 'Doe', 'john.doe@example.com', '0712345678', '123 Main St, Anytown', 'hashed_password', 29);

-- Authentification de l'utilisateur
SELECT cl_id FROM climber WHERE email = 'john.doe@example.com' AND pwd_hash = 'hashed_password';

-- Modification des informations de l'utilisateur
UPDATE climber SET phone = '0798765432', address = '456 New St, Anytown' WHERE cl_id = 1;

-- NAVIGATION

-- Liste des secteurs
SELECT * FROM sector;

-- Affichage des sous-secteurs dans un secteur donné
SELECT * FROM subsector WHERE sect_id = 1;

-- Affichage des blocs dans les sous-secteurs
SELECT * FROM boulder WHERE subsect_id = 1;

-- Afficher les détails d'un bloc spécifique
SELECT * FROM boulder WHERE bd_id = 1;

-- Afficher le score moyen des personnes qui ont grimpés ce bloc
SELECT ROUND(AVG(score),2) AS avg_score FROM ranking r
JOIN boulder_climbed bc ON r.cl_id = bc.cl_id WHERE bc.bd_id = 1;

-- GESTION DES BLOCS GRIMPÉS

-- Nouveau bloc grimpé pour un utilisateur (date, commentaire)
INSERT INTO boulder_climbed (cl_id, bd_id, date_climb, comments) VALUES (1, 2, '2023-07-01', 'Excellent bloc, très technique.');

-- Voir les blocs qu'un utilisateur a grimpé
SELECT * FROM boulder_climbed WHERE cl_id = 1;

-- Voir les blocs dans un secteur ou sous-secteur spécifique pour lister les blocs
SELECT b.* FROM boulder b
JOIN subsector s ON b.subsect_id = s.subsect_id
WHERE s.sect_id = 1;

-- Nombre total de blocs grimpés
SELECT COUNT(*) AS total_blocks FROM boulder_climbed WHERE cl_id = 1;

-- Niveau moyen des blocs grimpés par l'utilisateur
SELECT ROUND(AVG(gd.grade_score),2) AS avg_level FROM boulder_climbed bc
JOIN boulder b ON bc.bd_id = b.bd_id
JOIN grade gd ON b.gd_id = gd.gd_id
WHERE bc.cl_id = 1;

-- CLASSEMENT

-- Calculer le score d'un utilisateur
SELECT SUM(gd.grade_score) AS total_score FROM boulder_climbed bc
JOIN boulder b ON bc.bd_id = b.bd_id
JOIN grade gd ON b.gd_id = gd.gd_id
WHERE bc.cl_id = 1;

-- Obtenir le classement des utilisateurs
SELECT cl.cl_id, cl.fname, cl.lname, r.score FROM climber cl
JOIN ranking r ON cl.cl_id = r.cl_id
ORDER BY r.score DESC;

-- Classement total score
SELECT * FROM ranking ORDER BY score DESC;

-- Classement par difficulté
SELECT cl.cl_id, cl.fname, cl.lname, ROUND(AVG(gd.grade_score),2) AS avg_difficulty FROM boulder_climbed bc
JOIN boulder b ON bc.bd_id = b.bd_id
JOIN grade gd ON b.gd_id = gd.gd_id
JOIN climber cl ON bc.cl_id = cl.cl_id
GROUP BY cl.cl_id, cl.fname, cl.lname
ORDER BY avg_difficulty DESC;

-- RECHERCHE

-- Recherche des blocs par niveau de difficulté
SELECT * FROM boulder b
JOIN grade g ON b.gd_id = g.gd_id
WHERE g.grade_score = '20';

-- Recherche des blocs par état
SELECT * FROM boulder WHERE condition = 5;


