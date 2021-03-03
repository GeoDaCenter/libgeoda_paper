#!/usr/bin/env bash
echo "====Run rgeoda local_moran using Chicago_Parcels and permutation_method=complete
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 999 complete 1
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 999 complete 8
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 999 complete 16
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 9999 complete 1
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 9999 complete 8
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 9999 complete 16
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 99999 complete 1
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 99999 complete 8
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 99999 complete 16"
echo "====Run rgeoda local_moran using Chicago_Parcels and permutation_method=lookup"
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 999 lookup 1
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 999 lookup 8
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 999 lookup 16
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 9999 lookup 1
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 9999 lookup 8
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 9999 lookup 16
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 99999 lookup 1
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 99999 lookup 8
Rscript perf_rgeoda.R ../data/Chicago_parcels_projected.shp EstBuild 99999 lookup 16
