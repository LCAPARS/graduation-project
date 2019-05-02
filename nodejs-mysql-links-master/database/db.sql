CREATE DATABASE db_links;

USE db_links;

-- TABLE USER
-- all pasword wil be encrypted using SHA1
CREATE TABLE users (
  id INT(11) NOT NULL,
  username VARCHAR(16) NOT NULL, 
  password VARCHAR(60) NOT NULL,
  fullname VARCHAR(100) NOT NULL
);

ALTER TABLE users
  ADD PRIMARY KEY (id);

ALTER TABLE users
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE users;

INSERT INTO users (id, username, password, fullname) 
  VALUES (1, 'john', 'password1', 'John Carter');

SELECT * FROM users;


-- SUBJECTS TABLE
CREATE TABLE subjects (
  id INT(11) NOT NULL,
  name VARCHAR(255) NOT NULL,
  entries INT(12) NOT NULL DEFAULT 0
);

ALTER TABLE subjects
  ADD PRIMARY KEY (id);

ALTER TABLE subjects
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE subjects;

INSERT INTO subjects (id, name)
  VALUES (1, "Mathematics");

INSERT INTO subjects (id, name)
  VALUES (2, "Physics");

INSERT INTO subjects (id, name)
  VALUES (3, "Biology");

SELECT * FROM subjects;


-- ENTRIES TABLE
CREATE TABLE entries (
  id INT(11) NOT NULL,
  name VARCHAR(255) NOT NULL,
  grade INT(2) NOT NULL,
  definition TEXT NOT NULL,
  description TEXT NOT NULL,
  subject INT(11) NOT NULL,
  picture TEXT,
  CONSTRAINT c_sub FOREIGN KEY(subject) REFERENCES subjects(id)
);

ALTER TABLE entries
  ADD PRIMARY KEY (id);

ALTER TABLE entries
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE entries;


INSERT INTO entries (id, name, grade , definition, description, subject, picture)
  VALUES (1, "Derivatives", 10 ,"In mathematics, the derivative of a function is the ratio of instantaneous change with which the value of said mathematical function changes, as the value of its independent variable changes. The derivative of a function is a local concept, that is, it is calculated as the limit of the average rate of change of the function in a certain interval, when the interval considered for the independent variable becomes smaller and smaller. That is why we talk about the value of the derivative of a function at a given point." ,"Calculus", 1, "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Derivada_cero_11b.svg/280px-Derivada_cero_11b.svg.png");
INSERT INTO entries (id, name, grade , definition, description, subject, picture)
  VALUES (2, "Line", 8 ,"A geometrical object that is straight, infinitely long and infinitely thin." ,"Algebra", 1, "http://imagenes.mailxmail.com/cursos/imagenes/1/0/conceptos-basicos-de-geometria_1801_1_1.gif");
INSERT INTO entries (id, name, grade , definition, description, subject, picture)
  VALUES (3, "Integrales", 11 ,"Divina la Adivina" ,"Juegos y Chismes", 2, "");


SELECT * FROM entries;

-- LINKS TABLE
CREATE TABLE links (
  id INT(11) NOT NULL,
  title VARCHAR(150) NOT NULL,
  url VARCHAR(255) NOT NULL,
  description TEXT,
  user_id INT(11),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id)
);

ALTER TABLE links
  ADD PRIMARY KEY (id);

ALTER TABLE links
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE links;