CREATE UNIQUE INDEX idx_person_discounts_unique
    on person_discounts(person_id, pizzeria_id);

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE

SELECT * 
FROM person_discounts
WHERE person_id = 4 and pizzeria_id = 6;