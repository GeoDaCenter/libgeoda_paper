import pygeoda
import time

TEST_ROUNDS = 1

def get_runtime(w, x, perm, threads):
    print("test with {0} permutations with {1} threads for {2} rounds...".format(perm, threads, TEST_ROUNDS))

    run_time_array = []
    for i in range(TEST_ROUNDS):
        start_time = time.time()
        lisa = pygeoda.local_moran(w, x, permutations=perm, cpu_threads=threads)
        run_time = time.time() - start_time
        run_time_array.append(run_time)
    return run_time_array

# prepare the data and weights
chi = pygeoda.open("./data/us-sdoh-2014-chi_utm.shp")
w = pygeoda.weights.queen_weights(chi)
x = chi.GetRealCol("ep_unem")

tests = {}
# Permutations 999, CPU threads [1, 8, 16]
perms = 999
tests[perms] = {}
tests[perms][1] = get_runtime(w, x, perms, 1)
tests[perms][8] = get_runtime(w, x, perms, 8)
tests[perms][16] = get_runtime(w, x, perms, 16)

# Permutations 9,999, CPU threads [1, 8, 16]
perms = 9999
tests[perms] = {}
tests[perms][1] = get_runtime(w, x, perms, 1)
tests[perms][8] = get_runtime(w, x, perms, 8)
tests[perms][16] = get_runtime(w, x, perms, 16)


# Permutations 99,999, CPU threads [1, 8, 16]
perms = 99999
tests[perms] = {}
tests[perms][1] = get_runtime(w, x, perms, 1)
tests[perms][8] = get_runtime(w, x, perms, 8)
tests[perms][16] = get_runtime(w, x, perms, 16)

print(tests)