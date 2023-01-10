-- 1. How many actors are there with the last name ‘Wahlberg’?
-- 2 Actors with the last name 'Wahlberg'
SELECT * 
FROM actor 
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
-- 4802 payments
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99; 

-- 3. What film does the store have the most of? (search in inventory)
-- Depends on which store I guess? Each store has 4 copies of multiple films according to my search below?
SELECT COUNT(film_id) AS film_count, film_id, store_id
FROM inventory
GROUP BY film_id, store_id
ORDER BY COUNT(film_id) DESC;

-- 4. How many customers have the last name ‘William’?
-- 0 customers with the last name of 'William'
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
-- Staff ID 2 with 7304 total rentals
SELECT COUNT(staff_id), staff_id
FROM payment
GROUP BY staff_id
ORDER BY count(staff_id) DESC;

-- 6. How many different district names are there?
-- I kinda cheated for this one, the total results number is shown at the bottom of this search, totaling to 378 districts
SELECT COUNT(DISTINCT district), district, SUM(COUNT(DISTINCT district))
FROM address
GROUP BY district;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- The film with film_id 508 has 15 total actors
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 13 customers
SELECT COUNT(last_name), store_id
FROM customer
WHERE last_name LIKE '%es' AND store_id = '1'
GROUP BY store_id;

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- 4.99, 6.99, 2.99
SELECT amount, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250
ORDER BY COUNT(rental_id) DESC;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
- 5 ratings total, PG-13 has the most
SELECT COUNT(rating), rating
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;