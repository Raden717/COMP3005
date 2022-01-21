/*
Problem 1.9 Do the same as question 1.7 but this time only include trunks that have at least one 'IDLE' channel. That is, write an SQL query that will produce in one table a list of all the acceptable trunks that can be used to route a call to the 416 area code, office code 334 have at least one idle channel. This query should list the trunks in the order of preference. (The answer should list trunks routes 416,334 then 416,000 then 000,000 for example)
*/
SELECT portid FROM channels
WHERE 
(portid in
(
SELECT portid FROM trunk_routes
WHERE
(trunk_routes.area = '416')
OR 
(trunk_routes.area = '416' AND trunk_routes.office = '334')
OR
(trunk_routes.area = '000' AND trunk_routes.office = '000')
GROUP BY
portid
ORDER BY COUNT(*) DESC)
)
AND
(channels.state = 'IDLE')
GROUP BY
portid;


/*
Test Output:
portid
------
102
106
107
*/


