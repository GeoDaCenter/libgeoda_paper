#!/usr/bin/env bash
echo "Test pyGeoDa local moran with Natregimes using permutation_method=complete"
python perf_pygeoda.py ./data/natregimes.shp HR60 999 brutal-force 1
python perf_pygeoda.py ./data/natregimes.shp HR60 999 brutal-force 8
python perf_pygeoda.py ./data/natregimes.shp HR60 999 brutal-force 16
python perf_pygeoda.py ./data/natregimes.shp HR60 9999 brutal-force 1
python perf_pygeoda.py ./data/natregimes.shp HR60 9999 brutal-force 8
python perf_pygeoda.py ./data/natregimes.shp HR60 9999 brutal-force 16
python perf_pygeoda.py ./data/natregimes.shp HR60 99999 brutal-force 1
python perf_pygeoda.py ./data/natregimes.shp HR60 99999 brutal-force 8
python perf_pygeoda.py ./data/natregimes.shp HR60 99999 brutal-force 16
echo "Test pyGeoDa local moran with SDOH using permutation_method=complete"
python perf_pygeoda.py ./data/us-sdoh-2014.shp ep_unem 999 brutal-force 1
python perf_pygeoda.py ./data/us-sdoh-2014.shp ep_unem 999 brutal-force 8
python perf_pygeoda.py ./data/us-sdoh-2014.shp ep_unem 999 brutal-force 16
python perf_pygeoda.py ./data/us-sdoh-2014.shp ep_unem 9999 brutal-force 1
python perf_pygeoda.py ./data/us-sdoh-2014.shp ep_unem 9999 brutal-force 8
python perf_pygeoda.py ./data/us-sdoh-2014.shp ep_unem 9999 brutal-force 16
python perf_pygeoda.py ./data/us-sdoh-2014.shp ep_unem 99999 brutal-force 1
python perf_pygeoda.py ./data/us-sdoh-2014.shp ep_unem 99999 brutal-force 8
python perf_pygeoda.py ./data/us-sdoh-2014.shp ep_unem 99999 brutal-force 16
echo "Test pyGeoDa local moran with NYC using permutation_method=complete"
python perf_pygeoda.py ./data/NYC_Area2010_2data.shp CE01_02 999 brutal-force 1
python perf_pygeoda.py ./data/NYC_Area2010_2data.shp CE01_02 999 brutal-force 8
python perf_pygeoda.py ./data/NYC_Area2010_2data.shp CE01_02 999 brutal-force 16
python perf_pygeoda.py ./data/NYC_Area2010_2data.shp CE01_02 9999 brutal-force 1
python perf_pygeoda.py ./data/NYC_Area2010_2data.shp CE01_02 9999 brutal-force 8
python perf_pygeoda.py ./data/NYC_Area2010_2data.shp CE01_02 9999 brutal-force 16
python perf_pygeoda.py ./data/NYC_Area2010_2data.shp CE01_02 99999 brutal-force 1
python perf_pygeoda.py ./data/NYC_Area2010_2data.shp CE01_02 99999 brutal-force 8
python perf_pygeoda.py ./data/NYC_Area2010_2data.shp CE01_02 99999 brutal-force 16
echo "Test pyGeoDa local moran with Chicago_Parcels using permutation_method=complete
python perf_pygeoda.py ./data/Chicago_parcels_points.shp EstBuild 999 brutal-force 1
python perf_pygeoda.py ./data/Chicago_parcels_points.shp EstBuild 999 brutal-force 8
python perf_pygeoda.py ./data/Chicago_parcels_points.shp EstBuild 999 brutal-force 16
python perf_pygeoda.py ./data/Chicago_parcels_points.shp EstBuild 9999 brutal-force 1
python perf_pygeoda.py ./data/Chicago_parcels_points.shp EstBuild 9999 brutal-force 8
python perf_pygeoda.py ./data/Chicago_parcels_points.shp EstBuild 9999 brutal-force 16
python perf_pygeoda.py ./data/Chicago_parcels_points.shp EstBuild 99999 brutal-force 1
python perf_pygeoda.py ./data/Chicago_parcels_points.shp EstBuild 99999 brutal-force 8
python perf_pygeoda.py ./data/Chicago_parcels_points.shp EstBuild 99999 brutal-force 16"
