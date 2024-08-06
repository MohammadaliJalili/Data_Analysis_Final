WITH CustomerGenres AS (
    SELECT 
        c.CustomerId,
        c.FirstName,
        c.LastName,
        t.GenreId
    FROM customer c
    JOIN invoice i ON i.CustomerId = c.CustomerId
    JOIN invoiceline il ON il.InvoiceId = i.InvoiceId
    JOIN track t ON t.TrackId = il.TrackId
)
SELECT 
    CustomerId,
    CONCAT(FirstName, ' ', LastName) AS Full_Name,
    COUNT(DISTINCT GenreId) AS Purchased_Genres
FROM CustomerGenres
GROUP BY CustomerId
HAVING Purchased_Genres > 1
ORDER BY Purchased_Genres DESC