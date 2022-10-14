USE sakila;

-- Write a SQL query to find the total rental amount paid for each film. Your query should return the following columns: film_id, total_amount


SELECT f.film_id, sum(f.rental_rate) as total_amount
FROM film f JOIN inventory i ON i.film_id = f.film_id  JOIN rental r on r.inventory_id = i.inventory_id 
GROUP BY f.film_id 


-- Create a view named total_rental_amount using the query from the previous step.
CREATE VIEW total_rental_amount AS 
SELECT f.film_id, sum(f.rental_rate) as total_amount
FROM film f JOIN inventory i ON i.film_id = f.film_id  JOIN rental r on r.inventory_id = i.inventory_id 
GROUP BY f.film_id 

-- Write a SQL query to find the total number of copies in inventory for each film. Your query should return the following columns: film_id, total_copies

SELECT f.film_id, COUNT(f.film_id) as total_copies
FROM film f join inventory i on i.film_id = f.film_id
GROUP BY f.film_id

-- Create a view named total_film_copies using the query from the previous step.

CREATE VIEW total_film_copies AS 
SELECT f.film_id, COUNT(f.film_id) as total_copies
FROM film f join inventory i on i.film_id = f.film_id
GROUP BY f.film_id

-- Write a SQL query that combines data from the film table, the total_rental_amount view, and the total_film_copies view to find all films with a total rental amount greater than 200.00, and display the following columns:
-- film_id, tittle, description, rental_duration, rental_rate, replacement_cost, rating, total_copies, total_amount

SELECT f.film_id , f.title , f.description , f.rental_duration , f.rental_rate , f.rating , tra.total_amount as total_amount, tfc.total_copies as total_copies
FROM film f JOIN total_rental_amount tra on tra.film_id = f.film_id join total_film_copies tfc on tfc.film_id = f.film_id 
WHERE  tra.total_amount  > 200;





