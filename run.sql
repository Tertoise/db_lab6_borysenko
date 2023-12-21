-- Вибираємо всі карти Таргону за допомогою ФУНКЦІЇ get_cards_in_region
select * from get_cards_in_region ('Targon');

-- Використовуємо ПРОЦЕДУРУ add_region щоб вставити новий регіон
call add_region('void', 'Only horrible creatures live here');

-- Перевіряємо, що спрацював ТРІГЕР і буква в регіоні 'void' змінилася на велику
select * from region