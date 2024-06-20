WITH cte_pizza_order as (
    SELECT
        person_id,
        person.name,
        menu.pizza_name,
        price,
        pizzeria_id,
        pizzeria.name as pizzeria_name
    FROM person_order
    INNER JOIN menu on menu.id = person_order.menu_id
    INNER JOIN person on person.id = person_order.person_id
    INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
)    

SELECT cte_pizza_order.name,
       cte_pizza_order.pizza_name,
       cte_pizza_order.price,
       (price - price * (person_discounts.discount / 100)) as discount_price,
       cte_pizza_order.pizzeria_name
       FROM person_discounts
       INNER JOIN cte_pizza_order on person_discounts.person_id = cte_pizza_order.person_id
            and person_discounts.pizzeria_id = cte_pizza_order.pizzeria_id
       ORDER BY name, pizza_name;