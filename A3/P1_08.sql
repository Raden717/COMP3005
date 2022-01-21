/*
Problem 1.8 Write an SQL query that would find if the line with phone number (613) 712-0024 is currently available to take a call because its channel is IDLE. Rev 1: That is, select the portid, directory number, and channel state of line (613) 712-0024.
*/

SELECT channels.portid, areacode, officecode, stationcode, state
FROM channels
INNER JOIN lines ON channels.portid=lines.portid
WHERE areacode = '613' AND officecode = '712' AND stationcode = '0024';

/*
Test Output:
portid  areacode  officecode  stationcode  state
------  --------  ----------  -----------  -----
24      613       712         0024         BUSY
*/