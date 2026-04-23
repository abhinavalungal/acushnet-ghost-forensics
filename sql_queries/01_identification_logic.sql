-- TITLE: The "Residual Set" Identifier
-- OBJECTIVE: Perform an Anti-Join to isolate unauthorized listings.

WITH Residual_Set AS (
    SELECT p.*
    FROM Marketplace_Data p
    LEFT JOIN Internal_Sales_Ledger s
        ON  p.category = s.category
        AND p.region = s.region
        AND p.price_band = s.price_band
    WHERE s.brand_id IS NULL -- Isolates listings with NO matching internal record
      AND p.brand_name NOT IN ('Titleist', 'FootJoy', 'Pinnacle', 'Scotty Cameron', 'Vokey')
      AND p.listing_date >= '2025-07-01'
)
SELECT * FROM Residual_Set;
