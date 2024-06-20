SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT menu.pizza_name, pizzeria.name as pizzeria_name
FROM menu
INNER JOIN pizzeria on menu.pizzeria_id = pizzeria.id;