WITH cte_pizzeria_id as (
	SELECT menu.id as menu_id, pizzeria_id
	FROM menu
    INNER JOIN pizzeria on menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria_id, menu_id
)

INSERT INTO person_discounts(id, person_id, pizzeria_id, discount) (
	SELECT ROW_NUMBER() OVER() as id, person_id, pizzeria_id,
    (CASE
        WHEN
            COUNT(person_order.person_id) = 1 then 10.5
        WHEN
            COUNT(person_order.person_id) = 2 then 22
        ELSE
           30
        END)
    FROM person_order
    INNER JOIN cte_pizzeria_id on cte_pizzeria_id.menu_id = person_order.menu_id
    GROUP BY person_order.person_id, cte_pizzeria_id.pizzeria_id
    ORDER BY person_id
);