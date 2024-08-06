WITH CustomerPurchase AS (
    SELECT 
        i.CustomerId,
        CONCAT(c.FirstName, " ", c.LastName) AS Full_Name,
        SUM(i.total) AS Total_Customer_Purchase
    FROM invoice i 
    JOIN Customer c ON c.CustomerId = i.CustomerId
    GROUP BY i.CustomerId
),
Above_Average AS (
    SELECT
        cp.CustomerId,
        cp.Full_Name, 
        cp.Total_Customer_Purchase,
        (cp.Total_Customer_Purchase - AVG(cp.Total_Customer_Purchase) OVER ()) AS Higher_Than_AVG
    FROM CustomerPurchase cp
)
SELECT 
    av.CustomerId,
    av.Full_Name,
    av.Total_Customer_Purchase,
    av.Higher_Than_AVG
FROM Above_Average av
WHERE av.Higher_Than_AVG > 0
ORDER BY av.Higher_Than_AVG DESC