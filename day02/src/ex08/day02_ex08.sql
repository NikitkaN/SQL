SELECT person.name
FROM person_order
INNER JOIN person on person_order.person_id = person.id
INNER JOIN menu on person_order.menu_id = menu.id
WHERE person.gender = 'male' 
AND person.address in ('Moscow', 'Samara')
AND menu.pizza_name in ('pepperoni pizza', 'mushroom pizza')
ORDER BY name desc