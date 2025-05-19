SELECT c.store_id AS Магазин , CONCAT(s.last_name, ' ', s.first_name) AS Фамилия_и_имя_сотрудника, c2.city AS Город,  a.address AS Адрес, COUNT(c.store_id) AS Количество_пользователей_в_этом_магазине
FROM customer c
JOIN staff s ON c.store_id = s.store_id
JOIN store s2 ON s.store_id = s2.store_id
JOIN address a ON s2.address_id = a.address_id 
JOIN city c2 ON a.city_id = c2.city_id 
GROUP BY c.store_id, Фамилия_и_имя_сотрудника, c2.city
HAVING COUNT(c.store_id) > 300
;