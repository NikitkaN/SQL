SELECT menu.pizza_name, pizzeria.name as pizzeria_name
FROM person_order
INNER JOIN menu on person_order.menu_id = menu.id
INNER JOIN pizzeria on menu.pizzeria_id= pizzeria.id
INNER JOIN person on person_order.person_id = person.id WHERE person.name = 'Denis'
or person.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;