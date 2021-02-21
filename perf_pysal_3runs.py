import sys
import libpysal as lps
import numpy as np
import geopandas as gpd
import esda
import time

"""
Usage: 
python3 perf_pysal.py FILE_PATH VARIABLE_NAME PERMUTATIONS CPU_THREADS
python3 perf_pysal.py ./data/natregimes.shp HR60 999 1
"""
data_path = sys.argv[1]
var_name = sys.argv[2]

np.random.seed(12345)


# prepare the data and weights
gdf = gpd.read_file(data_path)
x = gdf[var_name]

try:
    import numba
    print(f"Numba version installed: {numba.__version__}")
except:
    print("Numba not installed")

w_start_time = time.time()
if data_path == './data/Chicago_parcels_points.shp':
    w = lps.weights.KNN.from_dataframe(gdf, k=10)
    #w = lps.weights.KNN.from_shapefile(data_path, k=10)
    w_run_time1 = time.time() - w_start_time
else:
    w = lps.weights.Queen.from_dataframe(gdf)
    #w = lps.weights.Queen.from_shapefile(data_path)
    w_run_time1 = time.time() - w_start_time
    # remove islands
    if len(w.islands) > 0:
        print("Remove islands...")
        df_noi = gdf[~gdf.index.isin(w.islands)]
        w = lps.weights.w_subset(w, df_noi.index.tolist())
        x = df_noi[var_name]
w.transform = 'r'
w_run_time2 = time.time() - w_start_time

print("Weights creation took {0} seconds, with transform and remove islands it took {1} seconds".format(w_run_time1, w_run_time2))


for perms in [999,9999,99999]:
    times = []
    for i in range(3):
        # function to execute and time
        start_time = time.time()
        li = esda.moran.Moran_Local(x, w, permutations=perms, n_jobs=1, keep_simulations=False)
        run_time = time.time() - start_time
        times.append(run_time)

    print("{0} {1} {2}: {3} seconds".format(data_path, perms, 1, sum(times)/3.0))
