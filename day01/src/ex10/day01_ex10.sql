SELECT name as persone_name, pizza_name, pizzeria_name
FROM (SELECT name, menu_id 
	  FROM person_order 
	  INNER JOIN person on person_order.person_id = person.id) as vg
JOIN (SELECT menu.id as id, pizza_name, pizzeria.name as pizzeria_name 
	  FROM pizzeria
      INNER JOIN menu ON pizzeria.id = menu.pizzeria_id) as ag on vg.menu_id = ag.id
ORDER BY persone_name, pizza_name, pizzeria_name