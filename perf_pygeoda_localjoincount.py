import pygeoda
import time

snow = pygeoda.open("./data/deaths_nd_by_house.shp")
w20 = pygeoda.weights.distance_weights(snow, 20.0)
x = snow.GetIntegerCol("death_dum")

print("RUN: local_joincount(w20, death_dum, permutations=999, cpu_threads=1")
start_time = time.time()
lisa = pygeoda.local_joincount(w20, x, permutations=999, cpu_threads=1)
print("--- %s seconds ---" % (time.time() - start_time))

print("RUN: local_joincount(w20, death_dum, permutations=999, cpu_threads=6")
start_time = time.time()
lisa = pygeoda.local_joincount(w20, x, permutations=999, cpu_threads=6)
print("--- %s seconds ---" % (time.time() - start_time))



print("RUN: local_joincount(w20, death_dum, permutations=9999, cpu_threads=1")
start_time = time.time()
lisa = pygeoda.local_joincount(w20, x, permutations=9999, cpu_threads=1)
print("--- %s seconds ---" % (time.time() - start_time))

print("RUN: local_joincount(w20, death_dum, permutations=9999, cpu_threads=6")
start_time = time.time()
lisa = pygeoda.local_joincount(w20, x, permutations=9999, cpu_threads=6)
print("--- %s seconds ---" % (time.time() - start_time))




print("RUN: local_joincount(w20, death_dum, permutations=99999, cpu_threads=1")
start_time = time.time()
lisa = pygeoda.local_joincount(w20, x, permutations=99999, cpu_threads=1)
print("--- %s seconds ---" % (time.time() - start_time))

print("RUN: local_joincount(w20, death_dum, permutations=99999, cpu_threads=6")
start_time = time.time()
lisa = pygeoda.local_joincount(w20, x, permutations=99999, cpu_threads=6)
print("--- %s seconds ---" % (time.time() - start_time))