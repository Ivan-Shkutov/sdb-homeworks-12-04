SELECT MONTH(payment_date) AS Номер_месяца_в_году, COUNT(payment_id) As Информация_по_количеству_аренд_за_этот_месяц, SUM(amount) AS Наибольшая_сумма_платежей
FROM payment
GROUP BY MONTH(payment_date) 
ORDER BY COUNT(payment_id) DESC LIMIT 1
;