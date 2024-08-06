SELECT 	
    t.AlbumId,
    a.Title,
    AVG(t.Milliseconds) AS Average_Time
FROM
    track t
    JOIN album a ON a.AlbumId = t.AlbumId
GROUP BY 
    a.AlbumId
ORDER BY 
    Average_Time DESC