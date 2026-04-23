-- STAGE 2: VELOCITY-NORMALIZED REVENUE EXPOSURE
-- Objective: Calculate true 30-day drain by accounting for listing age and platform overlap.

SELECT 
    region,
    COUNT(DISTINCT product_id) AS unique_ghost_products, -- Cross-platform de-duplication
    COUNT(listing_id) AS total_active_listings,
    
    -- VELOCITY-BASED DRAIN: (Lifetime Units / Days Active) * 30 Days
    -- Prevents over-estimating older listings and under-estimating new high-growth threats
    SUM(
        price * (units_sold / NULLIF(CURRENT_DATE - listing_date, 0)) * 30
    ) AS monthly_revenue_drain,

    -- ANNUALIZED IMPACT: Standardized projection for Executive Reporting
    SUM(
        price * (units_sold / NULLIF(CURRENT_DATE - listing_date, 0)) * 365
    ) AS annualized_risk_to_flagship 

FROM Residual_Set
WHERE last_seen_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY region
ORDER BY annualized_risk_to_flagship DESC;
