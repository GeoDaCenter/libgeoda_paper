# Usage:
# Rscript perf_rgeoda.R ./data/natregimes.shp HR60 999 complete 1
# Rscript perf_rgeoda.R ./data/natregimes.shp HR60 999 lookup 8
#
library(rbenchmark)
library(rgeoda)
library(sf)

options(digits.secs = 6)
args = commandArgs(trailingOnly=TRUE)
file_path <- args[1]
variable_name <- args[2]
perms <- as.integer(args[3])
perm_method <- args[4]
cpu_threads <- as.integer(args[5])

dt <- st_read(file_path)
if (file_path=='../data/Chicago_parcels_projected.shp') {
    w <- knn_weights(dt, 10)
} else {
    w <- queen_weights(dt)
}
args
# run the local_moran() 3 times
tm <- benchmark(lm<-local_moran(w, dt[variable_name], permutations=perms, permutation_method=perm_method, cpu_threads=cpu_threads), replications=3)
tm
