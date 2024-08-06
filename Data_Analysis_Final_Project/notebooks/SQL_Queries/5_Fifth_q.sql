SELECT 
    c.SupportRepId,
    CONCAT(e.FirstName, ' ', e.LastName) AS Full_Name,
    SUM(il.Quantity) AS Sold_by_Staff
FROM
    invoice i
        JOIN
    invoiceline il ON il.InvoiceId = i.InvoiceId
        JOIN
    customer c ON c.CustomerId = i.CustomerId
        JOIN
    employee e ON e.EmployeeId = c.SupportRepId
GROUP BY c.SupportRepId
ORDER BY Sold_by_Staff DESC
