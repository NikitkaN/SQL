WITH cte_ids as (
    SELECT * 
	FROM menu
    WHERE NOT EXISTS (SELECT menu_id
					  FROM person_order
					  WHERE menu_id = menu.id)
)
SELECT cte_ids.pizza_name, cte_ids.price,
       pizzeria.name as pizzeria_name
FROM cte_ids
INNER JOIN pizzeria on cte_ids.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;