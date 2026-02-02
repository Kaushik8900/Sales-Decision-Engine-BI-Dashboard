# 📊 Autonomous Business Decision Intelligence System (ABDIS)

A rule-driven analytics system that autonomously classifies business health and generates decision recommendations using SQL + Power BI.

This project simulates how a **real analytics / BI team** would design a decision engine and surface insights to stakeholders.

---

## 🚀 Project Highlights

* 🔹 Built a **Decision Engine** using SQL views & business rules
* 🔹 Created a **star‑schema BI layer** for analytics consumption
* 🔹 Designed an **interactive Power BI dashboard** with KPIs, slicers & decision tables
* 🔹 Identified **loss‑making orders, discount leakage & profit plateaus**
* 🔹 Delivered **actionable recommendations**, not just charts

---

## 🧠 Business Problem

Sales teams often struggle to answer:

* Which categories or countries are **losing money**?
* Are discounts actually driving profit or **leaking margin**?
* Which orders need **immediate corrective action**?

This project solves that by converting raw sales data into a **decision‑driven BI system**.

---

## 🏗️ Architecture Overview

```
Raw Sales Data
      ↓
Staging Tables (SQLite)
      ↓
fact_sales_enriched
      ↓
Decision Engine Views
(loss, discount leakage, profit plateau)
      ↓
decision_engine_output
      ↓
BI Fact Table
(decision_engine_bi_fact)
      ↓
Power BI Dashboard
```

---

## 🧮 Decision Engine Logic

The decision engine applies rule‑based SQL logic to classify each order:

* 🔴 **Loss Making Order** → Profit < 0
* 🟠 **Discount Leakage** → High discount, low profit uplift
* 🟡 **Profit Plateau** → Sales increasing but profit stagnant
* 🟢 **Healthy Order** → Profitable & efficient

Each order is tagged with:

* `decision_flag`
* `recommendation`

This enables **automated decision support** inside the dashboard.

---

## 📈 Dashboard Features

### KPI Cards

* Total Sales
* Total Profit
* Profit Margin (%)
* Loss Orders Count
* Discount Impact

### Visual Analytics

* Profit by Category
* Loss Orders by Category
* Discount vs Profit analysis

### Decision Table

* Order Date
* Country
* Category
* Sales, Profit
* Decision Flag
* Recommendation

### Interactivity

* Synced slicers for:

  * Country
  * Category
  * Date
* All visuals respond dynamically

---

## 🛠️ Tech Stack

| Layer           | Tools        |
| --------------- | ------------ |
| Database        | SQLite       |
| Data Modeling   | SQL          |
| BI Tool         | Power BI     |
| Measures        | DAX          |
| Version Control | Git & GitHub |

---

## 📂 Repository Structure

```
Decision-Engine-BI/
│
├── data/
│   └── sales_data.csv
│
├── sql/
│   ├── schema_design.md
│   └── decision_engine_logic.sql
│
├── powerbi/
│   └── decision_engine_dashboard.pbix
│
├── screenshots/
│   ├── dashboard_overview.png
│   ├── kpi_cards.png
│   ├── profit_by_category.png
│   ├── loss_orders_by_category.png
│   └── decision_engine_table.png
│
└── README.md
```

---

## 📸 Dashboard Preview

> 📌 See the **screenshots folder** for full dashboard visuals.

---

## 🎯 Key Learnings

* Designing **BI‑ready fact tables** prevents duplication & performance issues
* Decision logic is far more valuable than plain aggregation
* KPIs + recommendations make dashboards **actionable**
* SQL + Power BI together simulate real enterprise workflows

---

## 📌 Future Enhancements

* What‑If parameter for discount simulation
* Predictive loss classification using ML
* Deployment on Power BI Service

---

## 👤 Author

**Kaushik Upadhyay**
BCA (Data Science & Analytics) Student
Aspiring Data Analyst / BI Analyst

🔗 LinkedIn: *linkedin.com/in/kaushikupadhyay89*

---

⭐ If you find this project insightful, feel free to star the repository!
