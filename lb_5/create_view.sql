-- 4.Створити і перевірити уявлення для отримання універсального відносини з набору нормалізованих таблиць бази даних
create view book_view as select b.book_id, b.book_number,b.book_new,b.book_name,b.book_price,p.publishing,b.book_pages,b.book_format,b.book_date,b.book_circulation,t.topic,c.category
	from book b, publishing p, category c, topic t where b.book_publishing_id = p.id_publishing and b.book_category_id=c.id_category and b.book_topic_id=t.id_topic

select * from book_view