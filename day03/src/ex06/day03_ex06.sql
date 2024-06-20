SELECT menu1.pizza_name, pizzeria1.name as pizzeria_name1,
       pizzeria2.name as pizzeria_name2, menu1.price
FROM menu as menu1
INNER JOIN menu as menu2 on menu1.price = menu2.price
INNER JOIN pizzeria as pizzeria1 on menu1.pizzeria_id = pizzeria1.id
INNER JOIN pizzeria as pizzeria2 on menu2.pizzeria_id = pizzeria2.id
WHERE menu1.id > menu2.id and menu1.pizza_name = menu2.pizza_name
ORDER BY pizza_name;