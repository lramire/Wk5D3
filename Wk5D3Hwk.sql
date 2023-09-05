--1
SELECT customer_id, first_name, last_name, address, city, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE 

--2
SELECT first_name, last_name, amount
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

--3
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount)
);

--4
SELECT city_id, city.country_id
FROM city
INNER JOIN country
ON country.country_id = city.country_id
WHERE country.country = 'Nepal';

--5
SELECT staff.staff_id, first_name, last_name, COUNT(staff.staff_id)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY count;
-- LIMIT 1;

--6
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY count;

--7
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(customer_id) = 1
);

--8
SELECT amount
FROM payment
WHERE amount = 0.00;


