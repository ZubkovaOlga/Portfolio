CREATE TABLE users (
  id serial not null,
   user_name varchar(50) not null,
  level_id INTEGER not null,
  skill INTEGER not null,
   PRIMARY KEY (id)
   );

INSERT INTO users (id, user_name, level_id, skill)  
VALUES (1, 'Anton', 1, 900000), (2, 'Denis', 3, 4000), (3, 'Petr', 2, 50000), (4, 'Andrey', 4, 20), (5, 'Olga', 1, 600000), (6, 'Anna', 1, 1600000)


CREATE TABLE levels (
   id serial not null,
  level_name varchar(50) not null,
   PRIMARY KEY (id)
   );

INSERT INTO levels (id, level_name)  
VALUES (1, 'admin'), (2, 'power_user'), (3, 'user'), (4, 'guest')

/*  Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а*/
SELECT * FROM users
where user_name like '%a%' AND skill > 799000 

/* Вывести все данные из таблицы user в порядке убывания по полю skill */
SELECT * FROM users
ORDER BY skill DESC


/* Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10 */
INSERT INTO users VALUES (7, 'Oleg', 4, 10)

/* Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000 */
UPDATE users
SET skill = 2000000 
WHERE level_id > 2 

/* Выбрать user_name всех пользователей уровня admin используя подзапрос*/
UPDATE users
SELECT user_name
FROM users 
WHERE level_id = (SELECT ID FROM levels WHERE level_name = 'admin')


/*Выбрать user_name всех пользователей уровня admin используя join */
UPDATE users
SELECT user_name
FROM users 
JOIN levels on level_id = levels.id
WHERE level_name = 'admin'

DROP TABLE userss


