#!/usr/bin/env bash
echo "Test pysal local moran with Natregimes with Numba"
python perf_pysal.py ./data/natregimes.shp HR60 999 1 
python perf_pysal.py ./data/natregimes.shp HR60 999 8 
python perf_pysal.py ./data/natregimes.shp HR60 999 16 
python perf_pysal.py ./data/natregimes.shp HR60 9999 1 
python perf_pysal.py ./data/natregimes.shp HR60 9999 8 
python perf_pysal.py ./data/natregimes.shp HR60 9999 16 
python perf_pysal.py ./data/natregimes.shp HR60 99999 1 
python perf_pysal.py ./data/natregimes.shp HR60 99999 8 
python perf_pysal.py ./data/natregimes.shp HR60 99999 16 
echo "Test pysal local moran with SDOH with Numba"
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 999 1 
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 999 8 
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 999 16 
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 9999 1 
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 9999 8 
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 9999 16 
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 99999 1 
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 99999 8 
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 99999 16
echo "Test pysal local moran with NYC with Numba"
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 999 1
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 999 8
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 999 16
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 9999 1
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 9999 8
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 9999 16
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 99999 1
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 99999 8
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 99999 16
echo "Test pysal local moran with Chicago_Parcels with Numba"
python perf_pysal.py ./data/Chicago_parcels_points.shp CE01_02 999 1
python perf_pysal.py ./data/Chicago_parcels_points.shp CE01_02 999 8
python perf_pysal.py ./data/Chicago_parcels_points.shp CE01_02 999 16
python perf_pysal.py ./data/Chicago_parcels_points.shp CE01_02 9999 1
python perf_pysal.py ./data/Chicago_parcels_points.shp CE01_02 9999 8
python perf_pysal.py ./data/Chicago_parcels_points.shp CE01_02 9999 16
python perf_pysal.py ./data/Chicago_parcels_points.shp CE01_02 99999 1
python perf_pysal.py ./data/Chicago_parcels_points.shp CE01_02 99999 8
python perf_pysal.py ./data/Chicago_parcels_points.shp CE01_02 99999 16
