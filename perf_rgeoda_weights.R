# NOTE: this script is used to run weights creation in rgeoda again after
# updating the logic of code that not copying whole data.frame table into 
# the internal structure used by rgeoda.
#
#
library(rgeoda)
library(sf)
library(rbenchmark)
options(digits.secs = 6)

CreateWeights <- function(file_path) {
  dt <- st_read(file_path)
  if (file_path=='./data/Chicago_parcels_points.shp') {
    tm0 <- system.time(w <- knn_weights(dt, 10))
    tm0
  } else {
    tm0 <- system.time(w <- queen_weights(dt))
    tm0
  }
}

CreateWeights("./data/natregimes.shp")
CreateWeights("./data/us-sdoh-2014.shp")
CreateWeights("./data/NYC_Area2010_2data.shp")
CreateWeights("./data/Chicago_parcels_points.shp")