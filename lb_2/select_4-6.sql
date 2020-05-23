--4.Вивести значення всіх колонок 10 перших рядків
SELECT * from book limit 4
--5. Вивести значення всіх колонок 10% перших рядків
SELECT * from book Limit  ceil((Select count(*) from book)/10.0)
--6. Вивести значення колонки код без повторення однакових кодів    
SELECT distinct book_id from book
