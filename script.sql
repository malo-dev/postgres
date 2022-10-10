sudo -u postgres createuser --interactive
psql -h localhost -U admin -d postgres

CREATE DATABASE malodb OWNER admin;
CREATE TABLE student(student_id INT PRIMARY KEY UNIQUE, prenom VARCHAR(50), nom VARCHAR(50),sexe CHAR(1), cour_actuel BOOLEAN DEFAULT 'false', region VARCHAR(50));
CREATE TABLE staff(staff_id INT PRIMARY KEY UNIQUE, prenom VARCHAR(50), nom VARCHAR(50),sexe CHAR(1), cours VARCHAR(50), region VARCHAR(50));
CREATE TABLE cours(cours_id INT PRIMARY KEY UNIQUE, nom VARCHAR(50), salle VARCHAR(50), staff_id INT);
CREATE TABLE assigment(assigment_id INT PRIMARY KEY UNIQUE, cours_id INT, salle VARCHAR(50), staff_id INT, student_id INT);


CREATE USER teacher PASSWORD 'teacher';
CREATE USER student PASSWORD 'student';


GRANT SELECT  ON cours TO student;
GRANT SELECT  ON student TO student;
GRANT SELECT  ON assigment TO student;

GRANT SELECT  ON staff TO teacher;
GRANT ALL  ON student TO teacher;
GRANT ALL  ON cours TO teacher;
GRANT ALL  ON assigment TO teacher;


INSERT INTO student VALUES (1, 'Jospin', 'Kanane', 'm', 'true', 'sud-kivu'); 
INSERT INTO student  VALUES (2, 'Espe', 'Mene', 'f', 'false', 'tanganyika'); 
INSERT INTO student  VALUES (3, 'Winny', 'Miro', 'f', 'true', 'nord-kivu'); 
INSERT INTO student  VALUES (4, 'Thord', 'Kanane', 'm', 'false', 'bandundu'); 
INSERT INTO student  VALUES (5, 'Benjamin', 'Akonkwa', 'm', 'true', 'sud-kivu'); 



INSERT INTO staff VALUES (101, 'Alex', 'Kanane', 'm', 'Anglais', 'sud-kivu'); 
INSERT INTO staff  VALUES (102, 'Phidias', 'Nene', 'm', 'Histoire', 'tanganyika'); 
INSERT INTO staff  VALUES (103, 'Estella', 'Miro', 'f', 'Geologie', 'nord-kivu'); 
INSERT INTO staff  VALUES (104, 'Joel', 'Kanane', 'm', 'Physique', 'bandundu'); 
INSERT INTO staff  VALUES (105, 'Benjamin', 'Asifiwe', 'm', 'Informatique', 'sud-kivu'); 



INSERT INTO cours VALUES (1001, 'Histoire', 'adam', 102, 3); 
INSERT INTO cours  VALUES (1002, 'Anglais',  'eve', 101, 5); 
INSERT INTO cours  VALUES (1003, 'Geologie', 'Miro', 103, 1); 
INSERT INTO cours  VALUES (1004, 'Physique', 'adam', 104, 4); 
INSERT INTO cours  VALUES (1005, 'Informatique', 'eve', 105, 2); 




INSERT INTO assigment VALUES (2001, 1001, 'eve', 1002, 3); 
INSERT INTO assigment  VALUES (2002, 1002, 'adam', 1003, 2); 
INSERT INTO assigment  VALUES (2003, 1003, 'moro', 1001, 4); 
INSERT INTO assigment  VALUES (2004, 1004, 'eve', 1004, 1); 
INSERT INTO assigment  VALUES (2005, 1005, 'adam', 1005, 5); 
