SELECT 
    *
FROM 
    customer c
    LEFT JOIN invoice i ON i.CustomerId = c.CustomerId
WHERE 
    i.InvoiceId IS NULL;
-- There is no output, which means all the customers in the database have purchased at least one time
-- To check our result.
-- SELECT COUNT(c.customerid) FROM customer c;
-- SELECT COUNT(DISTINCT(i.customerid)) FROM invoice i;
-- This shows there are 59 customers which all appeared in Invoice Table