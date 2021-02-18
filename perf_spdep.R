# Usage:
# Rscript perf_spdep.R ./data/natregimes.shp HR60 999 1
# Rscript perf_spdep.R ./data/natregimes.shp HR60 999 8
#
library(sf)
library(spdep)
options(digits.secs = 6)

args = commandArgs(trailingOnly=TRUE)
file_path <- args[1]
variable_name <- args[2]
perms <- as.integer(args[3])
cpu_threads <- as.integer(args[4])

dt <- st_read(file_path)
if (file_path=='./data/Chicago_parcels_points.shp') {
    coords <- st_centroid(st_geometry(dt))
    k <- knearneigh(coords, 10)
    nb <- knn2nb(k)
    w <- nb2listw(nb, style="W")
} else {
    nb_q <- poly2nb(as(dt, "Spatial"))
    w <- nb2listw(nb_q, style="W", zero.policy=TRUE)
}
if (cpu_threads > 1) {
    set.coresOption(as.integer(cpu_threads/2)) # 1 core = 2 threads
}
args
system.time(lm <- localmoran_perm(dt[[variable_name]], listw=w, alternative="two.sided", nsim=perms, zero.policy=TRUE))
