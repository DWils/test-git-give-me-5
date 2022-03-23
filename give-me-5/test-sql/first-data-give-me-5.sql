/* Un bloc de commentaire
*/

--une ligne de commentaire

/* Create a table called Personnes */
CREATE TABLE Personnes(Id integer PRIMARY KEY, prenom text, age int, metier text );

/* Create few records in this table */
INSERT INTO Personnes VALUES(1,'Tom', 28 , 'Cuisinier');
INSERT INTO Personnes VALUES(2,'Lucy', 18 , 'Etudiante');
INSERT INTO Personnes VALUES(3,'Frank', 31 , 'Cariste');
INSERT INTO Personnes VALUES(4,'Jane',  21 , 'Musicienne' );
INSERT INTO Personnes VALUES(5,'Robert', 54 , 'Chauffeur');

-- 1. Afficher les toutes les colonnes de la table personnes
select * from personnes;

-- 2. Afficher juste le prénom
select prenom from personnes;

-- 3 affichez le prenom et l'age
SELECT pRenom, age FROM PERSONNES;

-- 4 Affichez les informations de Lucy
select * from personnes where prenom = 'Lucy';

-- 5 affichez le prenom et l'age du Cuisinier
select prenom, age from personnes where metier = 'Cuisinier';

-- 6 Affichez les personnes qui ne sont pas Cariste
select * from personnes where metier != 'Cariste';
select * from personnes where not metier = 'Cariste';

-- 7 Affichez les personnes de plus de 30 ans
select * from personnes where age > 30;

-- 8 Affichez les personnes de moins de 40 ans
select * from personnes where age < 40;

-- 9 Afficher la personne de moins de 30 ans et qui est musicienne
select * from personnes where age < 30 and metier = 'Musicienne';

-- 10 Afficher le Cuisinier et le Chauffeur
SELECT * from personnes where metier = 'Cuisinier' or metier = 'Chauffeur';

--11 Affichez les personnes de moins de 40 ans et qui ont un id > 2
select * from personnes where age < 40 and id > 2;

-- 12. trouvez les prénoms qui contiennent un 'a'
select prenom from personnes where prenom like '%a%';

-- 13. Trouvez les métiers qui contiennent à la fois un 'e' et un 'r'
select * from personnes where metier like '%e%' and metier like '%r%';

-- Bonus Affichez les personnes qui ont un métier qui contient au moins 2 voyelles identiques trié par ordre alphabétique de prénom
select * from personnes 
where metier like '%e%e%' 
or metier like '%E%e%' 
or metier like '%a%a%'
or metier like '%i%i%'
or metier like '%o%o%'
or metier like '%u%u%'
or metier like '%y%y%'
order by prenom;

-- 14. Affichez le Cariste, le Cuisinier et l'Etudiante
select * from personnes where metier in ('Cariste','Cuisinier', 'Etudiante');

-- 15. affichez les personnes entre 20 et 40 ans
select * from personnes where age BETWEEN 20 and 40;


-- 16. Affichez toute la table par ordre croissant d'age
select * from personnes order by age;

-- 17. Affichez les personnes qui ne sont pas compris entre 20 et 40 ans par ordre décroissant d'age
select * from personnes where age not BETWEEN 20 and 40 order by age desc;

create table voiture(id_voiture int primary key not null,marque varchar(20),modele varchar(20),prix float,date_circulation date,couleur varchar(20));

-- insertion donnees

INSERT INTO voiture VALUES(1,'bmw', 'm5' , 138000,'2019-05-26','bleu');

INSERT INTO voiture VALUES(2,'ford', 'mustang' , 75000,'1969-02-05','noir');
INSERT INTO voiture VALUES(3,'toyota', 'yaris' , 15350,'2020-12-07','rouge');
INSERT INTO voiture VALUES(4,'nissan', 'primera' , 1700,'1998-07-20','blanc');

ALTER TABLE personnes ADD column FK_id_voiture int;  

-- verification ds la table personnes
select * from personnes;  
update personnes set fk_id_voiture=1 where prenom='Jane';  
update personnes set fk_id_voiture=2 where prenom='Robert'; 
update personnes set fk_id_voiture=3 where prenom='Tom'; 
update personnes set fk_id_voiture=4 where prenom='Frank';

-- 18 Affichez la personne qui n'a pas de voiture
select * from personnes where fk_id_voiture is null;

-- 19 Affichez ceux qui en ont une
select * from personnes where fk_id_voiture is not null;

-- 20 on va joindre les 2 tables :  
-- Affichez le prenom de la personne avec la marque et le modèle de de sa voiture

create view propriete as
select prenom, marque, modele from personnes join voiture on fk_id_voiture = id_voiture;

select * from propriete;

insert into voiture VALUES (5,'Renault','Twingo',5000, '1998-05-05', 'vert bouteille' );
insert into voiture VALUES (6,'Renault','Twingo',5000, '1998-05-05', 'jaune fluo' );

update personnes set fk_id_voiture = 5 where prenom = 'Lucy';

DELETE from voiture where couleur like 'jaune%'
