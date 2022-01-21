/*
Query 3: List the name of all unique things being sold on the market in the CN server

This query is approriate for the demonstration because users may want to find out what items are unique and special within a certain server
and can decide whether or not to buy the items.
*/

SELECT name FROM item
WHERE
mid = (
SELECT mid FROM market
WHERE
server = 'CN'
)
AND name in
(SELECT name FROM item_selling
WHERE
id in
(SELECT
id
FROM
item_specialties
WHERE
specialty = 'TRUE'));

/*
Test Output:
name
--------
GLASSES
HOLY BOW
*/
