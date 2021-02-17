#!/usr/bin/env bash
echo "====Run rgeoda local_moran using Natregimes and permutation_method=complete"
Rscript perf_rgeoda.R ./data/natregimes.shp HR60 999 brutal-force 1
Rscript perf_rgeoda.R ./data/natregimes.shp HR60 999 brutal-force 8
Rscript perf_rgeoda.R ./data/natregimes.shp HR60 999 brutal-force 16
Rscript perf_rgeoda.R ./data/natregimes.shp HR60 9999 brutal-force 1
Rscript perf_rgeoda.R ./data/natregimes.shp HR60 9999 brutal-force 8
Rscript perf_rgeoda.R ./data/natregimes.shp HR60 9999 brutal-force 16
Rscript perf_rgeoda.R ./data/natregimes.shp HR60 99999 brutal-force 1
Rscript perf_rgeoda.R ./data/natregimes.shp HR60 99999 brutal-force 8
Rscript perf_rgeoda.R ./data/natregimes.shp HR60 99999 brutal-force 16
echo "====Run rgeoda local_moran using SDOH and permutation_method=complete"
Rscript perf_rgeoda.R ./data/us-sdoh-2014.shp ep_unem 999 brutal-force 1
Rscript perf_rgeoda.R ./data/us-sdoh-2014.shp ep_unem 999 brutal-force 8
Rscript perf_rgeoda.R ./data/us-sdoh-2014.shp ep_unem 999 brutal-force 16
Rscript perf_rgeoda.R ./data/us-sdoh-2014.shp ep_unem 9999 brutal-force 1
Rscript perf_rgeoda.R ./data/us-sdoh-2014.shp ep_unem 9999 brutal-force 8
Rscript perf_rgeoda.R ./data/us-sdoh-2014.shp ep_unem 9999 brutal-force 16
Rscript perf_rgeoda.R ./data/us-sdoh-2014.shp ep_unem 99999 brutal-force 1
Rscript perf_rgeoda.R ./data/us-sdoh-2014.shp ep_unem 99999 brutal-force 8
Rscript perf_rgeoda.R ./data/us-sdoh-2014.shp ep_unem 99999 brutal-force 16
echo "====Run rgeoda local_moran using NYC and permutation_method=complete"
Rscript perf_rgeoda.R ./data/NYC_Area2010_2data.shp CE01_02 999 brutal-force 1
Rscript perf_rgeoda.R ./data/NYC_Area2010_2data.shp CE01_02 999 brutal-force 8
Rscript perf_rgeoda.R ./data/NYC_Area2010_2data.shp CE01_02 999 brutal-force 16
Rscript perf_rgeoda.R ./data/NYC_Area2010_2data.shp CE01_02 9999 brutal-force 1
Rscript perf_rgeoda.R ./data/NYC_Area2010_2data.shp CE01_02 9999 brutal-force 8
Rscript perf_rgeoda.R ./data/NYC_Area2010_2data.shp CE01_02 9999 brutal-force 16
Rscript perf_rgeoda.R ./data/NYC_Area2010_2data.shp CE01_02 99999 brutal-force 1
Rscript perf_rgeoda.R ./data/NYC_Area2010_2data.shp CE01_02 99999 brutal-force 8
Rscript perf_rgeoda.R ./data/NYC_Area2010_2data.shp CE01_02 99999 brutal-force 16
echo "====Run rgeoda local_moran using Chicago_Parcels and permutation_method=complete"
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 999 brutal-force 1
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 999 brutal-force 8
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 999 brutal-force 16
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 9999 brutal-force 1
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 9999 brutal-force 8
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 9999 brutal-force 16
echo "Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 99999 brutal-force 1
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 99999 brutal-force 8
Rscript perf_rgeoda.R ./data/Chicago_parcels_points.shp EstBuild 99999 brutal-force 16"
