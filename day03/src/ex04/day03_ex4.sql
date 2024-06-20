(SELECT pizzeria.name as pizzeria_name
FROM menu
INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
INNER JOIN person_order on person_order.menu_id = menu.id
INNER JOIN person on person_order.person_id = person.id
WHERE person.gender = 'female'

EXCEPT

SELECT pizzeria.name as pizzeria_name
FROM menu
INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
INNER JOIN person_order on person_order.menu_id = menu.id
INNER JOIN person on person_order.person_id = person.id
WHERE person.gender = 'male'
)

UNION

(SELECT pizzeria.name as pizzeria_name
FROM menu
INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
INNER JOIN person_order on person_order.menu_id = menu.id
INNER JOIN person on person_order.person_id = person.id
WHERE person.gender = 'male'

EXCEPT

SELECT pizzeria.name as pizzeria_name
FROM menu
INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
INNER JOIN person_order on person_order.menu_id = menu.id
INNER JOIN person on person_order.person_id = person.id
WHERE person.gender = 'female'
)
ORDER BY pizzeria_name;