CREATE DATABASE IF NOT EXISTS `homework3`;
USE homework3;
DROP TABLE IF EXISTS staff; 
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT, -- PRIMARY KEY  = NOT NULL UNUQIE
    firstname VARCHAR(45),
	lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
	salary DECIMAL(8, 2), 
    age INT
);
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
	 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
SELECT *
FROM staff;

-- сортировка по полю заработная плата в порядке убывания
SELECT * 
FROM staff
ORDER BY salary DESC;

-- сортировка по полю заработная плата в порядке возрастания
SELECT * 
FROM staff
ORDER BY salary;

-- вывели 5 максимальных заработных плат
SELECT salary AS 'зарплата'
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- посчитали сумарную зарплату по каждой должности
SELECT post, SUM(salary) AS 'зарплата'
FROM staff
GROUP BY post;

-- вывели количество сотрудников со специальностью 'рабочий'
-- в возрасте от 24 до 49 лет включительно
SELECT post AS 'должность',
COUNT(*) 'количество сотрудников'
FROM staff
WHERE post = 'Рабочий' AND age > 23 AND age < 50 
GROUP BY post;

-- вывели количество должностей
SELECT COUNT(DISTINCT post) AS 'всего должностей'
FROM staff;
 
-- вывели специальности у которых средний возраст сотрудников меньше 30 лет включительно 
SELECT post AS 'должность', AVG(age) AS 'возраст'
FROM staff
GROUP BY post
HAVING AVG(age) < 31;

