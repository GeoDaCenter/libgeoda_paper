library(spdep)
options(digits.secs = 6)

CreateWeights <- function(file_path, dt){
  if (file_path=='../data/Chicago_parcels_projected.shp') {
    k <- knearneigh(dt, 10)
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

RunLocalMoran <- function(file_path, variable_name, perm) {
  dt <- st_read(file_path)
  w <- CreateWeights(file_path, dt)


  set.coresOption(as.integer(8))
  print(c(file_path, variable_name, perm, '8-cores'))
  tm2 <- system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=perm, zero.policy=TRUE))
  print(tm2)

  set.coresOption(as.integer(16))
  print(c(file_path, variable_name, perm, '16-cores'))
  tm3 <-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=perm, zero.policy=TRUE))
  print(tm3)

  set.coresOption(NULL)
  print(c(file_path, variable_name, perm, 'no-core'))
  tm1<-system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=perm, zero.policy=TRUE))
  print(tm1)
}

RunLocalMoran("../data/Chicago_parcels_projected.shp", "EstBuild", 9999)