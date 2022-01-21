/*
List the names of all the subscribers who are originators of a call to someone who is also a subscriber on the same switch (i.e. a line to line call)
*/

SELECT name FROM subscribers JOIN
(SELECT orig, term
FROM calls
WHERE orig in (select portid from lines)
AND term in (select portid from lines)) on subscribers.portid = orig;

/*
Test Output:
name
--------------
Mats Sundin
Jason Allison
Homer Simpson
Michael Jordan
Ed Belfour
*/