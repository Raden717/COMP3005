/*
Problem 1.4 Find the names and address of all subscribers who subscribe to all of the available services. (Note the result for the current data might be empty but your query should work if the TA's add more data to the databse.)
*/

SELECT name, address
FROM subscribers
WHERE portid in
(
SELECT portid FROM service_subscribers
GROUP BY
portid
HAVING
COUNT(*) =
(SELECT COUNT(1) FROM services)
);

/*
Test Output:
In this database, it printed out an empty table
*/
