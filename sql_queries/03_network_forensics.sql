-- STAGE 3: MASTERMIND ATTRIBUTION (SELLER CLUSTERING)
-- Objective: Identify coordinated threat actor networks.

SELECT 
    seller_id, 
    COUNT(DISTINCT product_id) AS unique_catalog_size,
    COUNT(listing_id) AS total_ghost_listings,
    SUM(units_sold) AS total_stolen_volume,
    MIN(listing_date) AS first_entry_date,
    COUNT(DISTINCT region) AS regional_reach 
FROM Residual_Set
GROUP BY seller_id
-- FIX: Using raw aggregate to follow SQL execution order (HAVING processed before SELECT)
HAVING COUNT(listing_id) > 5 
ORDER BY total_stolen_volume DESC;
