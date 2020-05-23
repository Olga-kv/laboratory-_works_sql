--13.Вивести книги видані в 1999, 2001, 2003, 2005 р
SELECT * from book where  (select EXTRACT (YEAR from book_date) in (1999,2001,2003))
--14.Вивести книги назви яких починаються на літери А-К
SELECT * from book where book_name between 'А' and 'К'
--15.Вивести книги назви яких починаються на літери 'Апп', видані в 2000 році з ціною до 20
SELECT * from book  where book_name like 'Ап%' and (select EXTRACT (YEAR from book_date) in (2000) ) and book_price < '$20.00'
--16.Вивести книги назви яких починаються на літери 'Ап', закінчуються на 'е', видані в першій половині 2000 року
SELECT * from book  where book_name like 'Ап%і%' and book_date between '2000-01-01' and '2000-07-31'
