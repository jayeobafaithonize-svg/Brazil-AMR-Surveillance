# Project: AMR Surveillance - Klebsiella pneumoniae (Brazil Hospital)
# Author: Jayeoba Faith Onize
# Goal: Data cleaning, resistance prevalence, and MDR identification

# install.packages(c("tidyverse", "janitor", "lubridate"))
install.packages("janitor")

library(tidyverse)
library(lubridate)
library(janitor)


  
  #load data
  Brazil_Hospital_data <- read_csv("C:/Users/Test/Downloads/Brazil Hospital Klebssiela data.csv")
  
  # Now we clean those messy column names
  clean_data <- Brazil_Hospital_data %>%
    clean_names()
  
  View(clean_data)
  
  # Standardize column names (lower_case_with_underscores)
  clean_data <- clean_data %>%
    
    # Remove columns that are 100% empty or irrelevant to this analysis    
    select(-disk_diffusion_mm, -laboratory_typing_method_version_or_reagent) %>%
    
    # Focus on clinical isolates (Epi decision: excludes screening/env samples)
    filter(isolation_type == "clinical") %>%
    
    # Ensure we have a result for our primary outcome
    drop_na(resistance_phenotype) 

  clean_data <- clean_data %>%
    mutate(
      create_date = as_date(create_date),
      resistance_phenotype = as.factor(resistance_phenotype)
    )  
Calculate Resistance Rates per Antibiotic
  resistance_summary <- clean_data %>%
    group_by(antibiotic) %>%
    summarise(
      total_tested = n(),
      n_resistant = sum(resistance_phenotype == "resistant"),
      percent_resistant = (n_resistant / total_tested) * 100
    ) %>%
    arrange(desc(percent_resistant))
  
  print(resistance_summary)

  Identify Multidrug-Resistant (MDR) "Superbugs"
  mdr_analysis <- clean_data %>%
    filter(resistance_phenotype == "resistant") %>%
    group_by(isolate) %>%
    summarise(num_resistant_drugs = n_distinct(antibiotic)) %>%
    arrange(desc(num_resistant_drugs))
  
  # How many isolates are resistant to >5 drugs?
  high_risk_isolates <- mdr_analysis %>% filter(num_resistant_drugs > 5)
  
  
# Resitance Prevalence 
    theme_epi <- function() {
    theme_minimal(base_size = 12) +
      theme(
        plot.title = element_text(face = "bold", size = 16, color = "#2c3e50"),
        plot.subtitle = element_text(size = 11, color = "#7f8c8d"),
        axis.title = element_text(face = "bold"),
        panel.grid.minor = element_blank(),
        legend.position = "none"
      )
  }
  
  # Generate the plot
  resistance_plot <- resistance_summary %>%
    # We use reorder() so the most resistant drugs are at the top
    ggplot(aes(x = reorder(antibiotic, percent_resistant), y = percent_resistant)) +
    
    # Adding bars with a professional color (SteelBlue)
    geom_col(fill = "#2980b9", alpha = 0.8) +
    
    # Highlight a 'last-resort' drug if it's in the list (e.g., Polymyxin B)
    # This shows you have clinical knowledge!
    geom_col(data = filter(resistance_summary, antibiotic == "polymyxin B"), 
             fill = "#e74c3c") + 
    
    # Flip coordinates for better label readability
    coord_flip() +
    
    # Add the percentage labels on top of the bars
    geom_text(aes(label = paste0(round(percent_resistant, 1), "%")), 
              hjust = -0.2, size = 3.5, color = "#2c3e50") +
    
    # Professional labels
    labs(
      title = "Antibiotic Resistance Profile: K. pneumoniae",
      subtitle = "Brazil Hospital Surveillance | Red bar indicates drug of last resort (Polymyxin B)",
      x = "Antibiotic Agent",
      y = "Prevalence of Resistance (%)",
      caption = "Source: Clinical isolate data (2026) | Analysis by [Jayeoba Faith Onize]"
    ) +
    
    # Apply our custom theme
    theme_epi() +
    
    # Adjust y-axis limit to make room for labels
    scale_y_continuous(limits = c(0, max(resistance_summary$percent_resistant) + 10))
  
  # Display the plot
  print(resistance_plot)
  
  #Save for Portfolio ---------------------------------------------------
  # Saving as a high-res PNG for your website or GitHub README
  ggsave("Brazil_AMR_Resistance_Profile.png", plot = resistance_plot, width = 10, height = 7, dpi = 300)
  