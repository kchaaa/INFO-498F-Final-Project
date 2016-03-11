library(dplyr)
library(gdata)

# May need to input whole directory to work.
# setwd("/Users/chasekaylee/Desktop/info498f/INFO-498F-Final-Project")
#flint_data <- read.csv("/Users/Pema/info498f/INFO-498F-Final-Project/data/Test_Results_Flint.csv", stringsAsFactors = FALSE)
flint_data <- read.csv("data/Test_Results_Flint.csv", stringsAsFactors = FALSE)
#flint_data <-read.csv("C:/Users/Kevin Cha/Documents/info498f/Info-498F-Final-Project/data/Test_Results_Flint.csv", stringsAsFactors = FALSE)

# Renames 3 of the columns to be more readable
colnames(flint_data)[2] <- 'Date_Submitted'
colnames(flint_data)[4] <- 'Lead_ppb'
colnames(flint_data)[6] <- 'Copper_ppb'

flint_data$Lead_ppb <- as.numeric(gsub(",","", flint_data$Lead_ppb))
flint_data$Copper_ppb <- as.numeric(gsub(",","", flint_data$Copper_ppb))

# new <- mutate(test,address = paste(Street.. , Street.Name,",", City, ", MICH", Zip.Code))
flint_data$Lead_ppb <- as.integer(flint_data$Lead_ppb)

max_lead <- flint_data %>% 
            filter(max(Lead_ppb) == Lead_ppb) %>% 
            select(Date_Submitted, Lead_ppb)

max_copper <- flint_data %>% 
              filter(max(Copper_ppb) == Copper_ppb) %>% 
              select(Date_Submitted, Copper_ppb)

# Function that will return a data frame of the Lead and Copper levels based on the Month
month_select <- function(month, name) {
                flint_data %>% 
                filter(startsWith(Date_Submitted,  month)) %>% 
                select(Date_Submitted, Lead_ppb, Copper_ppb)
}

# Function that gets the specific month's data
month_data <- function(month_number) {
              month_select(month_number)
}

# Function that calculates the average copper level for each month
get_copper_average <- function(data_month) {
                      data_month %>% 
                      mutate(copper_avg = mean(Copper_ppb))
}

# Function that calculates the average for lead for each month
get_lead_average <- function(data_month) {
                    data_month %>% 
                    mutate(lead_avg = mean(Lead_ppb))
}

# Uses the function above and puts it into the function below
avg <- function(month) {
        obj1 <- month_select(month)
        lead <- get_lead_average(obj1)
        return(lead)
}

avg_sep <- avg("9")
avg_sep$Date_Submitted <- "Sep"

avg_oct <- avg("10")
avg_oct$Date_Submitted <- "Oct"

avg_nov <- avg("11")
avg_nov$Date_Submitted <- "Nov"

avg_dec <- avg("12")
avg_dec$Date_Submitted <- "Dec"

avg_jan <- avg("1/")
avg_jan$Date_Submitted <- "Jan"

avg_feb <- avg("2")
avg_feb$Date_Submitted <- "Feb"

avg_mar <- avg("3")
avg_mar$Date_Submitted <- "Mar"

# Finds the number of houses that are below 5 ppb
safe_level <- function(data) {
  return(data %>% filter(Lead_ppb < 5) %>% group_by(Date_Submitted)
  %>% summarise(Safe_houses=sum(Date_Submitted==Date_Submitted)))  
}

# Finds the number of houses that are between 5 and 15 ppb
warning_level <- function(data) {
  return(data %>% filter(Lead_ppb > 5, Lead_ppb < 15) %>% group_by(Date_Submitted)
         %>% summarise(Warning_houses=sum(Date_Submitted==Date_Submitted)))  
}

# Finds the number of houses that are above 15 ppb
danger_level <- function(data) {
  return(data %>% filter(Lead_ppb > 15) %>% group_by(Date_Submitted)
         %>% summarise(Danger_houses=sum(Date_Submitted==Date_Submitted)))  
}

# Combines safe, warning, and danger levels into one dataframe
level <- function(data) {
  safe <- safe_level(data)
  warning <- warning_level(data)
  danger <- danger_level(data)
  month_level <- left_join(safe, warning)
  month_final <- left_join(month_level, danger)
  return(month_final)
}

sep <- level(avg_sep)
oct <- level(avg_oct)
nov <- level(avg_nov)
dec <- level(avg_dec)
jan <- level(avg_jan)
feb <- level(avg_feb)
mar <- level(avg_mar)

total <- rbind(sep, oct, nov, dec, jan, feb, mar)
total <- as.data.frame(total)
