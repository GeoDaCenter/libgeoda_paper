#!/usr/bin/env bash
echo "Test pyGeoDa local moran with Chicago_Parcels_Projected using permutation_method=complete"
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 9999 complete 1
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 9999 complete 8
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 99999 complete 8
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 99999 complete 1
echo "Test pyGeoDa local moran with Chicago_Parcels_Projected using permutation_method=lookup"
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 999 lookup 1
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 999 lookup 8
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 9999 lookup 1
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 9999 lookup 8
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 99999 lookup 8
python3 perf_pygeoda.py ../data/Chicago_parcels_projected.shp EstBuild 99999 lookup 1
