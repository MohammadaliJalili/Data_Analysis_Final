SELECT 
    g.GenreId,
    g.Name,
    COUNT(*) AS TracksSold,
    SUM(il.Quantity * il.UnitPrice) AS TotalRevenue
FROM
    InvoiceLine il
JOIN Track t ON t.TrackId = il.TrackId
JOIN Genre g ON g.GenreId = t.GenreId
GROUP BY g.GenreId, g.Name
ORDER BY TracksSold DESC, TotalRevenue DESC
LIMIT 1
