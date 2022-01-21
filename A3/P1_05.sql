/*
Problem 1.5 Find the names of all the subscribers who subscribe to at least three services.
*/
SELECT name FROM subscribers
WHERE portid in
(
SELECT 
portid
FROM service_subscribers
GROUP BY
portid
HAVING
COUNT(*) > 2);

/*
Test Output:
name
--------------
Michael Jordan
Joe Carter
Homer Simpson
Vince Carter
Chris Pronger
Frank Thomas
Steve Sampras
Matt Stajan
*/