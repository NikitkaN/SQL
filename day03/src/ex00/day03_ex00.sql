SELECT menu.pizza_name as pizza_name, menu.price,
	   pizzeria.name as pizzeria_name,
       person_visits.visit_date
FROM person_visits
INNER JOIN menu on person_visits.pizzeria_id = menu.pizzeria_id
INNER JOIN person on person_visits.person_id = person.id
INNER JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
WHERE person.name = 'Kate' and price between 800 and 1000
ORDER BY pizza_name, price, pizzeria_name;