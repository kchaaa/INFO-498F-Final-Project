
#--------------------------------------------------------------#
# Flint, MI has a water problem. 

# Requires dplyr, library
library(dplyr)
library(knitr)

# Import helper scripts.
#source('C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/scripts/help_find.r')
#source('C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/scripts/plot.r')
#source('C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/scripts/test_results.r')
#--------------------------------------------------------------#
# This dataset only deals with 271 households and contains flushing test data
# Reads in the dataset.
data <- read.csv('C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/data/Flint-Samples-FINAL.csv')
data <- data[-c(91),]

# Renames 3 of the columns to be more readable
colnames(data)[4] <- 'First_Draw'
colnames(data)[5] <- 'Flushing_45_Sec'
colnames(data)[6] <- 'Flushing_2_Min'

#--------------------------------------------------------------#

# This data set contains the amount of ppb of lead and copper for each samples house
flint_data <- read.csv("C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/data/Test_Results_Flint.csv", stringsAsFactors = FALSE)

# Renames 3 of the columns to be more readable
colnames(flint_data)[2] <- 'Date_Submitted'
colnames(flint_data)[4] <- 'Lead_ppb'
colnames(flint_data)[6] <- 'Copper_ppb'

flint_data$Lead_ppb <- as.numeric(gsub(",","", flint_data$Lead_ppb))
flint_data$Copper_ppb <- as.numeric(gsub(",","", flint_data$Copper_ppb))
#--------------------------------------------------------------#

# This section finds the max levels of lead (ppb).

# Obtains the households with the highest level of lead (ppb) from the first sample.
max_first_draw <- data %>% 
  filter(max(First_Draw) == First_Draw) %>% 
  select(Ward, First_Draw)

# Obtains the households with the highest level of lead (ppb) from the sample 45 seconds after flushing.
max_45_sec <- data %>% 
  filter(max(Flushing_45_Sec) == Flushing_45_Sec) %>% 
  select(Ward, Flushing_45_Sec)

# Obtains the households with the highest level of lead (ppb) from the sample 2 minutes after flushing.
max_2_min <- data %>% 
  filter(max(Flushing_2_Min) == Flushing_2_Min) %>% 
  select(Ward, Flushing_2_Min)

#--------------------------------------------------------------#
# This section checks which households tested below worrisome level (0-5ppb)

# Obtains the households with ppb levels that are deemed acceptable by the EPA (0-5ppb) for the first sample.
safe_first_draw <- data %>% 
  filter(First_Draw < 5)

# Counts the number of households that are deemed acceptable by the EPA (0-5ppb) for the first sample.
safe_first_num <- safe_first_draw %>% 
  group_by(Ward) %>% summarise(First_Draw=sum(Ward==Ward))

# Obtains the households with ppb levels that are deemed acceptable by the EPA (0-5ppb) for the sample 45 seconds after flushing.
safe_45_sec <- data %>% 
  filter(Flushing_45_Sec < 5)

# Counts the number of households that are deemed acceptable by the EPA (0-5ppb) for the sample 45 seconds after flushing.
safe_45sec_num <- safe_45_sec %>% 
  group_by(Ward) %>% 
  summarise(Flushing_45_Sec=sum(Ward==Ward))

# Obtains the households with ppb levels that are deemed acceptable by the EPA (0-5ppb) for the sample 2 minutes after flushing.
safe_2_min <- data %>% 
  filter(Flushing_2_Min < 5)

# Counts the number of households that are deemed acceptable by the EPA (0-5ppb) for the sample 2 minutes after flushing.
safe_2min_num <- safe_2_min %>% 
  group_by(Ward) %>% 
  summarise(Flushing_2_Min=sum(Ward==Ward))

# Combines the households that have high ppb levels for all 3 samples.
safe_levels <- inner_join(safe_2_min, safe_45_sec, by = c('SampleID', 'Zip.Code', 'Ward', 'First_Draw', 'Flushing_45_Sec', 'Flushing_2_Min', 'Notes'), copy=FALSE)

safe_levels <- inner_join(safe_levels, safe_first_draw, by = c('SampleID', 'Zip.Code', 'Ward', 'First_Draw', 'Flushing_45_Sec', 'Flushing_2_Min', 'Notes'), copy=FALSE)

# Creates a dataframe that counts the number of houses that are in the safe zone for each sample tests.
safe_num <- left_join(safe_first_num, safe_45sec_num)

safe_num <- left_join(safe_num, safe_2min_num)

safe_num[is.na(safe_num)] <- 0

safe_num <- as.data.frame(safe_num)

#--------------------------------------------------------------#
# This section checks which households contain a relatively safe, but dangerous level of led in the water (5 ppb-15 ppb).

