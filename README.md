<h1 align="center">Acushnet Ghost Brand Intelligence & Forensics</h1>

<p align="center">
  <img src="asset.jpg" alt="Ghost Brand Data Forensics" width="800"/>
</p>

<br>

## 📌 Executive Summary
In Q4 2025, Acushnet’s flagship brands observed a localized sales decline in the APAC corridor. This project showcases the forensic data pipeline used to identify the root cause: **"Ghost Brands"**—competitors operating under fragmented identities to bypass tracking and aggressively undercut authorized pricing.

By deploying this SQL toolkit, I identified a **$1.3M annualized revenue risk**, enabling the business team to pivot pricing and product strategies, successfully **stabilizing the market** and halting the sales decay.

---

## 🛠️ The Forensic Toolkit
The project is organized into a four-stage intelligence pipeline located in the [`sql_queries/`](./sql_queries/) folder:

1. **[Stage 1: Identification Logic](./sql_queries/01_identification_logic.sql)**
   * **Logic:** Performs a multi-layered Anti-Join to isolate untracked marketplace listings.
   * **Data Integrity Safeguard:** Implements **Fuzzy Matching** (`ILIKE %brand%`) to ensure authorized distributors (e.g., "Titleist Official Store") are not incorrectly flagged.

2. **[Stage 2: Financial Impact Modeling](./sql_queries/02_financial_impact.sql)**
   * **Logic:** Quantified the revenue drain by normalizing marketplace "Lifetime Units Sold" data.
   * **Innovation:** Uses **Sales Velocity Modeling** (calculating daily run-rates) to provide an accurate 30-day "heartbeat" of the threat.

3. **[Stage 3: Network Forensics](./sql_queries/03_network_forensics.sql)**
   * **Logic:** Clusters fragmented listings to identify the "Mastermind" networks behind the activity.
   * **Outcome:** Aggregates regional reach and catalog size to prioritize high-volume threat actors.

4. **[Stage 4: Strategic Stabilization Tracker](./sql_queries/04_strategic_stabilization.sql)**
   * **Logic:** Correlates Ghost Brand pressure with internal sales recovery.
   * **Business Impact:** Measures the weekly "Rebound Delta" following strategic pivots in pricing and market positioning.

---

## 📈 Business Outcomes
* **Root Cause Discovery:** Isolated the Q4 decline to specific "Ghost" activity rather than broader market trends.
* **Risk Quantified:** Modeled a $1.3M annual revenue leak, providing the financial justification for strategic intervention.
* **Strategic Pivot:** Enabled the APAC business team to adjust pricing and product positioning, leading to a stabilized competitive stance and a halt in revenue decay.

---

## 🛡️ Methodology & Data Ethics
* **Regional Focus:** Primary analysis conducted on marketplace data across **Singapore, Indonesia, Vietnam, Philippines, and Thailand**.
* **De-duplication:** Implemented cross-platform logic to prevent double-counting listings active on both Lazada and Shopee.
* **Velocity Normalization:** Corrected for "Lifetime Units" bias by using `GREATEST()` functions to handle brand-new listings (Day 0) without data loss.
* **Privacy:** All specific seller IDs and internal financial identifiers have been anonymized for this public demonstration.

<br>

<p align="center">
  <i>This project demonstrates the intersection of Data Engineering, Competitive Intelligence, and Strategic Business Recovery.</i>
</p>
