--10.Вивести всі книги з кількістю сторінок від 300 до 400 і з ціною більше 20 і менше 30
SELECT * from book where (book_pages >= 300 and book_pages<=400) and (book_price>='$ 20.00' and book_price <='$30.00')
--11.Вивести всі книги видані взимку 2000 року
SELECT * from book where (book_date >= '12/01/2000' and book_date <= '12/31/2000') or (book_date >='1/01/2000'and book_date<='1/31/2000') or (book_date>='2/01/2000' and book_date<='2/29/2000')
--12.Вивести книги зі значеннями кодів 5110, 5141, 4985
SELECT * from book where book_id IN (5110,5141,4985)
