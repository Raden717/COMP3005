/*
Problem 1.10 Produce a table that lists the name of all the service-subscribers that subscribe to at least all the same services as Jason Allison subscribes to but possibly others as well. Jason Allison rents the line with portID=2. (So this is the classic "subset" query.)
*/

DROP TABLE IF EXISTS finalNAME;

CREATE TABLE finalNAME (
name text,
portid integer
);

INSERT INTO finalNAME (name, portid)
SELECT name, portid FROM
(
SELECT subscribers.portid, subscribers.name, service
FROM subscribers
INNER JOIN service_subscribers ON subscribers.portID = service_subscribers.portID
WHERE service in 
(SELECT service
FROM service_subscribers
WHERE 
(portID = 2)
)
GROUP BY
subscribers.portid,
subscribers.name,
service
);

SELECT name FROM finalNAME
GROUP BY name
HAVING COUNT(name) > 1;

/*
Test output:
name
--------------
Homer Simpson
Jason Allison
Joe Carter
Matt Stajan
Michael Jordan
*/


