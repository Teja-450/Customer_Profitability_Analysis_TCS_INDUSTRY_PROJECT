# 📊 Customer Profitability Analysis

### 🎯 Project Overview

This project identifies **profitable and at-risk customers** for a telecom company using **ETL pipelines**, a **MySQL data mart**, and **Power BI dashboards**.
It enables data-driven decisions for **customer retention**, **churn reduction**, and **profit optimization**.

---

## ⚙️ Workflow

1. **Data Cleaning (Python):**

   * Handled missing values, standardized formats, and added synthetic columns like *Country*, *Region*, *ProfitabilityScore*, and *CLV*.

2. **ETL & Data Mart (MySQL):**

   * Created tables: `stg_telco_clean`, `dim_customer`, `fact_profitability`.
   * Established relationships and populated KPIs through SQL joins and transformations.

3. **Visualization (Power BI):**

   * Built 4 interactive pages:

     * 📈 **KPI Overview** – Revenue, CLV, Profitability
     * 🌍 **Customer Segmentation** – Region, Contract, Tenure
     * 💰 **Profitability Insights** – High-value vs. Low-value
     * 👤 **Customer Drilldown** – Individual customer analysis

---

## 🔍 Key Insights

* Long-term contracts have **higher CLV & lower churn**.
* **Month-to-month** customers are least profitable and most likely to leave.
* **Senior citizens** and **fiber optic users** show higher churn tendencies.
* Identified **164 high-value at-risk customers** for targeted retention.

---

## 🧠 Tech Stack

| Category        | Tools                       |
| --------------- | --------------------------- |
| Data Processing | Python (Pandas, NumPy)      |
| Database        | MySQL 8.0                   |
| Visualization   | Power BI                    |
| Modeling        | SQL (Fact-Dimension Schema) |

---

## 📂 Repository Structure

```
Customer_Profitability_Analysis/
├── data/                # Raw & cleaned datasets
├── sql/                 # Database & ETL scripts
├── powerbi/             # Power BI dashboard (.pbix)
├── docs/                # Reports & screenshots
└── README.md
```

---

## 🚀 Future Enhancements

* Add **machine learning-based churn prediction**.
* Enable **real-time data refresh** in Power BI.
* Track **marketing campaign performance**.

---

## 👨‍💻 Author

**Teja Ambati**
📧 *[your email]*
📎 [LinkedIn / Portfolio if available]

---
