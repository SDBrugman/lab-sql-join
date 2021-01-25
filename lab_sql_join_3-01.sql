USE sakila;

-- 1 --
SELECT *
FROM film_category;

SELECT c.name, count(f.film_id) AS nr_of_films
FROM film_category as f
	join category as c
		on f.category_id = c.category_id
group by c.name
order by nr_of_films DESC;

-- 2 --
SELECT *
FROM staff;

SELECT s.first_name, s.last_name, a.address, c.city, a.postal_code
FROM staff as s
	join address as a
		on s.address_id = a.address_id
	join city as c
		on a.city_id = c.city_id
group by s.last_name
order by s.last_name;

-- 3 --
SELECT s.first_name, s.last_name, sum(p.amount) AS total_amount
from staff s
	left join payment as p
		on s.staff_id = p.staff_id
WHERE month(p.payment_date) = 8 and year(p.payment_date)  = 2005
group by s.first_name, s.last_name;

-- 4 --
SELECT f.title, count(a.actor_id) AS nr_of_actors
FROM film as f
	join film_actor as a
		on f.film_id = a.film_id
group by f.title
order by nr_of_actors DESC;

-- 5 --
SELECT *
FROM payment;

SELECT *
FROM customer;

SELECT p.customer_id, c.first_name, c.last_name, sum(p.amount) AS total_payment
FROM customer as c
	join payment as p
		on c.customer_id = p.customer_id
group by p.customer_id
order by c.last_name ASC;




