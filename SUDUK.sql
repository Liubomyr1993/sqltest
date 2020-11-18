create database if not exists SUDUK charset 'utf8';

use SUDUK;

create table if not exists USERS (
	id int auto_increment primary key,
    login varchar(20),
    `password` varchar(20)
);

insert into USERS values
	(null, 'Big', '123qwerty'),
	(null, 'Litle', '1qwerty1'),
	(null, 'High', 'qwerty2'),
	(null, 'Veight', 'qwerty3'),
	(null, 'Small', 'qwerty4'),
	(null, 'Justdo', 'qwerty5'),
	(null, 'Hello', 'qwerty6'),
	(null, 'World', 'qwerty7'),
	(null, 'Gate', 'qwerty8'),
	(null, 'Jim', 'qwerty9'),
	(null, 'Russel', 'qwerty10'),
	(null, 'Tom', 'qwerty11'),
	(null, 'Jerry', 'qwerty12'),
	(null, 'Ohmy', 'qwerty13'),
	(null, 'Cant', 'qwerty14');
    
    select * from USERS;
    
    create table if not exists `PROFILES` (
	id int auto_increment primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email varchar(20) not null,
    age int not null
);

insert into `PROFILES` values
(null, 'Bob', 'Black', 'ukr@ukr.net', 30),
(null, 'Rachel', 'Troll', 'ukr@ukr.net', 25),
(null, 'Rick', 'Foryou', 'ukr@ukr.net', 50),
(null, 'Sten', 'Easy', 'ukr@ukr.net', 20),
(null, 'Bro', 'Back', 'ukr@ukr.net', 17),
(null, 'Jack', 'Right', 'ukr@ukr.net', 41),
(null, 'Jessica', 'Bike', 'ukr@ukr.net', 32),
(null, 'Merlin', 'Just', 'ukr@ukr.net', 19),
(null, 'Jeff', 'Malrous', 'ukr@ukr.net', 27),
(null, 'Tiger', 'Woods', 'ukr@ukr.net', 45);

select * from `PROFILES`;

create table if not exists GAMES (
	id int auto_increment primary key,
    first_player_id int,
    second_player_id int
);

insert into GAMES (second_player_id)
select id
from PROFILES
order by id desc;

Update GAMES as t1
join `PROFILES` as t2 on t1.id = t2.id
set t1.first_player_id = t2.id;

select * from GAMES;
    
alter table GAMES
add constraint FK_PROFILES_GAMES
foreign key (first_player_id)
references `PROFILES` (id);

alter table GAMES
add constraint FK_PROFILES_GAMES2
foreign key (second_player_id)
references `PROFiLES` (id);


create table if not exists GAME_RESULTS (
	id int auto_increment primary key,
    results varchar(15)
);

insert into GAME_RESULTS values
(null, 'WIN'),
(null, 'LOSE'),
(null, 'DRAW');

select * from GAME_RESULTS;

create table ACHIEVEMENTS (
	id int auto_increment primary key,
    achiev_name varchar (15)
);

insert into ACHIEVEMENTS values
(null, 'balbes'),
(null, 'newbie'),
(null, 'amateur'),
(null, 'pro'),
(null, 'master');

select * from ACHIEVEMENTS;

create table PLAYER_ACHIEVS (
	id int auto_increment primary key,
    player_id int not null,
    achiev_id int not null
);

insert into PLAYER_ACHIEVS values
	(null, 5, 3),
    (null, 5, 4),
    (null, 1, 2),
    (null, 10, 1),
    (null, 9, 3),
    (null, 10, 2),
    (null, 2, 3),
    (null, 4, 5),
    (null, 7, 4),
    (null, 3, 2),
    (null, 6, 3),
    (null, 8, 4),
    (null, 9, 5),
    (null, 2, 4),
    (null, 5, 5);
    
select * from PLAYER_ACHIEVS;


alter table PLAYER_ACHIEVS
add constraint FK_PROFILES_PLAYERACHIEVS
foreign key (player_id)
references `PROFILES` (id);   

alter table PLAYER_ACHIEVS
add constraint FK_PROFILES_ACHIEVEMENTS
foreign key (achiev_id)
references ACHIEVEMENTS (id);             

create table PLAYER_RESULTS (
	id int auto_increment primary key,
    player_id int not null,
    result_id int not null,
    game_id int not null
);

insert into PLAYER_RESULTS values
	(null, 1, 1, 4),
    (null, 1, 2, 5),
    (null, 1, 3, 3),
    (null, 2, 1, 1),
    (null, 2, 2, 2),
    (null, 2, 3, 6),
    (null, 3, 1, 10),
    (null, 3, 2, 9),
    (null, 3, 3, 8),
    (null, 4, 1, 1),
    (null, 4, 2, 2),
    (null, 4, 3, 3),
    (null, 5, 1, 4),
    (null, 5, 2, 5),
    (null, 5, 3, 6),
    (null, 6, 1, 7),
    (null, 6, 2, 8),
    (null, 6, 3, 9),
    (null, 7, 1, 8),
    (null, 7, 2, 7),
    (null, 7, 3, 6),
    (null, 8, 1, 5),
    (null, 8, 2, 4),
    (null, 8, 3, 3),
    (null, 9, 1, 2),
    (null, 9, 2, 1),
    (null, 9, 3, 10),
    (null, 10, 1, 5),
    (null, 10, 2, 7),
    (null, 10, 3, 3);
    
