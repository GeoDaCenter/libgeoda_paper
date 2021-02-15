#!/usr/bin/env bash
echo "====Run spdep localmoran_perm using Natregimes"
Rscript perf_spdep.R ./data/natregimes.shp HR60 999 1
Rscript perf_spdep.R ./data/natregimes.shp HR60 999 8
Rscript perf_spdep.R ./data/natregimes.shp HR60 999 16
Rscript perf_spdep.R ./data/natregimes.shp HR60 9999 1
Rscript perf_spdep.R ./data/natregimes.shp HR60 9999 8
Rscript perf_spdep.R ./data/natregimes.shp HR60 9999 16
Rscript perf_spdep.R ./data/natregimes.shp HR60 99999 1
Rscript perf_spdep.R ./data/natregimes.shp HR60 99999 8
Rscript perf_spdep.R ./data/natregimes.shp HR60 99999 16
echo "====Run spdep localmoran_perm using SDOH "
Rscript perf_spdep.R ./data/us-sdoh-2014.shp ep_unem 999 1
Rscript perf_spdep.R ./data/us-sdoh-2014.shp ep_unem 999 8
Rscript perf_spdep.R ./data/us-sdoh-2014.shp ep_unem 999 16
Rscript perf_spdep.R ./data/us-sdoh-2014.shp ep_unem 9999 1
Rscript perf_spdep.R ./data/us-sdoh-2014.shp ep_unem 9999 8
Rscript perf_spdep.R ./data/us-sdoh-2014.shp ep_unem 9999 16
Rscript perf_spdep.R ./data/us-sdoh-2014.shp ep_unem 99999 1
Rscript perf_spdep.R ./data/us-sdoh-2014.shp ep_unem 99999 8
Rscript perf_spdep.R ./data/us-sdoh-2014.shp ep_unem 99999 16
echo "====Run spdep localmoran_perm using NYC "
Rscript perf_spdep.R ./data/NYC_Area2010_2data.shp CE01_02 999 1
Rscript perf_spdep.R ./data/NYC_Area2010_2data.shp CE01_02 999 8
Rscript perf_spdep.R ./data/NYC_Area2010_2data.shp CE01_02 999 16
Rscript perf_spdep.R ./data/NYC_Area2010_2data.shp CE01_02 9999 1
Rscript perf_spdep.R ./data/NYC_Area2010_2data.shp CE01_02 9999 8
Rscript perf_spdep.R ./data/NYC_Area2010_2data.shp CE01_02 9999 16
Rscript perf_spdep.R ./data/NYC_Area2010_2data.shp CE01_02 99999 1
Rscript perf_spdep.R ./data/NYC_Area2010_2data.shp CE01_02 99999 8
Rscript perf_spdep.R ./data/NYC_Area2010_2data.shp CE01_02 99999 16
echo "====Run spdep localmoran_perm using Chicago_Parcels "
Rscript perf_spdep.R ./data/Chicago_parcels_points.shp EstBuild 999 1
Rscript perf_spdep.R ./data/Chicago_parcels_points.shp EstBuild 999 8
Rscript perf_spdep.R ./data/Chicago_parcels_points.shp EstBuild 999 16
Rscript perf_spdep.R ./data/Chicago_parcels_points.shp EstBuild 9999 1
Rscript perf_spdep.R ./data/Chicago_parcels_points.shp EstBuild 9999 8
Rscript perf_spdep.R ./data/Chicago_parcels_points.shp EstBuild 9999 16
Rscript perf_spdep.R ./data/Chicago_parcels_points.shp EstBuild 99999 1
Rscript perf_spdep.R ./data/Chicago_parcels_points.shp EstBuild 99999 8
Rscript perf_spdep.R ./data/Chicago_parcels_points.shp EstBuild 99999 16
