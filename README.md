# Brazil AMR Surveillance
A clinical surveillance report analyzing multidrug-resistant K. pneumoniae in a hospital setting using R
# 🏥 Fighting the Silent Pandemic: A Clinical AMR Study 
### Mapping *K. pneumoniae* Resistance in Brazil | Analyzed by [Jayeoba Faith Onize]

## 💡 The "Why" Behind This Project
We often discuss antimicrobial resistance (AMR) as a future threat, but for clinicians and patients in Brazil, it is a present reality. I built this project to bridge the gap between messy hospital lab results and actionable public health strategy. 

In epidemiology, every data point represents a real person. My goal for this portfolio piece was to treat this data with the scientific rigor it deserves turning raw clinical records into a clear roadmap for hospital antibiotic stewardship.

## 🧠 The "Epi" Mindset (Methodological Rigor)
I didn't just run a script; I made intentional, evidence-based choices to ensure this analysis was sound:

* **Clinical vs. Environmental:** I filtered specifically for "clinical" isolates. In a hospital setting, focusing on these rather than screening or environmental samples ensures the results reflect what is actually making patients sick in the wards.
* **Prioritizing "Last Resort" Meds:** I specifically highlighted **Polymyxin B**. When resistance shows up in our "drugs of last resort" (detected at 12% in this dataset), it’s not just a statistic it’s a clinical emergency. 
* **Handling the Mess:** Real world data is rarely "clean." I spent significant time handling naming inconsistencies and cleaning BioSample headers to ensure the results were precise, auditable, and reproducible.

## 🛠️ Technical Competencies
To keep this study transparent and professional, I utilized:
* **R (Tidyverse):** For logical, readable data wrangling.
* **ggplot2:** To create high-impact visuals that speak to doctors and stakeholders.
* **GitHub Workflow:** To ensure every step of my data cleaning process is open for peer review.

## 📊 Key Findings
* **Aminoglycoside Vulnerability:** Gentamicin resistance is high (**41.2%**), suggesting it may no longer be a reliable first-line option in this facility.
* **The Rise of Super-Isolates:** I discovered individual isolates resistant to **over 20 different drugs**. This highlights the incredible evolutionary pressure pathogens face in intensive hospital environments.



## 📂 Repository Structure
* `/data`: Raw clinical isolate records (Source: NCBI).
* `/scripts`: My step-by-step R code (heavily commented for transparency).
* `/outputs`: Professional visualizations and summary reports.

## 📜 Data Attribution
This analysis utilizes the **National Center for Biotechnology Information (NCBI) Pathogen Detection Database**. 
* **Organism:** *Klebsiella pneumoniae* * **Location:** Brazil (Clinical isolates)
* **Accession Date:** Jan 2026
* **Source Link:** [NCBI Pathogen Detection Portal](https://www.ncbi.nlm.nih.gov/pathogens/)

---

## 🤝 Let’s Connect
I believe epidemiology is a team sport. If you’re working on infectious disease surveillance or public health data science, I’d love to chat about how we can use data to save lives.

**Find me here:** [linkedin.com/in/faith-jayeoba-40155a1b1] | [saidufaithonize@gmail.com]
