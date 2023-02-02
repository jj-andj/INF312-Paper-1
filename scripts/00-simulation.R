#### Preamble ####
# Purpose: Simulate data on 2021 major crime indicator occurrences
# Author: Jayden Jung
# Email: jayden.jung@mail.utoronto.ca
# Date: Feb 3 2023
# Prerequisites: - 

#### Workspace set-up ####
install.packages("opendatatoronto")
install.packages("lubridate")
install.packages("knitr")
install.packages("tidyverse")
install.packages("janitor")

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

#### Simulate ####
set.seed(309)

simulated_mci_data <-
  tibble(
    date = rep(x = as.Date("2021-01-01") + c(0:364), times = 3),
    mci_category = sample(
      x = c(
        "Assault",
        "Break and Enter",
        "Auto Theft",
        "Robbery",
        "Theft Over"
      ),
      size = 365 * 3,
      replace = TRUE
    ),
    premise_type = sample(
      x = c(
        "Location 1",
        "Location 2",
        "Location 3",
        "Other"
      ),
      size = 365 * 3,
      replace = TRUE
    )
  )

#seeing what the simulated data looks like
head(simulated_mci_data)
tail(simulated_mci_data)


#### Testing Simulated Data ####

#testing for correct minimum date
min(simulated_mci_data$date) == "2021-01-01"

#testing for correct maximum date
max(simulated_mci_data$date) == "2021-12-31"

#testing that data has correct number of entries
nrow(simulated_mci_data) == 365 * 3

#testing for correct column types
x <- sapply(simulated_mci_data, class)
x[1] == "Date" && x[2] == "character" && x[3] == "character"
