CREATE INDEX idx_person_order_multi on person_order(person_id, menu_id, order_date);

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 and menu_id = 19;
