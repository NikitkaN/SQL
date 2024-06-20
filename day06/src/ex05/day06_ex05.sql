COMMENT on TABLE person_discounts is 'Информация о персональных скидках в зависимости от количества заказов';
COMMENT on COLUMN person_discounts.id is 'Идентификатор записи в таблице';
COMMENT on COLUMN person_discounts.person_id is 'Идентификатор человека из списка заказов';
COMMENT on COLUMN person_discounts.pizzeria_id is 'Идентификатор пиццерии, в которой был сделан заказ';
COMMENT on COLUMN person_discounts.discount is 'Скидка, рассчитываемая в зависимости от количества заказов';