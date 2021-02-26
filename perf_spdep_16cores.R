# Usage:
# Rscript perf_spdep.R
#
library(sf)
library(spdep)
options(digits.secs = 6)


CreateWeights <- function(file_path, dt){
  if (file_path=='./data/Chicago_parcels_points.shp') {
    coords <- st_centroid(st_geometry(dt))
    k <- knearneigh(coords, 10)
    nb <- knn2nb(k)
    w <- nb2listw(nb, style="W")
  } else {
    nb_q <- poly2nb(as(dt, "Spatial"))
    w <- nb2listw(nb_q, style="W", zero.policy=TRUE)
  }
  return(w)
}

RunLocalMoran <- function(file_path, variable_name) {
  dt <- st_read(file_path)

  print("weights creation")
  tm0 <-system.time(w <- CreateWeights(file_path, dt))
  print(tm0)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, '999', '16-cores'))
  tm3 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=999, zero.policy=TRUE))
  print(tm3)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, '999', '16-cores'))
  tm3 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=999, zero.policy=TRUE))
  print(tm3)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, '999', '16-cores'))
  tm3 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=999, zero.policy=TRUE))
  print(tm3)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, '9999', '16-cores'))
  tm6 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=9999, zero.policy=TRUE))
  print(tm6)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, '9999', '16-cores'))
  tm6 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=9999, zero.policy=TRUE))
  print(tm6)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, '9999', '16-cores'))
  tm6 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=9999, zero.policy=TRUE))
  print(tm6)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, '99999', '16-cores'))
  tm9 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=99999, zero.policy=TRUE))
  print(tm9)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, '99999', '16-cores'))
  tm9 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=99999, zero.policy=TRUE))
  print(tm9)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, '99999', '16-cores'))
  tm9 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=99999, zero.policy=TRUE))
  print(tm9)
}

RunLocalMoran("./data/natregimes.shp", "HR60")
RunLocalMoran("./data/us-sdoh-2014.shp", "ep_unem")
RunLocalMoran("./data/NYC_Area2010_2data.shp", "CE01_02")
RunLocalMoran("./data/Chicago_parcels_points.shp", "EstBuild")