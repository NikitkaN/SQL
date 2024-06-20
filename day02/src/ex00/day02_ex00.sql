SELECT pizza.name, rating
FROM
    (SELECT pizzeria.name, person_visits.person_id, pizzeria.rating
     FROM pizzeria
     LEFT JOIN person_visits on person_visits.pizzeria_id = pizzeria.id) as pizza 
WHERE (person_id is NULL);