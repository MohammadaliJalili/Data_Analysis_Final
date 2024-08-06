SELECT
    YEAR,
    Total_Sold_Number,
    SUM(Total_Sold_Number) OVER (ORDER BY YEAR) AS Cumulative_Total
FROM (
    SELECT
        DISTINCT(YEAR(i.invoicedate)) AS YEAR,
        SUM(il.Quantity) AS Total_Sold_Number
    FROM
        invoice i
        JOIN invoiceline il ON il.InvoiceId = i.InvoiceId
    GROUP BY
        YEAR(i.invoicedate)
) AS yearly_totals
ORDER BY
    YEAR