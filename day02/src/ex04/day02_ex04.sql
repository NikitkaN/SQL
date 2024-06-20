SELECT pizzas.pizza_name, pizzeria.name as pizzeria_name, pizzas.price
FROM
    (SELECT * 
	 FROM menu WHERE pizza_name='mushroom pizza' or
	 pizza_name='pepperoni pizza') as pizzas
FULL JOIN pizzeria on pizzas.pizzeria_id = pizzeria.id WHERE pizzas.pizza_name IS NOT NULL
ORDER BY pizza_name, pizzeria_name