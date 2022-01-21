/*
Query 4: List all the equipments that currently exist within the market in the GLOBAL server

This query is approriate for the demonstration as users may want to only specifically look at a certain category of items that exist within a
specific server. This query can be applicable to any category aswell as any server.
*/

SELECT name,rarity FROM item
WHERE
mid = (
SELECT mid FROM market
WHERE
server = 'GLOBAL'
)
AND
catname = 'Equipment';

/*
Test Output:
name           rarity
-------------  ------
CROCE STAFF    RARE
WIZARD STAFF   RARE
HOLY SWORD     RARE
HOLY BOW       RARE
HOLY SHIELD    RARE
WOODEN SWORD   COMMON
WOODEN SHIELD  COMMON
*/
