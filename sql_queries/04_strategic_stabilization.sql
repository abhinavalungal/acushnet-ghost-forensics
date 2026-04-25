-- STAGE 4: STRATEGIC STABILIZATION & COUNTER-POSITIONING
-- Objective: Measure recovery of Internal Sales after Q4 adjustments.
-- FIX: Ghost_Pressure CTE pre-aggregates by region BEFORE the join.
-- Without it, joining a regional ledger to individual listings causes fan-out,
-- multiplying flagship revenue by the ghost listing count per region.
WITH Ghost_Pressure AS (
    SELECT
        region,
        AVG(units_sold::NUMERIC / GREATEST(CURRENT_DATE - listing_date, 1) * 30)
            AS avg_monthly_pressure
    FROM Marketplace_Data
    GROUP BY region
)
SELECT
    s.week_commencing,
    s.region,
    SUM(s.revenue) AS flagship_revenue,
    -- Pulled from pre-aggregated CTE — safe single value per region, no fan-out
    gp.avg_monthly_pressure AS ghost_brand_pressure,
    -- Calculating the weekly Rebound (Current Week vs Previous Week)
    (SUM(s.revenue) - LAG(SUM(s.revenue)) OVER (PARTITION BY s.region ORDER BY s.week_commencing))
        AS weekly_growth_delta
FROM Internal_Sales_Ledger s
JOIN Ghost_Pressure gp ON s.region = gp.region
WHERE s.brand_id = 'ACUSHNET_FLAGSHIP'
  AND s.week_commencing >= '2025-10-01' -- Focus on Q4 recovery period
GROUP BY s.week_commencing, s.region, gp.avg_monthly_pressure
ORDER BY s.week_commencing DESC;
