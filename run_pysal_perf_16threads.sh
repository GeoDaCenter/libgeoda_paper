#!/usr/bin/env bash
echo "export OPENBLAS_NUM_THREADS=16"
export OPENBLAS_NUM_THREADS=16
echo "Test pysal local moran with Natregimes without Numba"
python perf_pysal_3runs.py ./data/natregimes.shp HR60
echo "Test pysal local moran with SDOH without Numba"
python perf_pysal_3runs.py ./data/us-sdoh-2014.shp ep_unem
echo "Test pysal local moran with NYC without Numba"
python perf_pysal_3runs.py ./data/NYC_Area2010_2data.shp CE01_02
echo "Test pysal local moran with Chicago_Parcels without Numba"
python perf_pysal_3runs.py ./data/Chicago_parcels_points.shp EstBuild
