/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 
CREATE view temporary_behind_the_scenes AS (
    SELECT
        title
        --special_feature
    FROM (
        SELECT
            title,
            unnest(special_features) AS special_feature
        FROM film
    ) AS p
    WHERE special_feature = 'Behind the Scenes'
);
CREATE view temporary_trailers AS (
    SELECT
        title
    FROM (
        SELECT
            title,
            unnest(special_features) AS special_feature
        FROM film
    ) AS pl
    WHERE special_feature = 'Trailers'
);
*/
SELECT
    title
FROM temporary_behind_the_scenes
INNER JOIN temporary_trailers USING (title)
ORDER BY title
;
