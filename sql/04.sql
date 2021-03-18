/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
SELECT
    "Actor Name"
FROM (
    SELECT
        title,
        actor.first_name || ' ' || actor.last_name AS "Actor Name",
        unnest(special_features)
    FROM film
    INNER JOIN film_actor USING (film_id)
    INNER JOIN actor USING (actor_id)
) AS p
WHERE
    unnest = 'Behind the Scenes'
GROUP BY "Actor Name"
ORDER BY "Actor Name"
;
