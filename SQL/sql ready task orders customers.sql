CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CompanyName VARCHAR(50),
    Address VARCHAR(75),
    City VARCHAR(50),
    Country VARCHAR(50)
);
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Country) VALUES 
('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Germany'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'Mexico'),
('ANTON', 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', 'Mexico'),
('AROUT', 'Around the Horn', '120 Hanover Sq.', 'London', 'UK'),
('BERGS', 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', 'Sweden'),
('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 'MannheimCity', 'Germany'),
('BLONP', 'Blondesddsl père et fils', '24 place Kléber', 'StrasbourgCity', 'France'),
('BOLID', 'Bólido Comidas preparadas', 'C/ Araquil 67', 'MadridCity', 'Spain');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    OrderDate DATE,
    OrderSum INT
);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderSum) VALUES 
(10355, 'AROUT', '1996-11-15', 10000),
(10365, 'ANTON', '1996-11-27', 15000),
(10381, 'LILAS', '1996-12-12', 20000),
(10436, 'BLONP', '1997-02-05', 17500),
(10442, 'ERNSH', '1997-02-11', 20000),
(10449, 'BLONP', '1997-02-18', 10000),
(10453, 'AROUT', '1997-02-21', 15000);

/*1.Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997*/
SELECT companyname 
from customers
JOIN orders on orders.customerid = customers.customerid
where orderdate not BETWEEN '1996.11.15' AND '1997.02.18'


select companyname from customers
where customerid = (SELECT customerid from orders where orderdate not BETWEEN '1996.11.15' AND '1997.02.18');


/*Вывести названия компаний поставщиков, которые находятся в México D.F.*/
SELECT CompanyName from customers
where city = 'México D.F.'

/*Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997*/
SELECT orderid from orders
where orderdate BETWEEN '1996.12.12' and '1997.02.18.'

/*Вывести только тех заказчиков,  название компании которых начинаются с ‘An’*/
SELECT customerid from customers
where companyname LIKE 'An%'


/*Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.*/
SELECT customers.companyname, orders.orderid
FROM customers
JOIN orders ON Customers.customerid = Orders.customerid
WHERE ordersum > 17000

/*6.Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания*/
SELECT companyname, ordersum 
FROM customers
LEFT JOIN  orders on customers.customerid = orders.customerID
ORDER BY companyname DESC;

/*7Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов*/
SELECT companyname, orderdate
FROM customers
LEFT JOIN  orders on customers.customerid = orders.customerID



