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
perms = int(sys.argv[3])
cpu_threads = int(sys.argv[4])

np.random.seed(12345)


# prepare the data and weights
gdf = gpd.read_file(data_path)
x = gdf[var_name]

try:
    import numba
    print(f"Numba version installed: {numba.__version__}")
except:
    print("Numba not installed")

if data_path == './data/Chicago_parcels_points.shp':
    w = lps.weights.KNN.from_dataframe(gdf, k=10)
else:
    w = lps.weights.Queen.from_dataframe(gdf)
    # remove islands
    if len(w.islands) > 0:
        print("Remove islands...")
        df_noi = gdf[~gdf.index.isin(w.islands)]
        w = lps.weights.w_subset(w, df_noi.index.tolist())
        x = df_noi[var_name]
w.transform = 'r'


# function to execute and time
times = []
j = 3
for i in range(j):
    start_time = time.time()
    li = esda.moran.Moran_Local(x, w, permutations=perms, n_jobs=cpu_threads, keep_simulations=False)
    run_time = time.time() - start_time
    times.append(run_time)

print("{0} {1} {2}: {3} seconds (average of 3 runs)".format(data_path, perms, cpu_threads, sum(times)/3.0))
