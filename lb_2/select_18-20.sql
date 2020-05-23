--17.Вивести книги, в назвах яких є слово Microsoft, але немає слова Windows
SELECT * from book where book_name like '%Microsoft%' and book_name not like '%Windows%'
--18.Вивести книги, в назвах яких присутній як мінімум одна цифра.
SELECT * from book where book_name SIMILAR TO '%[0-9]%'
--19.Вивести книги, в назвах яких присутні не менше трьох цифр.
SELECT * from book where book_name SIMILAR TO '%[0-9]{3,}%'
--20.Вивести книги, в назвах яких присутній рівно п'ять цифр.
SELECT * from book where book_name SIMILAR TO '%[0-9]{5}%' --!


