-- Note:
-- Final output is materialized as `decision_engine_bi_fact`
-- and joined with dimension tables for BI consumption.

-- Decision Engine Logic
-- Purpose: Identify loss-making sales combinations and generate recommendations
-- Grain: order_date × category × country

SELECT
    order_date,
    category,
    country,

    sales,
    quantity,
    discount,
    profit,

    -- Decision Flag
    CASE
        WHEN profit < 0 THEN 'LOSS_MAKING'
        ELSE 'HEALTHY'
    END AS decision_flag,

    -- Recommendation Logic
    CASE
        WHEN profit < 0 AND discount >= 0.20 THEN
            'High discount detected – review pricing strategy'
        WHEN profit < 0 AND quantity <= 2 THEN
            'Low volume order – consider bundling or upselling'
        WHEN profit < 0 THEN
            'Investigate cost and supplier margins'
        ELSE
            'Performance is healthy'
    END AS recommendation

FROM fact_sales_enriched;
