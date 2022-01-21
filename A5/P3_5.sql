/*
Query 5: List the name of items that are currently in a snapping period

This query is approriate for the demonstration because users may want to find out what items are currently on auction as they may potentially be important
to obtain.
*/

SELECT name FROM item_selling
WHERE
sid in
(SELECT
sid
FROM
snapping
WHERE
snap = 'TRUE');

/*
Test output:
name
----------
HOLY BOW
HOLY SWORD
DIAMOND
GLASSES
HOLY BOW
*/
