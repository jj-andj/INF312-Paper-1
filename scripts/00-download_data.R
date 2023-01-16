#### Preamble ####
# Purpose: Get data on 2021 major crime indicators and make a table
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
library(tidyverse)

library(opendatatoronto)
library(dplyr)

#### Acquire ####
package <- show_package("major-crime-indicators")
package

resources <- list_package_resources("major-crime-indicators")

datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()

write_csv(
  x = raw_data,
  file = "raw_data.csv"
)

head(raw_data)
