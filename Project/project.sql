--3.	БД планирования рабочего дня (список пользователей – планировщик - мероприятия). 

-- Таблица списка пользователей
create table Users_list(
	id serial NOT NULL,
	user_name varchar NOT NULL);
	
ALTER TABLE Users_list ADD PRIMARY KEY (id);

insert into Users_list (user_name) values ('Brown M.'), ('Dale J.'), ('Petrenko M.');


--Таблица списка мероприятий
CREATE TABLE Event_list (
	id serial PRIMARY KEY,
	event_name varchar NOT NULL,
	event_date DATE NOT NULL,
	amount_people int NOT NULL)
	
insert into Event_list (event_name, event_date, amount_people) values ('IT Conference', '2020-02-18', 15), 
								      ('Software Testing MeetUp', '2020-05-26',20),
								      ('Mobile MeetUp', '2020-05-27',2);


--Таблица планировщика
CREATE TABLE Scheduler (
	id serial PRIMARY KEY,
	id_user int NOT NULL,
	id_event int NOT NULL);
	

alter table Scheduler add foreign key(id_user) references Users_list (id);
alter table Scheduler add foreign key(id_event) references Event_list (id);

insert into Scheduler (id_user, id_event) values (1,1);
insert into Scheduler (id_user, id_event) values (1,2),(2,3),(3,2);

--Поиск мероприятия по названию
CREATE FUNCTION find_event_by_name ( e_name char)
returns table (event_name char, event_date DATE, amount_people int)
as $$
	select event_name, event_date, amount_people from Event_list where event_name LIKE e_name;
$$
language sql;

select * from find_event_by_name('IT Conference');


--Выводит список людей по названию мероприятия 
DROP FUNCTION list_people_by_event_name(character);

CREATE OR REPLACE FUNCTION list_people_by_event_name( ev_name char)
returns table (user_name char)
as $$
	select l.user_name from Scheduler s inner join Users_list l  on l.id=s.id_user
					    inner join Event_list e on e.id=s.id_event
								where e.event_name LIKE list_people_by_event_name.ev_name;
$$
language sql;

select * from list_people_by_event_name ('Software Testing MeetUp');

--Выводит количество людей, зарегистрировавшихся на мероприятие 										
CREATE OR REPLACE FUNCTION amout_people_by_event( ent_name char )	
returns table (amout_registered_people bigint)
as $$
	select count(l.user_name) from Scheduler s inner join Users_list l  on l.id=s.id_user
						   inner join Event_list e on e.id=s.id_event
								where e.event_name LIKE amout_people_by_event.ent_name;
$$
language sql;

select * from amout_people_by_event ('IT Conference');

--Триггер на ограниченное количество людей, зарегистрировавшихся на мероприятие 
CREATE OR REPLACE FUNCTION limit_amout_registered_people() RETURNS trigger AS $amout_registered_people$
	BEGIN
		IF((select count(*) from Scheduler 
			where id_event = New.id_event) = (select distinct(amount_people) from Event_list inner join Scheduler on Event_list.id=Scheduler.id_event 
											  where Event_list.id=New.id_event)) THEN 
							RAISE EXCEPTION 'Количество людей ограничено';
							END IF;
							RETURN NEW;
	END;
$amout_registered_people$
language plpgsql;

drop trigger amout_registered_people_trig on Scheduler;

CREATE TRIGGER amout_registered_people_trig
	BEFORE INSERT OR UPDATE
	ON Scheduler
	FOR EACH ROW
	EXECUTE PROCEDURE limit_amout_registered_people();
	
insert into Scheduler(id_user,id_event) values (2,3);




					  
