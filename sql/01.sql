/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */
SELECT
    title
FROM (
    SELECT
        film_id,
        title,
        rating,
        unnest(special_features)
    FROM film
) AS P
WHERE
    rating = 'G' AND
    unnest = 'Trailers'
ORDER BY title DESC
;
