SELECT order_date, CONCAT(person.name, ' (age:', person.age, ')') as person_information 
FROM person
INNER JOIN person_order po on person.id = po.person_id 
ORDER BY order_date, person_information