select * from PLAYER_RESULTS;
    
alter table PLAYER_RESULTS
add constraint FK_PROFILES_PLAYERIDRESULT
foreign key (player_id)
references `PROFILES` (id);    

alter table PLAYER_RESULTS
add constraint FK_PROFILES_RESULTID
foreign key (result_id)
references GAME_RESULTS (id); 

alter table PLAYER_RESULTS
add constraint FK_PROFILES_GAMEIDRESULT
foreign key (game_id)
references GAMES (id); 

delete 
	from USERS
    where id > 13;
    
update `PROFILES`
	set first_name = 'Bob'
    where id = 5;

alter table USERS
add column profiles_id int;

update USERS
	set profiles_id = case
					when id = 1 then 2
                    when id = 2 then 4
                    when id = 3 then 3
                    when id = 4 then 1
                    when id = 5 then 6
                    when id = 6 then 7
                    when id = 7 then 8
                    when id = 8 then 9
                    when id = 9 then 10
                    when id = 10 then 5
                    else profiles_id
				end;


alter table USERS
add constraint FK_USERS_PROFILES
foreign key(profiles_id)
references `PROFILES`(id);

alter table GAMES
add constraint FK_PROFILES_GAMES
foreign key (first_player_id)
references `PROFILES` (id);

alter table GAMES
add constraint FK_PROFILES_GAMES
foreign key (second_player_id)
references `PROFILES` (id);

alter table PLAYER_ACHIEVS
add constraint FK_PROFILES_PLAYERACHIEVS
foreign key (player_id)
references `PROFILES` (id); 

alter table PLAYER_ACHIEVS
add constraint FK_PROFILES_ACHIEVEMENTS
foreign key (achiev_id)
references ACHIEVEMENTS (id);    

alter table PLAYER_RESULTS
add constraint FK_PROFILES_PLAYERIDRESULT
foreign key (player_id)
references `PROFILES` (id);    

alter table PLAYER_RESULTS
add constraint FK_PROFILES_RESULTID
foreign key (result_id)
references GAME_RESULTS (id); 

alter table PLAYER_RESULTS
add constraint FK_PROFILES_GAMEIDRESULT
foreign key (game_id)
references GAMES (id); 

-- 1) Используя JOIN, сделать выборку логинов, имен и фамилий всех игроков из таблиц USERS и PROFILES.

select    USERS.login,
	     `PROFILES`.first_name,
         `PROFILES`.last_name
	from USERS
    join  `PROFILES` on USERS.profiles_id = `PROFILES`.id;
  
  -- 2) Используя JOIN, сделать выборку ачивок
  select `PROFILES`.id,
	     `PROFILES`.first_name,
         `PROFILES`.email,
         ACHIEVEMENTS.achiev_name
	 from PLAYER_ACHIEVS
     join `PROFILES` on PLAYER_ACHIEVS.player_id = `PROFILES`.id
     join ACHIEVEMENTS on PLAYER_ACHIEVS.achiev_id = ACHIEVEMENTS.id
     and `PROFILES`.id < 6;
 
 -- 3) Используя Внутреннее соединение
select   `PROFILES`.id,
	     `PROFILES`.first_name,
         `PROFILES`.last_name,
         `PROFILES`.email,
         `PROFILES`.age,
          GAME_RESULTS.results
	 from PLAYER_RESULTS
     join `PROFILES` on player_results.player_id = `PROFILES`.id
     join GAME_RESULTS on PLAYER_RESULTS.result_id = GAME_RESULTS.id
     and GAME_RESULTS.id = 1;

-- 4) Используя команды JOIN выбрать логины и пароли всех игроков     
select 	 USERS.login,
	     USERS.`password`,
         GAMES.id
	 from `PROFILES`
     join USERS  on `PROFILES`.id = USERS.profiles_id
     join GAMES  on `PROFILES`.id = GAMES.first_player_id
     join PLAYER_RESULTS on `PROFILES`.id = PLAYER_RESULTS.player_id 
	 and PLAYER_RESULTS.game_id = 1; 
     
--    5) Используя команды JOIN, GROUP BY, COUNT(), ORDER BY  
select `PROFILES`.first_name,
	count(second_player_id) as count_of_games
	from `PROFILES` 
    join GAMES on `PROFILES`.id = GAMES.first_player_id
	group by second_player_id
    order by count_of_games desc;
    
-- 6) Используя подзапрос выберите имена и email-ы всех first_player_id
select first_name,
		email
	from `PROFILES`
    where id in (select first_player_id
					from GAMES
                    where first_player_id = id);