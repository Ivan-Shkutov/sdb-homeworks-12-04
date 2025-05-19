SELECT COUNT(f.film_id) AS Количество_фильмов_продолжительность_которых_больше_средней_продолжительности_всех_фильмов
FROM film f
WHERE f.length > (SELECT AVG(length) FROM film f)
;