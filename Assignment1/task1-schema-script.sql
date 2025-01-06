

CREATE TABLE ingredient (
 iid number PRIMARY KEY,
 iname varchar2(20) ,
 alcohol_concentration number );

CREATE TABLE restaurant (
 rid number PRIMARY KEY,
 rname varchar2(30) ,
 zipcode number(6,0),
 city varchar2(20));

CREATE TABLE glass (
 gid number PRIMARY KEY,
 gname varchar2(15) );

CREATE TABLE cocktail (
 cid number PRIMARY KEY,
 cname varchar2(20),
 alcoholic char(1),
 gid number,
 FOREIGN KEY (gid) REFERENCES glass (gid));

CREATE TABLE person (
 pid number PRIMARY KEY,
 pname varchar2(20),
 birthdate date);

CREATE TABLE ingredient_cocktail (
 iid number,
 cid number,
 amount number,
 PRIMARY KEY (iid, cid),
 FOREIGN KEY (iid) REFERENCES ingredient (iid),
 FOREIGN KEY (cid) REFERENCES cocktail (cid));

CREATE TABLE cocktail_person (
 cid number,
 pid1 number,
 pid2 number,
 PRIMARY KEY (cid, pid1, pid2),
 FOREIGN KEY (cid) REFERENCES cocktail (cid),
FOREIGN KEY (pid1) REFERENCES person (pid),
 FOREIGN KEY (pid2) REFERENCES person (pid));

CREATE TABLE cocktail_restaurant (
 cid number,
 rid number,
 PRIMARY KEY (rid, cid),
 FOREIGN KEY (rid) REFERENCES restaurant (rid),
 FOREIGN KEY (cid) REFERENCES cocktail (cid));


INSERT INTO person VALUES (1,'Kaiservonchina','23-FEB-36');
INSERT INTO person VALUES (2,'Thomas','23-SEP-76');
INSERT INTO person VALUES (3,'Vannara','11-DEC-80');
INSERT INTO person VALUES (4,'Luana','23-NOV-77');
INSERT INTO person VALUES (5,'Sabine','12-SEP-81');
INSERT INTO person VALUES (6,'Masako','16-SEP-80');
INSERT INTO person VALUES (7,'Fanny','19-SEP-79');
INSERT INTO person VALUES (8,'Hyekyoung','11-SEP-80');
INSERT INTO person VALUES (9,'Elrid','27-SEP-72');
INSERT INTO person VALUES (10,'Cintia','31-DEC-79');
INSERT INTO person VALUES (11,'Aya','11-JUN-76');
INSERT INTO person VALUES (12,'Silvana','19-APR-79');
INSERT INTO person VALUES (13,'Elena','19-AUG-76');
INSERT INTO person VALUES (14,'Aurelie','23-SEP-76');

INSERT INTO ingredient VALUES (1,'Tequila',34);
INSERT INTO ingredient VALUES (2,'Curacao Triple Sec',36);
INSERT INTO ingredient VALUES (3,'Lime Juice',0);
INSERT INTO ingredient VALUES (4,'white Rum',52);
INSERT INTO ingredient VALUES (5,'brown Rum',67);
INSERT INTO ingredient VALUES (6,'Apricot Brandy',45);
INSERT INTO ingredient VALUES (7,'pineapple juice',0);
INSERT INTO ingredient VALUES (8,'lemon juice',0);
INSERT INTO ingredient VALUES (9,'brandy',45);
INSERT INTO ingredient VALUES (10,'Creme de Menthe',22);
INSERT INTO ingredient VALUES (11,'Cointreau',12);
INSERT INTO ingredient VALUES (12,'Canadian Whisky',45);
INSERT INTO ingredient VALUES (13,'Vermouth rosso',23);
INSERT INTO ingredient VALUES (14,'Campari',28);

INSERT INTO glass VALUES (1,'Flute');
INSERT INTO glass VALUES (2,'Brandy glass');
INSERT INTO glass VALUES (3,'Cup');
INSERT INTO glass VALUES (4,'Bowl');
INSERT INTO glass VALUES (5,'Beer boot');
INSERT INTO glass VALUES (6,'Wineglass');
INSERT INTO glass VALUES (7,'Champagne glass');
INSERT INTO glass VALUES (8,'Beer glass');
INSERT INTO glass VALUES (9,'Beer mug');
INSERT INTO glass VALUES (10,'Bottle');
INSERT INTO glass VALUES (11,'Cocktail glass');
INSERT INTO glass VALUES (12,'Tumbler');
INSERT INTO glass VALUES (13,'Highball glass');

INSERT INTO cocktail VALUES (1,'BlauerBaum','y',1);
INSERT INTO cocktail VALUES (2,'Russentod','y',5);
INSERT INTO cocktail VALUES (3,'Bond007','y',4);
INSERT INTO cocktail VALUES (4,'Donnergurgler','y',5);
INSERT INTO cocktail VALUES (5,'Knieweich','y',3);
INSERT INTO cocktail VALUES (6,'Cola_gruen','n',1);
INSERT INTO cocktail VALUES (7,'BlaueOma','y',4);
INSERT INTO cocktail VALUES (8,'GelbeHose','y',8);
INSERT INTO cocktail VALUES (9,'Pot','y',5);
INSERT INTO cocktail VALUES (10,'Down','y',2);
INSERT INTO cocktail VALUES (11,'Alexander','y',11);
INSERT INTO cocktail VALUES (12,'Americano','y',11);
INSERT INTO cocktail VALUES (13,'Bronx','y',11);
INSERT INTO cocktail VALUES (14,'Daiquiri','y',12);
INSERT INTO cocktail VALUES (15,'Manhattan','y',11);
INSERT INTO cocktail VALUES (16,'Stinger','y',11);
INSERT INTO cocktail VALUES (17,'Zombie','y',13);

