SELECT (
    SELECT name 
    FROM person 
    WHERE id = person_order.person_id
    ) as name,
    
    (
    SELECT name = 'Denis' 
    FROM person 
    WHERE id = person_order.person_id
    ) as check_name
FROM person_order
WHERE order_date = '2022-01-07' and (menu_id = 13 or menu_id = 14 or menu_id = 18);