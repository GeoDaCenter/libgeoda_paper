#!/usr/bin/env bash
echo "Test libgeoda C++ local moran-lookup-table with Natregimes"
./perf_libgeoda_m1 ./data/natregimes.shp HR60 lookup-table
echo "Test libgeoda C++ local moran with SDOH"
./perf_libgeoda_m1 ./data/us-sdoh-2014.shp ep_unem lookup-table
echo "Test libgeoda C++ local moran-lookup-table with NYC"
./perf_libgeoda_m1 ./data/NYC_Area2010_2data.shp CE01_02 lookup-table
echo "Test libgeoda C++ local moran-lookup-table with Chicago_Parcels"
./perf_libgeoda_m1 ./data/Chicago_parcels_points.shp EstBuild lookup-table
