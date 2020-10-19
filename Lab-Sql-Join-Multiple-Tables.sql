USE sakila;
-- 1) Write a query to display for each store its store ID, city, and country.
SELECT s.store_id, c.city, co.country FROM sakila.store s
JOIN address a ON a.address_id = s.address_id
JOIN city c ON c.city_id = a.city_id
JOIN country co ON co.country_id = c.country_id
GROUP BY s.store_id;


-- 2) Write a query to display how much business, in dollars, each store brought in.
SELECT s.store_id, format(SUM(p.amount),'C','us-US') AS ttl_amount FROM payment p
JOIN store s ON s.manager_staff_id = p.staff_id
GROUP BY s.store_id
ORDER BY ttl_amount;

-- 3) What is the average running time of films by category?
SELECT c.name, round(avg(f.length),2) AS avg_length FROM film f
JOIN film_category fa ON fa.film_id = f.film_id
JOIN category c ON c.category_id = fa.category_id
GROUP BY c.name
ORDER BY avg_length desc;

-- 4) Which film categories are longest?
SELECT c.name, round(avg(f.length),2) AS avg_length FROM film f
JOIN film_category fa ON fa.film_id = f.film_id
JOIN category c ON c.category_id = fa.category_id
GROUP BY c.name
ORDER BY avg_length desc;

-- 5) Display the most frequently rented movies in descending order.
SELECT f.title, COUNT(r.rental_id) AS rtd_movies FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
GROUP BY f.title
ORDER BY rtd_movies desc;

-- 6) List the top five genres in gross revenue in descending order.
SELECT f.rating AS genre, SUM(p.amount) AS gross_revenue FROM payment p
JOIN rental r ON r.rental_id = p.rental_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
GROUP BY genre
ORDER BY gross_revenue desc;

-- 7) Is "Academy Dinosaur" available for rent from Store 1?
SELECT f.title, COUNT(r.rental_id) AS rtd_movies FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
GROUP BY f.title
ORDER BY rtd_movies desc;
