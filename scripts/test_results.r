library(dplyr)

#setwd("/Users/chasekaylee/Desktop/info498f/INFO-498F-Final-Project")
flint_data <- read.csv("data/Test_Results_Flint.csv", stringsAsFactors = FALSE)

# Renames 3 of the columns to be more readable
colnames(flint_data)[2] <- 'Date_Submitted'
colnames(flint_data)[4] <- 'Lead_ppb'
colnames(flint_data)[6] <- 'Copper_ppb'

flint_data$Lead_ppb <- as.numeric(gsub(",","", flint_data$Lead_ppb))
flint_data$Copper_ppb <- as.numeric(gsub(",","", flint_data$Copper_ppb))

#new <- mutate(test,address = paste(Street.. , Street.Name,",", City, ", MICH", Zip.Code))


max_lead <- flint_data %>% 
            filter(max(Lead_ppb) == Lead_ppb) %>% 
            select(Date_Submitted, Lead_ppb)

max_copper <- flint_data %>% 
              filter(max(Copper_ppb) == Copper_ppb) %>% 
              select(Date_Submitted, Copper_ppb)
