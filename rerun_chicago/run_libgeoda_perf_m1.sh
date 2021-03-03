#!/usr/bin/env bash
echo "Test libgeoda C++ local moran-complete with Chicago_Parcels_projected"
./perf_libgeoda_m1 ../data/Chicago_parcels_projected.shp EstBuild complete
echo "Test libgeoda C++ local moran-lookup with Chicago_Parcels_projected"
./perf_libgeoda_m1 ../data/Chicago_parcels_projected.shp EstBuild lookup
