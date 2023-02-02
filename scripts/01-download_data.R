#### Preamble ####
# Purpose: Get data on Toronto major crime indicators from Open Data Toronto
# Author: Jayden Jung
# Email: jayden.jung@mail.utoronto.ca
# Date: 15 January 2023
# Prerequisites: have access to opendataotoronto

#### Workspace set-up ####
install.packages("opendatatoronto")
install.packages("lubridate")
install.packages("knitr")
install.packages("tidyverse")
install.packages("janitor")
install.packages("here")

library(knitr)
library(janitor)
library(lubridate)
library(tidyverse)

library(opendatatoronto)
library(dplyr)

#### Acquire ####

# Acquiring data from opendatatoronto
package <- show_package("major-crime-indicators")
package

resources <- list_package_resources("major-crime-indicators")

datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

raw_data <- filter(datastore_resources, row_number()==2) %>% get_resource()

path <- "inputs/data/"

# Writing raw data onto a csv 
write_csv(
  x = raw_data,
  paste(path, file = "raw_data.csv", sep = '')
)

head(raw_data)
