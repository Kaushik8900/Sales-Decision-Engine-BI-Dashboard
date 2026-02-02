--Create staging table

CREATE TABLE staging_sales (
    order_id TEXT,
    order_date DATE,
    country TEXT,
    category TEXT,
    sales REAL,
    quantity INTEGER,
    discount REAL,
    profit REAL
);

--Create demension TABLE
--Date Dimension

CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_date DATE UNIQUE,
    day INTEGER,
    month INTEGER,
    quarter INTEGER,
    year INTEGER
);

--Category Dimension

CREATE TABLE dim_category (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT UNIQUE
);

--Country Dimension

CREATE TABLE dim_country (
    country_id INTEGER PRIMARY KEY AUTOINCREMENT,
    country TEXT UNIQUE
);

--Create Fact Table

CREATE TABLE fact_sales (
    sales_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_id INTEGER,
    category_id INTEGER,
    country_id INTEGER,
    sales REAL,
    quantity INTEGER,
    discount REAL,
    profit REAL,
    FOREIGN KEY(date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY(category_id) REFERENCES dim_category(category_id),
    FOREIGN KEY(country_id) REFERENCES dim_country(country_id)
);

--Load Dimensions

INSERT INTO dim_date (order_date, day, month, quarter, year)
SELECT DISTINCT
    order_date,
    CAST(strftime('%d', order_date) AS INTEGER),
    CAST(strftime('%m', order_date) AS INTEGER),
    ((CAST(strftime('%m', order_date) AS INTEGER)-1)/3)+1,
    CAST(strftime('%Y', order_date) AS INTEGER)
FROM staging_sales;

INSERT INTO dim_category (category)
SELECT DISTINCT category FROM staging_sales;

INSERT INTO dim_country (country)
SELECT DISTINCT country FROM staging_sales;

--Load Fact Table

INSERT INTO fact_sales (
    date_id, category_id, country_id,
    sales, quantity, discount, profit
)
SELECT
    d.date_id,
    c.category_id,
    co.country_id,
    s.sales,
    s.quantity,
    s.discount,
    s.profit
FROM staging_sales s
JOIN dim_date d ON s.order_date = d.order_date
JOIN dim_category c ON s.category = c.category
JOIN dim_country co ON s.country = co.country;