# Obtains the households with ppb levels that are relatively safe, but dangerous level of led in the water (5 ppb-15 ppb) for the first draw samples.
warning_first_draw <- data %>% 
  filter(First_Draw > 5, First_Draw < 15)

# Counts the number of households 
warning_first_num <- warning_first_draw %>% 
  group_by(Ward) %>% 
  summarise(First_Draw=sum(Ward==Ward))

# Obtains the households with ppb levels that are relatively safe, but dangerous level of led in the water (5 ppb-15 ppb) for the samples 45 seconds after flushing.
warning_45_sec <- data %>% 
  filter(Flushing_45_Sec > 5, Flushing_45_Sec < 15)

# Counts the number of households with ppb levels that are relatively safe, but dangerous level of led in the water (5 ppb-15 ppb) for the samples 45 seconds after flushing.
warning_45sec_num <- warning_45_sec %>% 
  group_by(Ward) %>% 
  summarise(Flushing_45_Sec=sum(Ward==Ward))

# Obtains the households with ppb levels that are relatively safe, but dangerous level of led in the water (5 ppb-15 ppb) for the samples 2 minutes after flushing.
warning_2_min <- data %>% 
  filter(Flushing_2_Min > 5, Flushing_2_Min < 15)

# Counts the number of households with ppb levels that are relatively safe, but dangerous level of led in the water (5 ppb-15 ppb) for the samples 2 minutes after flushing.
warning_2min_num <- warning_2_min %>% 
  group_by(Ward) %>% 
  summarise(Flushing_2_Min=sum(Ward==Ward))

# Combines the households that have relatively safe, but dangerous ppb levels for all 3 samples.
warning_levels <- inner_join(warning_2_min, warning_45_sec, by = c('SampleID', 'Zip.Code', 'Ward', 'First_Draw', 'Flushing_45_Sec', 'Flushing_2_Min', 'Notes'), copy=FALSE)

warning_levels <- inner_join(warning_levels, warning_first_draw, by = c('SampleID', 'Zip.Code', 'Ward', 'First_Draw', 'Flushing_45_Sec', 'Flushing_2_Min', 'Notes'), copy=FALSE)

# Creates a dataframe that counts the number of houses that have relatively safe, but still dangerous ppb levels for each sample tests.
warning_num <- left_join(warning_first_num, warning_45sec_num)

warning_num <- left_join(warning_num, warning_2min_num)

warning_num[is.na(warning_num)] <- 0

warning_num <- as.data.frame(warning_num)

#--------------------------------------------------------------#
# This section checks which households tested above the EPA allowed level of led (15ppb). This is when action is necessary.

# Obtains the households with ppb levels above the EPA allowed level (15ppb) for the first sample.
above_epa_first_draw <- data %>% 
  filter(First_Draw > 15)

# Counts the households with ppb levels above the EPA allowed level (15ppb) for the first sample.
above_first_num <- above_epa_first_draw %>% 
  group_by(Ward) %>% 
  summarise(First_Draw=sum(Ward==Ward))

# Obtains the households with ppb levels above the EPA allowed level (15ppb) for the sample 45 seconds after flushing.
above_epa_45_sec <- data %>% 
  filter(Flushing_45_Sec > 15)

# Counts the households with ppb levels above the EPA allowed level (15ppb) for the first sample.
above_45sec_num <- above_epa_45_sec %>% 
  group_by(Ward) %>% 
  summarise(Flushing_45_Sec=sum(Ward==Ward))

# Obtains the households with ppb levels above the EPA allowed level (15ppb) for the sample 2 minutes after flushing.
above_epa_2_min <- data %>% 
  filter(Flushing_2_Min > 15)

# Counts the households with ppb levels above the EPA allowed level (15ppb) for the first sample.
above_2min_num <- above_epa_2_min %>% 
  group_by(Ward) %>% 
  summarise(Flushing_2_Min=sum(Ward==Ward))

# Combines the households that have high ppb levels for all 3 samples.
above_epa <- inner_join(above_epa_2_min, above_epa_45_sec, by = c('SampleID', 'Zip.Code', 'Ward', 'First_Draw', 'Flushing_45_Sec', 'Flushing_2_Min', 'Notes'), copy=FALSE)

above_epa <- inner_join(above_epa, above_epa_first_draw, by = c('SampleID', 'Zip.Code', 'Ward', 'First_Draw', 'Flushing_45_Sec', 'Flushing_2_Min', 'Notes'), copy=FALSE)

# Creates a dataframe that counts the number of houses that have dangerous levels of lead in their water for each sample tests.
above_num <- left_join(above_first_num, above_45sec_num)

above_num  <- left_join(above_num, above_2min_num)

above_num[is.na(above_num)] <- 0

above_num <- as.data.frame(above_num)

#--------------------------------------------------------------#
