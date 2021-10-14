-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The
-- countrycode is 'USA', and population of 45001.

INSERT INTO city (name, countrycode, district, population)
VALUES ('Smallville','USA','Kansas',45001)

SELECT *
FROM city
WHERE district='Kansas'

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.

INSERT INTO countrylanguage (countrycode,language,isofficial,percentage)
VALUES ('USA','Kryptonese',0,0.0001)

SELECT *
FROM countrylanguage
WHERE language='Kryptonese'

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble." Change
-- the appropriate record accordingly.

UPDATE countrylanguage
SET language = 'Krypto-babble'
WHERE language='Kryptonese'

SELECT *
FROM countrylanguage
WHERE language='Krypto-babble'


-- 4. Set the US capital to Smallville, Kansas in the country table. 4080

UPDATE country
SET capital = 4080
WHERE code = 'USA'

SELECT *
FROM country
WHERE code = 'USA'

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

BEGIN TRANSACTION

DELETE FROM city
WHERE name = 'Smallville'

ROLLBACK TRANSACTION

-- This does not work due to Smallville being the capital of USA. With the Country sheet having a FK of capital, Smallville would have to not be the capital
-- The conflict occurred in database "World", table "dbo.country", column 'capital'.

-- 6. Return the US capital to Washington.

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972
-- (exclusive).
-- (590 rows affected)

-- 9. Convert population so it is expressed in 1,000s for all cities. (Round up to
-- the nearest integer value.)
-- (4079 rows affected)

-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to
-- square meters for all countries where French is spoken by more than 20% of the
-- population.
-- (7 rows affected)
