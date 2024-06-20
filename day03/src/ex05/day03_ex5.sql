SELECT pizzeria.name as pizzeria_name
FROM person_visits
INNER JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
INNER JOIN person on person_visits.person_id = person.id
WHERE person.name = 'Andrey'
EXCEPT
SELECT pizzeria.name as pizzeria_name
FROM menu
INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
INNER JOIN person_order on person_order.menu_id = menu.id
INNER JOIN person on person_order.person_id = person.id
WHERE person.name = 'Andrey';