CREATE UNIQUE INDEX idx_menu_unique on menu(pizzeria_id, pizza_name);

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizza_name = 'pepperoni pizza' and pizzeria_id = 6;