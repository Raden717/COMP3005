/*
Problem 1.6 Produce a table that lists the most popular service (or services). That is, give the name of the service that has the most subscribers.
*/
SELECT service FROM services
WHERE scode in
(
SELECT service FROM service_subscribers
GROUP BY
service
ORDER BY COUNT(*) DESC
LIMIT 1);

/*
Test Output:
service
--------------
Message Answer
*/