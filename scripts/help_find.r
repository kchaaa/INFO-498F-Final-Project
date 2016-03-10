require(ggplot2)
require(ggmap)
require(maps)

flint_sample <- read.csv("/Users/Pema/info498f/INFO-498F-Final-Project/data/Flint-SAMPLES-Final.csv")
qmap('Flint', maptype = 'terrain')
