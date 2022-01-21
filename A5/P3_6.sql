/*
Query 6: List the snapping information of the items and their current stock

This query is approriate for the demonstration because users might want to see the information of items that are currently
in auction/snapping period and to see the potential buyers already on said items as well as the time left to bid on said items.
*/

BEGIN TRANSACTION;

DROP TABLE IF EXISTS item_info;

CREATE TABLE item_info (
  name varchar(15) not NULL,
  stock integer not NULL,
  price integer not NULL,
  sid integer not NULL,
  bidders integer,
  timeleft integer
);

INSERT INTO item_info (name,stock,price,sid)
SELECT name,stock,price,sid FROM item_selling
WHERE sid in

(SELECT sid FROM snapping
WHERE
snap = 'TRUE');

UPDATE item_info
SET bidders =
(SELECT bidders FROM snapping_info
WHERE
snapid = (SELECT snapid FROM snapping WHERE sid = item_info.sid));

UPDATE item_info
SET timeleft =
(SELECT timeleft FROM snapping_info
WHERE
snapid = (SELECT snapid FROM snapping WHERE sid = item_info.sid));

SELECT name,stock,price,bidders,timeleft from item_info;

/*
Test Output:
name        stock  price  bidders  timeleft
----------  -----  -----  -------  --------
HOLY BOW    1      500    0        100
HOLY SWORD  1      500    5        65
DIAMOND     30     50     51       81
GLASSES     1      200    30       41
HOLY BOW    1      500    11       32
*/

DROP TABLE IF EXISTS item_info;

COMMIT;
