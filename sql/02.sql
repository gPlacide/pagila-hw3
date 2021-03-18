/*
 * Count the number of movies that contain each type of special feature.
 */
SELECT
    special_features,
    count(*)
FROM (
    SELECT
        title,
        unnest(special_features) AS special_features
    FROM film
) AS p
GROUP BY special_features
ORDER BY special_features
;
