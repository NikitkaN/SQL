CREATE INDEX idx_person_name on person(UPPER(name));

SET enable_seqscan TO OFF;

EXPLAIN ANALYSE
SELECT name
FROM person WHERE UPPER(name) = 'Denis';