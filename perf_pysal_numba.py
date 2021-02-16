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


if data_path == './data/Chicago_parcels_points.shp':
    w = lps.weights.KNN.from_dataframe(gdf, k=10)
else:
    w = lps.weights.Queen.from_dataframe(gdf)
    # remove islands
    if len(w.islands) > 0:
        df_noi = gdf[~gdf.index.isin(w.islands)]
        w = lps.weights.w_subset(w, df_noi.index.tolist())
        x = df_noi[var_name]
w.transform = 'r'

# trigger numba to compile
test_ds = lps.examples.load_example("Nepal")
test = gpd.read_file(lps.examples.get_path("nepal.shp"))
c_w = lps.weights.Queen.from_dataframe(test)
c_w.transform = 'r'
esda.moran.Moran_Local(test["pcinc"], c_w, permutations=2, n_jobs=cpu_threads)


# function to execute and time
start_time = time.time()
li = esda.moran.Moran_Local(x, w, permutations=perms, n_jobs=cpu_threads)
run_time = time.time() - start_time

print("{0} {1} {2}: {3} seconds".format(data_path, perms, cpu_threads, run_time))
