#!/usr/bin/env bash
echo "====Run rgeoda local_moran using Chicago_Parcels and permutation_method=complete"
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 99999 brutal-force 1
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 99999 brutal-force 8
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 99999 brutal-force 16
