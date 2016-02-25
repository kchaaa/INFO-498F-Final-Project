# This will allow access to Yelp's dataset.

# Require jsonlite, httr, and httpuv
library(jsonlite)
library(httr)
library(httpuv)

# Keys and Tokens to access the data for Yelp.
consumer_key <- "xxxx" # Add your consumer key.
consumer_secret <- "xxxx" # instAdd your secret consumer key.
token <- "xxxx" # Add your token
token_secret <- "xxxx" # Add your secret token.

# Authroization for Yelp.
myapp <- oauth_app("YELP", key = consumer_key, secret = consumer_secret)
sig <- sign_oauth1.0(myapp, token = token,token_secret = token_secret)

# Choose how much information gets returned.
limit <- 10

# Choose which city to obtain information about.
city <- 'Seattle'

# The state the city is located in.
state <- 'WA'

# Choose which term to search for ie restaurants, food, Starkbucks, etc.
term <- 'restaurants'

# URL to obtain data from.
yelpurl <- paste0("http://api.yelp.com/v2/search/?limit=",limit,"&location=", city, "%20", state, "&term=", term)

# Gets the data from the URL.
locationdata=GET(yelpurl, sig)
locationdataContent = content(locationdata)
locationdataList=jsonlite::fromJSON(toJSON(locationdataContent))

# Creates the dataset.
data <- head(data.frame(locationdataList))
