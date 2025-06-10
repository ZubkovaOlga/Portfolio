CREATE TABLE FIO_person (
  id INTEGER not null,
  FIO varchar(100) not null,
   PRIMARY KEY (id)
   );

INSERT INTO FIO_person (id, FIO)  
VALUES (1, 'Петров Максим Егорович'), (2, 'Иванов Андрей Егорович'), (3, 'Петров Максим Егорович'), (4, 'Иванов Максим Егорович'), (5, 'Иванов Иван Егорович'), (6, 'Петров Иван Егорович')


CREATE TABLE Salary (
   Salary_ID INTEGER not null,
  Person_ID INT,
  Value INT,
   PRIMARY KEY (Salary_id),
  FOREIGN KEY (Person_ID) REFERENCES FIO_person(ID)
   );

INSERT INTO Salary (Salary_ID, Person_ID, Value)  
VALUES (1, 1, 5000), (2, 2, 110000), (3, 3, 15000), (4, 4, 9000)

create table JobPosition(
    Position_ID INT PRIMARY KEY, 
    Person_ID INT,
    NamePosition varchar(100),
    Duration INT,
    FOREIGN KEY (Person_ID) REFERENCES FIO_person (ID)
);

INSERT INTO JobPosition(Position_ID, Person_ID, NamePosition, Duration)
VALUES (1, 1, 'Разработчик', 1), (2, 2, 'Разработчик', 5), (3, 3, 'Тестировщик', 1), (4, 4,'Аналитик', 2)

/*1. Получить список всех сотрудников с ФИО Петров Максим Егорович*/
SELECT FIO
From FIO_person
WHERE FIO = 'Петров Максим Егорович'


/*2. Получить список всех сотрудников по имени Иван*/
SELECT FIO
From FIO_person
WHERE FIO LIKE '% Иван %'

/*3. Получить список всех ФИО сотрудников в должности «Разработчик» и зарплатой, большей 10 000 рублей*/
select FIO from FIO_person
inner join JobPosition 
    on FIO_person.id = JobPosition.Person_ID
inner join Salary
    on FIO_person.id = Salary.Person_ID
where JobPosition.NamePosition = 'Разработчик' AND Salary.Value > 10000


/*4. Получить отсортированный в алфавитном порядке список всех существующих должностей (без повторов) в компании*/
select distinct NamePosition 
from JobPosition order by NamePosition asc

/*5 Вывести список, содержащий ФИО, ЗП, должность и количество лет в должности для сотрудников, которые проработали от 1 до 10 лет включительно*/

select FIO, Value, NamePosition, Duration from FIO_person
inner join JobPosition 
    on FIO_person.id = JobPosition.Person_ID
inner join Salary
    on FIO_person.id = Salary.Person_ID
where JobPosition.Duration between 1 and 10

