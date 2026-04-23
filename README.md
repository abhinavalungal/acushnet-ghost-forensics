<h1 align="center">Acushnet Ghost Brand Intelligence & Forensics</h1>

<p align="center">
  <img src="assets.jpg" alt="Ghost Brand Data Forensics" width="800"/>
</p>

<br>
  
## Overview  
This project provides a sophisticated SQL framework to identify and neutralize "Ghost Brands"—unauthorized shadow entities launched by competitors to cannibalize market share. By applying an "Anti-Join" methodology against internal sales data, this pipeline isolates anomalies, calculates financial exposure ($1.3M+ Risk), and identifies coordinated actor networks.

---

## Project Goals  
- **Anomaly Detection** — Use "Residual Set" logic to mathematically isolate unauthorized listings.
- **Financial Attribution** — Quantify the annualized revenue risk to the Acushnet Flagship brand.
- **Forensic Intelligence** — Prove "Bad Faith" through review manipulation and metadata clustering.
- **Strategic Enforcement** — Provide legal and compliance teams with specific seller IDs for de-platforming.
- **Market Integrity** — Correlate competitor "Ghost" growth with internal sales decay to prove causality.

---

## The Intelligence Pipeline

### 1. The "Residual Set" Filter
- Standardized messy marketplace titles using Regex and normalization.
- Performed a **Multi-Key Anti-Join** against the `Internal_Sales_Ledger`.
- Filtered out authorized Acushnet brands (**Titleist, FootJoy, Pinnacle, Scotty Cameron**) to isolate true intruders.

### 2. Impact Quantification
- Built window-function queries to calculate **Price-to-Mean Ratios**.
- Projected a **$1.3M Annualized Revenue Risk** by analyzing current 30-day velocity.
- Mapped regional saturation across APAC corridors (Singapore, Vietnam, Thailand).

### 3. Forensic Attribution
- Identified 34+ individual listings belonging to a single "Mastermind" entity via **Seller ID Clustering**.
- Analyzed **Catalog Uniformity** (description character counts) to prove bot-driven automation.
- Flagged unnatural **Review Capture Rates (>15%)** to provide evidence of platform manipulation (Brushing).

---

## Analytics Workflow

### Stage 1: Identification (The "Brain")
Isolates listings that match the category and price band of **ACUSHNET_FLAGSHIP** but lack internal authorization.

### Stage 2: Revenue Risk Modeling
Translates unit sales loss into dollar-value exposure to justify executive intervention.

### Stage 3: Legal & Enforcement
Aggregates forensic evidence (Seller Attribution + Review Bot signals) for marketplace takedown requests.

---

## Key Metrics & Outcomes
- **$1.3M Revenue Risk** identified and localized to specific APAC regions.
- **40% Index Point Drop** in Acushnet Flagship sales correlated directly to Ghost Brand entry.
- **Forensic Proof** of coordinated attacks by a single parent entity using 30+ "Ghost" accounts.
- **Zero-History Detection:** Identified brands achieving "Top Seller" status in <90 days without brand history.

---

## Technical Stack
- **SQL** (Snowflake / PostgreSQL)
- **Advanced Techniques:** CTEs, Window Functions (LAG/AVG), Anti-Joins, Regex Normalization.
- **Data Domains:** Marketplace Intelligence, Competitive Forensics, Brand Protection.

---

## Methodology
The core of this project relies on **Residual Set Analysis**:
`Market Data` - (`Internal Catalog` + `Known Competitors`) = **The Threat Actor.**
