import pygeoda
import time
import sys

"""
Usage: 
python3 perf_pygeoda.py FILE_PATH VARIABLE_NAME PERMUTATIONS PERMUTATION_METHOD CPU_THREADS
"""
data_path = sys.argv[1]
var_name = sys.argv[2]
perms = int(sys.argv[3])
perm_method = sys.argv[4]
cpu_threads = int(sys.argv[5])

# prepare the data and weights
dt = pygeoda.open(data_path)
w_start_time = time.time()
if data_path == '../data/Chicago_parcels_projected.shp':
    w = pygeoda.weights.knn_weights(dt, 10)
else:
    w = pygeoda.weights.queen_weights(dt)
    print(w.GetNumObs())
w_run_time = time.time() - w_start_time
if cpu_threads==1:
    print("Weights creation took {0} seconds".format(w_run_time))
x = dt.GetRealCol(var_name)

# time it
times = []
for i in range(3):
    start_time = time.time()
    lisa = pygeoda.local_moran(w, x, permutations=perms, permutation_method=perm_method, cpu_threads=cpu_threads)
    run_time = time.time() - start_time
    times.append(run_time)

print("{0} {1} {2} {3}: avg {4} seconds".format(data_path, perms, perm_method, cpu_threads, sum(times)/3.0))
