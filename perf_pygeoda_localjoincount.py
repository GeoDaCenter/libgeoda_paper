import pygeoda
import time

TEST_ROUNDS = 5

def get_runtime(w, x, perm, threads):
    print("test with {0} permutations with {1} threads for {2} rounds...".format(perm, threads, TEST_ROUNDS))

    run_time_array = []
    for i in range(TEST_ROUNDS):
        start_time = time.time()
        lisa = pygeoda.local_joincount(w, x, permutations=perm, cpu_threads=threads)
        run_time = time.time() - start_time
        run_time_array.append(run_time)
    return run_time_array

# prepare the data and weights
snow = pygeoda.open("./data/deaths_nd_by_house.shp")
w20 = pygeoda.weights.distance_weights(snow, 20.0)
x = snow.GetIntegerCol("death_dum")

tests = {}
# Permutations 999, CPU threads [1, 6, 12]
perms = 999
tests[perms] = {}
tests[perms][1] = get_runtime(w20, x, perms, 1)
tests[perms][6] = get_runtime(w20, x, perms, 6)
tests[perms][12] = get_runtime(w20, x, perms, 12)

# Permutations 9,999, CPU threads [1, 6, 12]
perms = 9999
tests[perms] = {}
tests[perms][1] = get_runtime(w20, x, perms, 1)
tests[perms][6] = get_runtime(w20, x, perms, 6)
tests[perms][12] = get_runtime(w20, x, perms, 12)


# Permutations 99,999, CPU threads [1, 6, 12]
perms = 99999
tests[perms] = {}
tests[perms][1] = get_runtime(w20, x, perms, 1)
tests[perms][6] = get_runtime(w20, x, perms, 6)
tests[perms][12] = get_runtime(w20, x, perms, 12)

print(tests)