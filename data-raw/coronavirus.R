## code to prepare `coronavirus` dataset goes here
library(ggplot2)
library(tidyverse)
library(tibble)
library(dplyr)
library(shiny)
library(shinyWidgets)
library(tidyverse)
library(plotly)
library(countrycode)

summary_df <- read.csv ("data-raw/coronavirus.csv") %>%
  filter(type == "confirmed") %>%
  group_by(country) %>%
  filter(country%in% c("US","Brazil","India"))


df <-read.csv("data-raw/coronavirus.csv") %>%
  filter(type == "confirmed") %>%
  group_by(country) %>%
  mutate(case=sum(cases))%>% mutate(code = countrycode(country,origin = 'country.name', destination = 'iso3c'))


tb <- read.csv("data-raw/coronavirus.csv") %>%
  filter(country =="US") %>%
  pivot_wider(id_cols = date, names_from = type, values_from = cases) %>%
  arrange(desc(date))


usethis::use_data(summary_df, overwrite = TRUE)
usethis::use_data(df, overwrite = TRUE)
usethis::use_data(tb, overwrite = TRUE)
