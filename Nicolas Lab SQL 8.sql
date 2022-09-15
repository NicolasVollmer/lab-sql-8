##### Lab | SQL Join (Part II)

# 1 Write a query to display for each store its store ID, city, and country.
-- store > address > city > country
SELECT s.store_id, a.address, ci.city, co.country
FROM sakila.store s
JOIN sakila.address a ON s.address_id = a.address_id
JOIN sakila.city ci ON a.city_id = ci.city_id
JOIN sakila.country co ON ci.country_id = co.country_id
ORDER BY store_id ASC;

# 2 Write a query to display how much business, in dollars, each store brought in.
-- store > payment > customer > payment
SELECT s.store_id, sum(p.amount) AS 'total $ sales'
FROM sakila.store s 
JOIN sakila.customer c ON s.store_id = c.store_id
JOIN sakila.payment p ON c.customer_id = p.customer_id
GROUP BY store_id
ORDER BY store_id ASC;

# 3 Which film categories are longest?
-- film > film_category > category
SELECT c.name, AVG(f.length) AS 'average duration'
FROM sakila.film f
JOIN sakila.film_category fc ON f.film_id = fc.film_id
JOIN sakila.category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY AVG(f.length) desc;

# 4 Display the most frequently rented movies in descending order.
-- film > inventory > rental
SELECT f.title, COUNT(r.rental_id) AS 'times rented'
FROM sakila.film f
JOIN sakila.inventory i ON f.film_id = i.film_id
JOIN sakila.rental r ON i.inventory_id = r.rental_id
GROUP BY f.title
ORDER BY COUNT(r.rental_id), f.title
LIMIT 50;

# 5 List the top five genres in gross revenue in descending order.
-- category > film_category > inventory > rental > payment 
SELECT c.name AS 'genre', SUM(p.amount) AS 'gross revenue'
FROM sakila.category c
JOIN sakila.film_category fc ON c.category_id = fc.category_id
JOIN sakila.inventory i ON fc.film_id = i.film_id
JOIN sakila.rental r ON i.inventory_id = r.inventory_id
JOIN sakila.payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY SUM(p.amount) DESC
LIMIT 5;

# 6 Is "Academy Dinosaur" available for rent from Store 1?
SELECT i.store_id, f.title, COUNT(i.film_id) AS 'copies available'
FROM sakila.film f 
JOIN sakila.inventory i ON f.film_id = i.film_id
WHERE f.title = 'ACADEMY DINOSAUR' AND i.store_id = 1
GROUP BY i.store_id;

# 7 Get all pairs of actors that worked together.
SELECT 
FROM sakila.actor a
JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id
WHERE 
GROUP BY


# 8 Get all pairs of customers that have rented the same film more than 3 times.

# 9 For each film, list actor that has acted in more films.

