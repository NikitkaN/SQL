WITH cte_p_pizza(pepperoni) as (
    (SELECT person.name as pepperoni
    FROM person_order
    INNER JOIN person on person_order.person_id = person.id
    INNER JOIN menu on menu.id = person_order.menu_id
    WHERE person.gender = 'female' and pizza_name = 'pepperoni pizza')
),
    cte_ch_pizza(cheese) as (
    (SELECT person.name as cheese
    FROM person_order
    INNER JOIN person on person_order.person_id = person.id
    INNER JOIN menu on menu.id = person_order.menu_id
    WHERE person.gender = 'female' and pizza_name = 'cheese pizza')
)
SELECT person.name FROM person
   INNER JOIN cte_p_pizza on cte_p_pizza.pepperoni = person.name
   INNER JOIN cte_ch_pizza on cte_ch_pizza.cheese = person.name