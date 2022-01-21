/*
Query 2: List the name of items that are being sold in atleast 2 markets

This query is approriate for the demonstration because users may want to look at items that exist in multiple markets to check whether or not some materials
are more common or uncommon.
*/

SELECT
name
FROM item_selling
GROUP BY
name
HAVING
COUNT(*) > 1;

/*
Test output:
name
-----------
GOLD
HOLY BOW
HOLY SHIELD
*/
