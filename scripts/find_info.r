# Requires dplyr library
library(dplyr)

# 
find_max <- function(dataset, column) {
  return(dataset %>% 
                filter(max(column) == column))

}


# 
is_above_epa <- function(column) {
  bad_epa <- data %>% 
              filter(column > 15)
  return(bad_epa)
}