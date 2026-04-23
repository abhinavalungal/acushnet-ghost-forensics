-- TITLE: Revenue Exposure Projection
-- OBJECTIVE: Quantify the $1.3M Revenue Risk.

-- Note: This query assumes the Residual_Set CTE is defined or results are stored.
SELECT 
    region,
    COUNT(listing_id) AS active_infiltrators,
    SUM(price * units_sold) AS monthly_revenue_drain,
    (SUM(price * units_sold) * 12) AS annualized_risk_to_flagship
FROM Residual_Set
WHERE listing_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY region
ORDER BY annualized_risk_to_flagship DESC;
