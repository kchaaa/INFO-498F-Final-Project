library(dplyr)
library(gdata)

# setwd("/Users/chasekaylee/Desktop/info498f/INFO-498F-Final-Project")
#flint_data <- read.csv("/Users/Pema/info498f/INFO-498F-Final-Project/data/Test_Results_Flint.csv", stringsAsFactors = FALSE)
flint_data <- read.csv("data/Test_Results_Flint.csv", stringsAsFactors = FALSE)

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

# Change the variable Date_Submitted name to the actual month of each month's dataset
september_data <- month_select("9")
september_data$Date_Submitted <- "September"

october_data <- month_select("10")
october_data$Date_Submitted <- "October"

november_data <- month_select("11")
november_data$Date_Submitted <- "November"

december_data <- month_select("12")
december_data$Date_Submitted <- "December"

january_data <- month_select("1/")
january_data$Date_Submitted <- "January"

february_data <- month_select("2")
february_data$Date_Submitted <- "February"

march_data <- month_select("3")
february_data$Date_Submitted <- "March"

# Calculates the average for lead and copper for each month
avg_sep <- september_data %>% 
  mutate(avg = mean(Copper_ppb)) 

avg_oct <- october_data %>% 
  mutate(avg = mean(Copper_ppb)) 

avg_nov <- november_data %>% 
  mutate(avg = mean(Copper_ppb)) 

avg_dec <- december_data %>% 
  mutate(avg = mean(Copper_ppb)) 

avg_jan <- january_data %>% 
  mutate(avg = mean(Copper_ppb)) 

avg_feb <- february_data %>% 
  mutate(avg = mean(Copper_ppb)) 

avg_mar <- march_data %>% 
  mutate(avg = mean(Copper_ppb)) 

