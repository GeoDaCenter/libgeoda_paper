#!/usr/bin/env bash
echo "export OPENBLAS_NUM_THREADS=1"
export OPENBLAS_NUM_THREADS=1
echo "Test pysal local moran with Natregimes without Numba"
python perf_pysal.py ./data/natregimes.shp HR60 999 1
python perf_pysal.py ./data/natregimes.shp HR60 9999 1
python perf_pysal.py ./data/natregimes.shp HR60 99999 1
echo "Test pysal local moran with SDOH without Numba"
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 999 1 
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 9999 1
python perf_pysal.py ./data/us-sdoh-2014.shp ep_unem 99999 1
echo "Test pysal local moran with NYC without Numba"
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 999 1
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 9999 1
python perf_pysal.py ./data/NYC_Area2010_2data.shp CE01_02 99999 1
echo "Test pysal local moran with Chicago_Parcels without Numba"
python perf_pysal.py ./data/Chicago_parcels_points.shp EstBuild 999 1
python perf_pysal.py ./data/Chicago_parcels_points.shp EstBuild 9999 1
python perf_pysal.py ./data/Chicago_parcels_points.shp EstBuild 99999 1
