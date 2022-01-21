/*
Query 1: List the name of items that are being sold specifically in the SEA market

This query is approriate for the demonstration for the use of the database as a user might only want to obtain
the market information from a specified server instead of looking at every server.
*/


SELECT name FROM item
WHERE
mid = (
SELECT mid FROM market
WHERE
server = 'SEA'
);

/*
Test output:
name
-----------------
IRON
DIAMOND
CROCE STAFF
IRON SWORD
HOLY BOW
GOLD DUST
HOLY SHIELD
GOLDEN HELMET
MONOCLE
MONOCLE BLUEPRINT
*/
