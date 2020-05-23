--1.Вивести значення наступних колонок: номер, код, новинка, назва, ціна, сторінки
SELECT book_num,book_id,book_new,book_name,book_price,book_pages from book;
--2.Вивести значення всіх колонок
SELECT * from book;
--3.Вивести значення колонок в наступному порядку: код, назва, новинка, сторінки, ціна, номер
SELECT book_id,book_name,book_new,book_pages,book_price,book_num from book
