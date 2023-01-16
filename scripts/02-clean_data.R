#### Preamble ####
# Purpose: Clean data on 2021 major crime indicators
# Author: Jayden Jung
# Email: jayden.jung@mail.utoronto.ca
# Date: 15 January 2023
# Prerequisites: have downloaded raw_data.csv from inputs/data 

#### Workspace set-up ####
library(haven)
library(tidyverse)
library(janitor)

raw_data <- readr::read_csv("inputs/data/raw_data.csv"
)

names(raw_data)

cleaned_data <-
  clean_names(raw_data) %>% 
  select(occurrencedate, occurrenceyear, occurrencemonth, occurrenceday, 
         occurrencedayofweek, occurrencehour, mci_category, premises_type)

head(cleaned_data)

write_csv(
  x = cleaned_data,
  file = "cleaned_data.csv"
)