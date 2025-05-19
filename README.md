## Домашнее задание к занятию «SQL. Часть 2».

## Шкутов Иван Владимирович.

---

### Задание 1

Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

1. фамилия и имя сотрудника из этого магазина;

2. город нахождения магазина;

3. количество пользователей, закреплённых в этом магазине.

---

![1.1](https://github.com/Ivan-Shkutov/sdb-homeworks-12-04/blob/main/jpg/1.1.jpg)

![1.2](https://github.com/Ivan-Shkutov/sdb-homeworks-12-04/blob/main/jpg/1.2.jpg)


SELECT c.store_id AS Магазин , CONCAT(s.last_name, ' ', s.first_name) AS Фамилия_и_имя_сотрудника, c2.city AS Город,  a.address AS Адрес, COUNT(c.store_id) AS Количество_пользователей_в_этом_магазине

FROM customer c

JOIN staff s ON c.store_id = s.store_id

JOIN store s2 ON s.store_id = s2.store_id

JOIN address a ON s2.address_id = a.address_id 

JOIN city c2 ON a.city_id = c2.city_id 

GROUP BY c.store_id, Фамилия_и_имя_сотрудника, c2.city

HAVING COUNT(c.store_id) > 300

;


---

### Задание 2

Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

---

![2.1](https://github.com/Ivan-Shkutov/sdb-homeworks-12-04/blob/main/jpg/2.1.jpg)

![2.2](https://github.com/Ivan-Shkutov/sdb-homeworks-12-04/blob/main/jpg/2.2.jpg)


SELECT COUNT(f.film_id) AS Количество_фильмов_продолжительность_которых_больше_средней_продолжительности_всех_фильмов

FROM film f

WHERE f.length > (SELECT AVG(length) FROM film f)

;

---

### Задание 3

Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.

---

![3.1](https://github.com/Ivan-Shkutov/sdb-homeworks-12-04/blob/main/jpg/3.1.jpg)

![3.2](https://github.com/Ivan-Shkutov/sdb-homeworks-12-04/blob/main/jpg/3.2.jpg)


SELECT MONTH(payment_date) AS Номер_месяца_в_году, COUNT(payment_id) As Информация_по_количеству_аренд_за_этот_месяц, SUM(amount) AS Наибольшая_сумма_платежей

FROM payment

GROUP BY MONTH(payment_date) 

ORDER BY COUNT(payment_id) DESC LIMIT 1

;


---
