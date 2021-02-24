#!/usr/bin/env bash
echo "Test libgeoda C++ local moran-complete with Natregimes"
./perf_libgeoda_m1 ./data/natregimes.shp HR60 complete
echo "Test libgeoda C++ local moran with SDOH"
./perf_libgeoda_m1 ./data/us-sdoh-2014.shp ep_unem complete
echo "Test libgeoda C++ local moran-complete with NYC"
./perf_libgeoda_m1 ./data/NYC_Area2010_2data.shp CE01_02 complete
echo "Test libgeoda C++ local moran-complete with Chicago_Parcels"
./perf_libgeoda_m1 ./data/Chicago_parcels_points.shp EstBuild complete
