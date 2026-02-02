\# Data Model \& Schema Design



\## Overview

This project follows a \*\*star schema\*\* design to support analytical queries and Power BI reporting.

The model separates transactional data into a central fact table and multiple dimension tables

to ensure clarity, scalability, and performance.



---



\## Fact Table: `decision\_engine\_bi\_fact`



\*\*Grain:\*\* One row per category × country × order_date



\### Measures

\- Sales

\- Quantity

\- Discount

\- Profit



\### Derived Business Fields

\- Decision Flag (Loss / Healthy)

\- Recommendation (Actionable insight from decision engine)



This table is optimized for BI consumption and acts as the single source of truth for reporting.



---



\## Dimension Tables



\### `dim\_date`

\- date\_id (surrogate key)

\- order\_date

\- year

\- month

\- quarter



Used for time-based analysis and trend reporting.



---



\### `dim\_category`

\- category\_id (surrogate key)

\- category



Enables category-level aggregation and filtering.



---



\### `dim\_country`

\- country\_id (surrogate key)

\- country



Supports regional performance and geographic insights.



---



\## Design Rationale

\- \*\*Star schema\*\* simplifies Power BI relationships and improves performance.

\- Surrogate keys ensure stable joins even if business values change.

\- Business logic is applied upstream to reduce complexity in DAX.

\- Decision intelligence is embedded at the data layer for consistency.



---



\## BI Readiness

The final fact table is denormalized for:

\- Faster dashboard rendering

\- Simpler DAX measures

\- Clear KPI definitions



