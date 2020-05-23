--7.Вивести всі книги новинки
SELECT * from book WHERE book_new = 'Yes'
--8.Вивести всі книги новинки з ціною від 20 до 30
SELECT * from book WHERE book_new = 'Yes'and book_price >= '$ 20.00 ' and book_price <= '$ 30.00'
--9.Вивести всі книги новинки з ціною менше 20 і більше 30
SELECT * from book where book_new = 'Yes'and (book_price <= '$ 20.00 ' or book_price >= '$ 30.00')