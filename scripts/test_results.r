library(dplyr)
library(gdata)

#setwd("/Users/chasekaylee/Desktop/info498f/INFO-498F-Final-Project")
flint_data <- read.csv("/Users/Pema/info498f/INFO-498F-Final-Project/data/Test_Results_Flint.csv", stringsAsFactors = FALSE)

# Renames 3 of the columns to be more readable
colnames(flint_data)[2] <- 'Date_Submitted'
colnames(flint_data)[4] <- 'Lead_ppb'
colnames(flint_data)[6] <- 'Copper_ppb'

flint_data$Lead_ppb <- as.numeric(gsub(",","", flint_data$Lead_ppb))
flint_data$Copper_ppb <- as.numeric(gsub(",","", flint_data$Copper_ppb))

#new <- mutate(test,address = paste(Street.. , Street.Name,",", City, ", MICH", Zip.Code))
flint_data$Lead_ppb <- as.integer(flint_data$Lead_ppb)

max_lead <- flint_data %>% 
            filter(max(Lead_ppb) == Lead_ppb) %>% 
            select(Date_Submitted, Lead_ppb)

max_copper <- flint_data %>% 
              filter(max(Copper_ppb) == Copper_ppb) %>% 
              select(Date_Submitted, Copper_ppb)

# Function that will return a data frame of the Lead and Copper levels based on the Month
month_select <- function(month) {
                flint_data %>% 
                filter(startsWith(Date_Submitted,  month)) %>% 
                select(Date_Submitted, Lead_ppb, Copper_ppb)
}


        