INSERT INTO restaurant VALUES (1,'Klamauk', 39108, 'Magdeburg');
INSERT INTO restaurant VALUES (2,'bagel', 39108, 'Magdeburg');
INSERT INTO restaurant VALUES (3,'Alcatraz', 39104, 'Magdeburg');
INSERT INTO restaurant VALUES (4,'CyberSpaceCafe Orbit', 39104, 'Magdeburg');
INSERT INTO restaurant VALUES (5,'El Greco', 39104, 'Magdeburg');
INSERT INTO restaurant VALUES (6,'Exlibris', 39104, 'Magdeburg');
INSERT INTO restaurant VALUES (7,'Falstaff', 39104, 'Magdeburg');
INSERT INTO restaurant VALUES (8,'Klewitz', 39112, 'Magdeburg');
INSERT INTO restaurant VALUES (9,'Le Petit', 39114, 'Magdeburg');
INSERT INTO restaurant VALUES (10,'Rubens', 39106, 'Magdeburg');
INSERT INTO restaurant VALUES (11,'Durango Saloon', 39128,'Magdeburg');
INSERT INTO restaurant VALUES (12,'P 70', 39108, 'Magdeburg');
INSERT INTO restaurant VALUES (13,'Zum Alten Dessauer', 39104, 'Magdeburg');

INSERT INTO cocktail_person VALUES (12,2,4);
INSERT INTO cocktail_person VALUES (13,12,2);
INSERT INTO cocktail_person VALUES (14,1,4);
INSERT INTO cocktail_person VALUES (17,3,2);
INSERT INTO cocktail_person VALUES (17,2,8);
INSERT INTO cocktail_person VALUES (17,3,9);
INSERT INTO cocktail_person VALUES (17,1,5);
INSERT INTO cocktail_person VALUES (17,2,7);
INSERT INTO cocktail_person VALUES (17,13,4);
INSERT INTO cocktail_person VALUES (16,1,3);
INSERT INTO cocktail_person VALUES (16,1,6);
INSERT INTO cocktail_person VALUES (16,2,1);
INSERT INTO cocktail_person VALUES (16,2,8);
INSERT INTO cocktail_person VALUES (16,3,8);
INSERT INTO cocktail_person VALUES (16,11,12);
INSERT INTO cocktail_person VALUES (15,12,13);
INSERT INTO cocktail_person VALUES (15,12,3);
INSERT INTO cocktail_person VALUES (15,4,11);

select * from restaurant;

INSERT INTO ingredient_cocktail VALUES (9,5,50);
INSERT INTO ingredient_cocktail VALUES (14,5,50);
INSERT INTO ingredient_cocktail VALUES (7,5,50);
INSERT INTO ingredient_cocktail VALUES (7,8,50);
INSERT INTO ingredient_cocktail VALUES (9,8,150);
INSERT INTO ingredient_cocktail VALUES (9,9,34);
INSERT INTO ingredient_cocktail VALUES (9,7,45);
INSERT INTO ingredient_cocktail VALUES (1,9,60);
INSERT INTO ingredient_cocktail VALUES (11,9,67);
INSERT INTO ingredient_cocktail VALUES (8,3,56);
INSERT INTO ingredient_cocktail VALUES (14,15,23);
INSERT INTO ingredient_cocktail VALUES (9,15,34);
INSERT INTO ingredient_cocktail VALUES (11,15,23);
INSERT INTO ingredient_cocktail VALUES (12,15,12);
INSERT INTO ingredient_cocktail VALUES (6,15,23);

INSERT INTO cocktail_restaurant VALUES (17, 1);
INSERT INTO cocktail_restaurant VALUES (16, 2);
INSERT INTO cocktail_restaurant VALUES (15, 3);
INSERT INTO cocktail_restaurant VALUES (4, 4);
INSERT INTO cocktail_restaurant VALUES (4, 5);
INSERT INTO cocktail_restaurant VALUES (14, 6);
INSERT INTO cocktail_restaurant VALUES (8, 7);
INSERT INTO cocktail_restaurant VALUES (16, 8);
INSERT INTO cocktail_restaurant VALUES (8, 9);
INSERT INTO cocktail_restaurant VALUES (8, 10);
INSERT INTO cocktail_restaurant VALUES (5, 11);
INSERT INTO cocktail_restaurant VALUES (15, 12);
INSERT INTO cocktail_restaurant VALUES (15, 13);
INSERT INTO cocktail_restaurant VALUES (14, 1);
INSERT INTO cocktail_restaurant VALUES (5, 2);
INSERT INTO cocktail_restaurant VALUES (4, 3);
INSERT INTO cocktail_restaurant VALUES (5, 4);
INSERT INTO cocktail_restaurant VALUES (17, 5);
INSERT INTO cocktail_restaurant VALUES (5, 6);
INSERT INTO cocktail_restaurant VALUES (16, 7);
INSERT INTO cocktail_restaurant VALUES (5, 8);
INSERT INTO cocktail_restaurant VALUES (5, 9);
INSERT INTO cocktail_restaurant VALUES (13, 10);
INSERT INTO cocktail_restaurant VALUES (13, 11);
INSERT INTO cocktail_restaurant VALUES (17, 12);
INSERT INTO cocktail_restaurant VALUES (4, 13);