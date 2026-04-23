-- STAGE 1: ISOLATING THE RESIDUAL SET
-- Separates authorized Acushnet sales from unauthorized "Ghost" entities.

WITH Residual_Set AS (
    SELECT p.*
    FROM Marketplace_Data p
    LEFT JOIN Internal_Sales_Ledger s
        ON  p.category = s.category
        AND p.region = s.region
        AND p.price_band = s.price_band
    WHERE s.brand_id IS NULL -- Isolates listings with no matching internal record
      -- FALSE POSITIVE SAFEGUARD: Fuzzy filter for authorized Acushnet brands
      AND NOT EXISTS (
          SELECT 1 FROM (
              SELECT 'Titleist' AS b UNION SELECT 'FootJoy' UNION 
              SELECT 'Pinnacle' UNION SELECT 'Scotty Cameron' UNION SELECT 'Vokey'
          ) AS authorized
          WHERE p.brand_name ILIKE '%' || authorized.b || '%'
      )
      AND p.listing_date >= '2025-07-01'
)
SELECT * FROM Residual_Set;
