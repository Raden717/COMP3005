/*
Problem 1.7 Write an SQL query that will produce in one table a list of all the acceptable trunks that can be used to route a call to the 416 area code, office code 334. This query should list the trunks in the order of preference. (The answer should list trunks with routes 416,334 then those with 416,000 and then those with 000,000 for example)
*/

SELECT portid FROM trunk_routes
WHERE
(trunk_routes.area = '416')
OR 
(trunk_routes.area = '416' AND trunk_routes.office = '334')
OR
(trunk_routes.area = '000' AND trunk_routes.office = '000')
GROUP BY
portid
ORDER BY COUNT(*) DESC;


/*
Test Output:
portid
------
102
106
107
*/