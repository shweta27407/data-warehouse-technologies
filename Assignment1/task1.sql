/* 
Assignment 1.2: Database queries with SQL
Create SQL-statements for the following database queries considering the following
database schema:
Schema:
ingredient{iid, iname, alcohol concentration}
restaurant{rid,rname,zipcode,city}
glass{gid,gname}
cocktail{cid,cname,alcoholic,gid} //alcoholic={y,n}
person{pid, pname, birthdate}
ingredient cocktail{iid, cid, amount}
cocktail restaurant{cid, rid}
*/


-- 1. In a drinking game every participant should play against every other participant. Provide the list of matches (Name, Name).

SELECT 
    p1.pname AS Player1, 
    p2.pname AS Player2
FROM 
    person p1
JOIN 
    person p2
ON 
    p1.pid < p2.pid;
    
-- 2. Provide all names of glasses and all cocktails in a one-column table (list).
SELECT gname AS name
FROM glass
UNION
SELECT cname AS name
FROM cocktail;

select * from glass;
select * from cocktail;
select * from ingredient;
select * from ingredient_cocktail;
select * from cocktail;
select * from restaurant;
select * from cocktail_restaurant;

-- 3. Which cocktails do not have a recipe in the data base?
SELECT cname
FROM cocktail c
LEFT JOIN ingredient_cocktail ic ON c.cid = ic.cid
WHERE ic.cid IS NULL;


-- Full outer join for merging columns from two tables
/* SELECT *
FROM cocktail c
FULL OUTER JOIN ingredient_cocktail ic
ON c.cid = ic.cid; */
-------

-- 4. In which restaurants there is no cocktail ’Knieweich’ served?

SELECT r.rname FROM restaurant r WHERE r.rid NOT IN (
    SELECT cr.rid FROM cocktail_restaurant cr JOIN cocktail c ON cr.cid = c.cid
    WHERE c.cname = 'Knieweich'
);

-- 5. What ingredients and which amount of the ingredients contains each cocktail?
SELECT 
    c.cname AS Cocktail, 
    i.iname AS Ingredient, 
    ic.amount AS Amount
FROM cocktail c
JOIN 
    ingredient_cocktail ic ON c.cid = ic.cid
JOIN 
    ingredient i ON ic.iid = i.iid;

-- 6. What alcoholic ingredients and which amount of the alcoholic ingredients contains each cocktail?
SELECT 
    c.cname AS Cocktail, 
    i.iname AS Alcoholic_Ingredient, 
    ic.amount AS Amount
FROM 
    cocktail c
JOIN 
    ingredient_cocktail ic ON c.cid = ic.cid
JOIN 
    ingredient i ON ic.iid = i.iid
WHERE 
    i.alcohol_concentration > 0;
    
-- 7. Which are the cocktails that require more than two ingredients? Provide the count of ingredients per cocktail!
SELECT 
    c.cname AS Cocktail, 
    COUNT(ic.iid) AS Ingredient_Count
FROM 
    cocktail c
JOIN 
    ingredient_cocktail ic ON c.cid = ic.cid
GROUP BY 
    c.cname
HAVING 
    COUNT(ic.iid) > 2;

-- 8. The real alcoholic concentration of a cocktail is the sum of all (alcoholic concentration of an ingredient times the count of amount for this ingredient) divided
--by the sum of all ingredients. Perform appropriate renames

SELECT 
    c.cname AS Cocktail, 
    ROUND(SUM(i.alcohol_concentration * ic.amount) / SUM(ic.amount), 2) AS Real_Alcoholic_Concentration
FROM 
    cocktail c
JOIN 
    ingredient_cocktail ic ON c.cid = ic.cid
JOIN 
    ingredient i ON ic.iid = i.iid
GROUP BY 
    c.cname
HAVING 
    SUM(ic.amount) > 0; -- Ensures division by zero doesn't occur

-- 9. Which are the alcoholic and non-alcoholic cocktails which contain more than 4 ingredients?

SELECT 
    c.cname AS Cocktail, 
    c.alcoholic AS Is_Alcoholic, 
    COUNT(ic.iid) AS Ingredient_Count
FROM 
    cocktail c
JOIN 
    ingredient_cocktail ic ON c.cid = ic.cid
GROUP BY 
    c.cname, c.alcoholic
HAVING 
    COUNT(ic.iid) > 4;
    
-- 10. Create a view ”C A” with the attributes CID and alcoholic concentration.

CREATE VIEW "C_A" AS
SELECT 
    c.cid, 
    ROUND(SUM(i.alcohol_concentration * ic.amount) / SUM(ic.amount), 2) AS alcoholic_concentration
FROM 
    cocktail c
JOIN 
    ingredient_cocktail ic ON c.cid = ic.cid
JOIN 
    ingredient i ON ic.iid = i.iid
GROUP BY 
    c.cid;

-- 11. For every restaurant, what are the drinks with the maximum and minimum
-- alcoholic concentration? Use the created view.

WITH MaxMinAlcohol AS (
    SELECT 
        r.rname AS Restaurant, 
        c.cid AS Cocktail_ID, 
        c.cname AS Cocktail_Name, 
        ca.alcoholic_concentration AS Alcohol_Concentration,
        CASE 
            WHEN ca.alcoholic_concentration = MAX(ca.alcoholic_concentration) OVER (PARTITION BY r.rid) THEN 'Max'
            WHEN ca.alcoholic_concentration = MIN(ca.alcoholic_concentration) OVER (PARTITION BY r.rid) THEN 'Min'
        END AS Type
    FROM 
        restaurant r
    JOIN 
        cocktail_restaurant cr ON r.rid = cr.rid
    JOIN 
        "C_A" ca ON cr.cid = ca.cid
    JOIN 
        cocktail c ON ca.cid = c.cid
)
SELECT 
    Restaurant, 
    Type, 
    Cocktail_Name AS Drink, 
    Alcohol_Concentration
FROM 
    MaxMinAlcohol
WHERE 
    Type IS NOT NULL
ORDER BY 
    Restaurant, Type;
    
-- 12. Create a table ’Updatewatcher’ with the attributes (tname char(20), amount number). 
-- Insert the values (’cocktail’, 0) into that table!

-- Create the table 'Updatewatcher'
CREATE TABLE Updatewatcher (
    tname CHAR(20), 
    amount NUMBER
);

-- Insert the value ('cocktail', 0) into the table
INSERT INTO Updatewatcher (tname, amount) 
VALUES ('cocktail', 0);