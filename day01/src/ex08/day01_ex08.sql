SELECT order_date, CONCAT(person.name, ' (age:', person.age, ')') as person_information
FROM person
NATURAL JOIN (SELECT id as order_id, order_date, person_id as id
FROM person_order) as po
ORDER BY order_date, person_information