library(readxl)
library(tidyverse)
library(glamr)
library(gophr)
library(glitr)
library(gisr)
library(gagglr)

file_path <- "C:/Users/madel/Downloads/User data.xlsx"
delivery_data <- read_excel(file_path)

# View the data
head(delivery_data)

curr_date <- "2021-02-01"
delivery_data <- delivery_data %>%
  rename( user_id = `User ID`,
          sign_up_date = `Sign up date`,
          packs_per_delivery = `Packs per delivery`)%>%
  rename( last_delivery_date= `Last delivery date`)
  

delivery_data<- delivery_data%>%
  mutate(bc_days_last_delivery = 28 * packs_per_delivery,
         bc_runs_out = last_delivery_date + bc_days_last_delivery)

