/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */
SELECT
    special_feature,
    sum(profit) AS profit
FROM (
    SELECT
        title,
        unnest(special_features) AS special_feature,
        sum(amount) AS profit
    FROM film
    INNER JOIN inventory USING (film_id)
    INNER JOIN rental USING (inventory_id)
    INNER JOIN payment USING (rental_id)
    GROUP BY title, special_feature
) AS p
GROUP BY special_feature
ORDER BY special_feature
;
