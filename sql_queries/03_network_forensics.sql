-- TITLE: Mastermind Seller Attribution
-- OBJECTIVE: Identify the primary threat actor network.

SELECT 
    seller_id, 
    COUNT(listing_id) AS total_ghost_listings,
    SUM(units_sold) AS total_stolen_volume,
    MIN(listing_date) AS first_entry_date
FROM Residual_Set
GROUP BY seller_id
HAVING total_stolen_volume > 50
ORDER BY total_stolen_volume DESC;
