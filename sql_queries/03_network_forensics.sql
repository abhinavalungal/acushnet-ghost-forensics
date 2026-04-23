-- STAGE 3: MASTERMIND ATTRIBUTION (SELLER CLUSTERING)
-- Objective: Group fragmented listings to identify coordinated threat actor networks.

SELECT 
    seller_id, 
    COUNT(DISTINCT product_id) AS unique_catalog_size,
    COUNT(listing_id) AS total_ghost_listings,
    SUM(units_sold) AS total_stolen_volume,
    MIN(listing_date) AS first_entry_date,
    -- Identifies if the seller is multi-region
    COUNT(DISTINCT region) AS regional_reach 
FROM Residual_Set
GROUP BY seller_id
HAVING total_ghost_listings > 5 -- Filters for coordinated activity vs. one-off sellers
ORDER BY total_stolen_volume DESC;
