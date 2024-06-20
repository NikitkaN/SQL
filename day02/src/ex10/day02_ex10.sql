SELECT p1.name as person_name1, 
	   p2.name as person_name2,
       p1.address as common_address
FROM person as p1
CROSS JOIN person as p2
WHERE p1.name != p2.name and p1.address = p2.address and p1.id > p2.id
ORDER BY 1, 2, 3
