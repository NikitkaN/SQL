(SELECT order_date as action_date, person.name as person_name
FROM person
INNER JOIN person_order po on person.id = po.person_id)
INTERSECT
(SELECT visit_date, person.name 
FROM person
JOIN person_visits pv on person.id = pv.person_id)
ORDER BY action_date, person_name DESC