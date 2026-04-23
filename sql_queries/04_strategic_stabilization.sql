-- STAGE 4: STRATEGIC STABILIZATION & COUNTER-POSITIONING
-- Objective: Measure the recovery of Internal Sales after strategic adjustments in Q4.

SELECT 
    s.week_commencing,
    s.region,
    SUM(s.revenue) AS flagship_revenue,
    -- Correlating with Ghost Brand pressure using the normalized velocity logic
    AVG(p.units_sold / GREATEST(CURRENT_DATE - p.listing_date, 1) * 30) AS ghost_brand_pressure,
    -- Calculating the weekly Rebound (Current Week vs Previous Week)
    (SUM(s.revenue) - LAG(SUM(s.revenue)) OVER (PARTITION BY s.region ORDER BY s.week_commencing)) AS weekly_growth_delta
FROM Internal_Sales_Ledger s
JOIN Marketplace_Data p ON s.region = p.region
WHERE s.brand_id = 'ACUSHNET_FLAGSHIP'
  AND s.week_commencing >= '2025-10-01' -- Focus on Q4 recovery period
GROUP BY s.week_commencing, s.region
ORDER BY s.week_commencing DESC;
