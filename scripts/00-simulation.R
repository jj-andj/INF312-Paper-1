#### Preamble ####
# Purpose: Simulate data on 2021 major crime indicators
# Author: Jayden Jung
# Email: jayden.jung@mail.utoronto.ca
# Date: 15 January 2023
# Prerequisites: - 

#### Workspace set-up ####
install.packages("opendatatoronto")
install.packages("lubridate")
install.packages("knitr")

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

head(simulated_mci_data)
tail(simulated_mci_data)
