#!/usr/bin/env bash
echo "Test libgeoda C++ local moran-lookup-table with Natregimes"
./perf_libgeoda ./data/natregimes.shp HR60 lookup-table
echo "Test libgeoda C++ local moran with SDOH"
./perf_libgeoda ./data/us-sdoh-2014.shp ep_unem lookup-table
echo "Test libgeoda C++ local moran-lookup-table with NYC"
./perf_libgeoda ./data/NYC_Area2010_2data.shp CE01_02 lookup-table
echo "Test libgeoda C++ local moran-lookup-table with Chicago_Parcels"
./perf_libgeoda ./data/Chicago_parcels_points.shp EstBuild lookup-table
