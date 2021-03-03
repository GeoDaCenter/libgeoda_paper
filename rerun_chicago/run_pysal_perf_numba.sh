#!/usr/bin/env bash
echo "export OPENBLAS_NUM_THREADS=1"
export OPENBLAS_NUM_THREADS=1
echo "Test pysal local moran with Chicago_Parcels with Numba"
python perf_pysal_numba.py ../data/Chicago_parcels_projected.shp EstBuild 999 1
python perf_pysal_numba.py ../data/Chicago_parcels_projected.shp EstBuild 9999 1
python perf_pysal_numba.py ../data/Chicago_parcels_projected.shp EstBuild 99999 1
python perf_pysal_numba.py ../data/Chicago_parcels_projected.shp EstBuild 999 8
python perf_pysal_numba.py ../data/Chicago_parcels_projected.shp EstBuild 9999 8
python perf_pysal_numba.py ../data/Chicago_parcels_projected.shp EstBuild 99999 8
python perf_pysal_numba.py ../data/Chicago_parcels_projected.shp EstBuild 999 16
python perf_pysal_numba.py ../data/Chicago_parcels_projected.shp EstBuild 9999 16
python perf_pysal_numba.py ../data/Chicago_parcels_projected.shp EstBuild 99999 16
