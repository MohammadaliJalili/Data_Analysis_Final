SELECT 
    t.TrackId,
    t.Name AS TrackName,
    SUM(il.UnitPrice * il.Quantity) AS TotalProfit
FROM 
    Track t
    JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY 
    t.TrackId, 
    t.Name
ORDER BY 
    TotalProfit DESC
LIMIT 10;