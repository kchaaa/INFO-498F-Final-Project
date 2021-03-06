require(ggplot2)
require(ggmap)
require(maps)
require(mapproj)
require(sp)

# Reads in the dataset.
# May need to input whole directory to work.
filter_data <- read.csv("data/Flint_Water_Filter_Locations.csv")
#filter_data <- read.csv("data/Flint_Water_Filter_Locations.csv")

# Gets the terrain map of Flint, Michigan
map <- qmap('Flint', zoom = 12, maptype = 'terrain')

# Converts the data of both lat/long from characters to numeric
coords <- cbind(Longitude = as.numeric(as.character(filter_data$Longitude)), Latitude = as.numeric(as.character(filter_data$Latitude)))

# Adds the points of the location of the water filters
get_filter_map <- map + geom_point(data = filter_data, aes(filter_data$Latitude, filter_data$Longitude), color = "darkblue", size = 10, alpha = 0.8, na.rm = TRUE)
