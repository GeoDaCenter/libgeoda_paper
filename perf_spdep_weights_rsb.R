library(spdep)
options(digits.secs = 6)

Run_wts <- function(file_path) {
  dt <- st_read(file_path)
  cat("weights creation", file_path, "\n")
  tm0 <-system.time(w <- CreateWeights(file_path, dt))
  print(tm0)
}

CreateWeights <- function(file_path, dt){
  if (file_path=='./data/Chicago_parcels_projected.shp') {
#    coords <- st_centroid(st_geometry(dt))
    tdt <- st_transform(dt, "EPSG:3435")
    k <- knearneigh(tdt, 10)
    nb <- knn2nb(k)
    w <- nb2listw(nb, style="W")
  } else {
# using an sf equivalent of rgeos::gUnarySTRtreeQuery()
#    fB1 <- st_intersects(st_as_sfc(lapply(st_geometry(dt),
#        function(x) {st_as_sfc(st_bbox(x))[[1]]})))
#    fB1a <- lapply(seq_along(fB1), function(i) fB1[[i]][fB1[[i]] > i])
#    fB1a <- fB1a[-length(fB1a)]
#    nb_q <- poly2nb(dt, queen=TRUE, foundInBox=fB1a)
# this code now inside poly2nb() and used if foundInBox=NULL and geometry
# count >= 500 (https://github.com/r-spatial/spdep/commit/ef833665b28b48a2bcb724164eba7b55c15f5467)
    nb_q <- poly2nb(dt, queen=TRUE)
    w <- nb2listw(nb_q, style="W", zero.policy=TRUE)
  }
  return(w)
}

Run_wts('./data/Chicago_parcels_projected.shp') # 20s
Run_wts('./data/natregimes.shp') # 1s
Run_wts('./data/NYC_Area2010_2data.shp') # 35s
Run_wts('./data/us-sdoh-2014.shp') # 28s