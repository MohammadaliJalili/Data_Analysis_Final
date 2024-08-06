WITH Ranked_Tracks AS (
    SELECT 
        t.GenreId,
        g.Name AS Genre_Name,
        il.TrackId,
        t.Name AS Track_Name,
        ROW_NUMBER() OVER (
            PARTITION BY t.GenreId 
            ORDER BY SUM(il.Quantity * il.UnitPrice) DESC
        ) AS Track_Ranks,
        SUM(il.Quantity * il.UnitPrice) AS Total_Sale
    FROM
        invoiceline il
        JOIN track t ON t.TrackId = il.TrackId
        JOIN genre g ON g.GenreId = t.GenreId
    GROUP BY 
        t.GenreId,
        g.Name,
        il.TrackId,
        t.Name
)
SELECT 
    *
FROM 
    Ranked_Tracks 
WHERE 
    Track_Ranks <= 3