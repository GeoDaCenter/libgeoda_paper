# 1. Source code for the paper

## 1.1 snow.py

This is the python code to run the local join count statistics using the Snow cholera deaths data set for central London (data/deaths_nd_by_house)

```python
import pygeoda

# load data
snow = pygeoda.open("./data/deaths_nd_by_house.shp")

# get values for varaible "death_dum"
v = snow.GetIntegerCol("death_dum")

# create a distance weights with distance threshold = 20 (meters)
d20 = pygeoda.weights.distance_weights(snow, dist_thres=20)
print(d20)

# apply local join count statistics 
snowjc = pygeoda.local_joincount(d20, v, permutations=99999, significance_cutoff=0.01)

# get results from local join count statistics
snowsig = snowjc.lisa_clusters()
pval = snowjc.lisa_pvalues()
print(sum(snowsig))
```

The outputs:
```
Weights Meta-data:
 number of observations:                 1852
           is symmetric:                 True
               sparsity: 0.004744156104660655
        # min neighbors:                    0
        # max neighbors:                   25
       # mean neighbors:    8.786177105831534
     # median neighbors:                  9.0
           has isolates:                 True

98
```

## 1.2 sdoh.py

This is the python code to apply the local neighbor match test using an example of neighborhood-level social determinants of health (data/us-sdoh-2014-chi_utm).

```python
import pygeoda

# load data
chi = pygeoda.open("./data/us-sdoh-2014-chi_utm.shp")

# get data from variables:"1_SES", "2_MOB", "3_URB","4_MICA"
v = ("1_SES", "2_MOB", "3_URB","4_MICA")
data = [chi.GetRealCol(i) for i in v]

# apply neighbor match test with 8 nearest neighbors
chsdoh = pygeoda.neighbor_match_test(chi, data, 8)

print(chsdoh)
```

The outpu:
```
{
    'Cardinality': [1, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 2, 2, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 2, 1, 1, 3, 0, 3, 0, 0, 0, 1, 1, 0, 0, 2, 0, 1, 2, 0, 4, 2, 1, 0, 0, 0, 1, 0, 0, 2, 1, 3, 1, 2, 2, 2, 1, 1, 0, 2, 1, 3, 1, 3, 0, 1, 0, 0, 0, 3, 0, 2, 0, 0, 1, 2, 1, 2, 2, 0, 0, 2, 0, 0, 0, 4, 0, 1, 1, 4, 0, 1, 2, 1, 2, 2, 0, 1, 0, 0, 0, 2, 0, 1, 2, 3, 1, 1, 2, 0, 0, 0, 2, 2, 3, 0, 0, 0, 0, 0, 1, 0, 1, 4, 1, 0, 0, 1, 0, 0, 1, 0, 2, 2, 0, 0, 2, 1, 1, 2, 4, 0, 1, 0, 1, 3, 2, 0, 0, 1, 1, 0, 2, 3, 3, 3, 1, 2, 0, 1, 0, 1, 2, 1, 1, 3, 0, 2, 1, 2, 0, 1, 2, 0, 0, 0, 0, 2, 0, 0, 0, 1, 1, 1, 2, 0, 0, 0, 3, 0, 1, 3, 2, 2, 2, 0, 2, 2, 2, 1, 2, 1, 2, 1, 2, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 2, 2, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 3, 1, 4, 1, 3, 2, 0, 0, 0, 1, 1, 2, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 2, 1, 0, 1, 0, 0, 1, 2, 1, 0, 1, 0, 0, 1, 1, 2, 2, 0, 2, 1, 1, 2, 2, 3, 0, 0, 0, 0, 2, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 2, 0, 0, 1, 2, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 2, 1, 0, 1, 2, 3, 0, 2, 1, 1, 3, 0, 0, 0, 0, 2, 0, 1, 2, 0, 2, 0, 0, 3, 2, 0, 1, 1, 0, 0, 1, 0, 1, 0, 2, 0, 1, 1, 1, 1, 1, 3, 0, 1, 0, 2, 3, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 2, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 2, 1, 0, 0, 0, 0, 1, 0, 1, 2, 2, 0, 0, 0, 0, 2, 0, 0, 2, 0, 1, 2, 2, 1, 1, 1, 1, 0, 0, 2, 0, 1, 0, 1, 0, 0, 0, 2, 0, 1, 1, 1, 3, 2, 0, 0, 0, 3, 1, 2, 1, 1, 0, 1, 0, 0, 0, 0, 3, 2, 1, 2, 0, 0, 0, 1, 1, 1, 2, 0, 2, 1, 1, 1, 0, 0, 0, 1, 2, 0, 1, 1, 1, 0, 0, 1, 2, 0, 0, 0, 2, 0, 2, 1, 2, 3, 0, 2, 1, 2, 3, 2, 1, 0, 0, 2, 1, 0, 1, 2, 1, 4, 2, 1, 0, 1, 1, 0, 1, 2, 0, 0, 0, 1, 0, 0, 2, 2, 3, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 2, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 2, 1, 3, 1, 3, 2, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 1, 3, 0, 1, 2, 0, 1, 1, 4, 5, 7, 3, 2, 0, 0, 0, 1, 0, 1, 1, 3, 4, 6, 3, 1, 1, 5, 4, 0, 3, 0, 0, 0, 3, 2, 0, 1, 0, 0, 1, 1, 1, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 2, 0, 2, 0, 1, 1, 0, 1, 1, 0, 2, 1, 0, 3, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 2, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1], 
    'Probability': [0.0760951690976322, nan, nan, nan, 0.0760951690976322, nan, 0.002402489230530913, nan, nan, nan, nan, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, nan, nan, nan, 0.002402489230530913, nan, nan, 0.0760951690976322, 0.0760951690976322, nan, nan, 0.0760951690976322, nan, nan, nan, nan, nan, 0.0760951690976322, nan, nan, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, nan, 0.002402489230530913, 0.002402489230530913, nan, nan, nan, nan, nan, nan, 3.710408078040021e-05, nan, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, nan, nan, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, 3.710408078040021e-05, nan, 3.710408078040021e-05, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, nan, nan, 0.002402489230530913, nan, 0.0760951690976322, 0.002402489230530913, nan, 2.9807262837725103e-07, 0.002402489230530913, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, nan, nan, 0.002402489230530913, 0.0760951690976322, 3.710408078040021e-05, 0.0760951690976322, 0.002402489230530913, 0.002402489230530913, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, nan, 0.002402489230530913, 0.0760951690976322, 3.710408078040021e-05, 0.0760951690976322, 3.710408078040021e-05, nan, 0.0760951690976322, nan, nan, nan, 3.710408078040021e-05, nan, 0.002402489230530913, nan, nan, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, 0.002402489230530913, 0.002402489230530913, nan, nan, 0.002402489230530913, nan, nan, nan, 2.9807262837725103e-07, nan, 0.0760951690976322, 0.0760951690976322, 2.9807262837725103e-07, nan, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, 0.002402489230530913, 0.002402489230530913, nan, 0.0760951690976322, nan, nan, nan, 0.002402489230530913, nan, 0.0760951690976322, 0.002402489230530913, 3.710408078040021e-05, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, nan, nan, nan, 0.002402489230530913, 0.002402489230530913, 3.710408078040021e-05, nan, nan, nan, nan, nan, 0.0760951690976322, nan, 0.0760951690976322, 2.9807262837725103e-07, 0.0760951690976322, nan, nan, 0.0760951690976322, nan, nan, 0.0760951690976322, nan, 0.002402489230530913, 0.002402489230530913, nan, nan, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, 2.9807262837725103e-07, nan, 0.0760951690976322, nan, 0.0760951690976322, 3.710408078040021e-05, 0.002402489230530913, nan, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.002402489230530913, 3.710408078040021e-05, 3.710408078040021e-05, 3.710408078040021e-05, 0.0760951690976322, 0.002402489230530913, nan, 0.0760951690976322, nan, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, 3.710408078040021e-05, nan, 0.002402489230530913, 0.0760951690976322, 0.002402489230530913, nan, 0.0760951690976322, 0.002402489230530913, nan, nan, nan, nan, 0.002402489230530913, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, nan, nan, nan, 3.710408078040021e-05, nan, 0.0760951690976322, 3.710408078040021e-05, 0.002402489230530913, 0.002402489230530913, 0.002402489230530913, nan, 0.002402489230530913, 0.002402489230530913, 0.002402489230530913, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, 0.002402489230530913, nan, nan, nan, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.002402489230530913, 0.002402489230530913, nan, nan, nan, 0.0760951690976322, nan, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, 3.710408078040021e-05, 0.0760951690976322, 2.9807262837725103e-07, 0.0760951690976322, 3.710408078040021e-05, 0.002402489230530913, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, nan, 0.0760951690976322, nan, nan, nan, nan, 0.0760951690976322, nan, nan, nan, 0.002402489230530913, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, 0.002402489230530913, nan, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, 0.002402489230530913, 3.710408078040021e-05, nan, nan, nan, nan, 0.002402489230530913, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, nan, nan, nan, 0.002402489230530913, nan, nan, 0.0760951690976322, 0.002402489230530913, nan, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, nan, nan, nan, nan, nan, nan, nan, 0.0760951690976322, nan, 0.0760951690976322, nan, 0.002402489230530913, 0.0760951690976322, nan, nan, nan, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, nan, nan, nan, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, nan, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, 0.002402489230530913, nan, nan, nan, nan, nan, 0.002402489230530913, 0.0760951690976322, nan, 0.0760951690976322, 0.002402489230530913, 3.710408078040021e-05, nan, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, 3.710408078040021e-05, nan, nan, nan, nan, 0.002402489230530913, nan, 0.0760951690976322, 0.002402489230530913, nan, 0.002402489230530913, nan, nan, 3.710408078040021e-05, 0.002402489230530913, nan, 0.0760951690976322, 0.0760951690976322, nan, nan, 0.0760951690976322, nan, 0.0760951690976322, nan, 0.002402489230530913, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 3.710408078040021e-05, nan, 0.0760951690976322, nan, 0.002402489230530913, 3.710408078040021e-05, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, 0.002402489230530913, 0.0760951690976322, nan, nan, nan, nan, nan, 0.0760951690976322, nan, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.002402489230530913, 0.0760951690976322, nan, nan, nan, nan, 0.0760951690976322, nan, 0.0760951690976322, 0.002402489230530913, 0.002402489230530913, nan, nan, nan, nan, 0.002402489230530913, nan, nan, 0.002402489230530913, nan, 0.0760951690976322, 0.002402489230530913, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, nan, 0.002402489230530913, nan, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, nan, 0.002402489230530913, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 3.710408078040021e-05, 0.002402489230530913, nan, nan, nan, 3.710408078040021e-05, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, nan, nan, 3.710408078040021e-05, 0.002402489230530913, 0.0760951690976322, 0.002402489230530913, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, nan, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, 0.002402489230530913, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, nan, 0.0760951690976322, 0.002402489230530913, nan, nan, nan, 0.002402489230530913, nan, 0.002402489230530913, 0.0760951690976322, 0.002402489230530913, 3.710408078040021e-05, nan, 0.002402489230530913, 0.0760951690976322, 0.002402489230530913, 3.710408078040021e-05, 0.002402489230530913, 0.0760951690976322, nan, nan, 0.002402489230530913, 0.0760951690976322, nan, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, 2.9807262837725103e-07, 0.002402489230530913, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.002402489230530913, nan, nan, nan, 0.0760951690976322, nan, nan, 0.002402489230530913, 0.002402489230530913, 3.710408078040021e-05, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, 0.002402489230530913, 0.0760951690976322, 3.710408078040021e-05, 0.0760951690976322, 3.710408078040021e-05, 0.002402489230530913, nan, nan, nan, nan, nan, 0.0760951690976322, nan, nan, 0.002402489230530913, nan, nan, 0.0760951690976322, 3.710408078040021e-05, nan, 0.0760951690976322, 0.002402489230530913, nan, 0.0760951690976322, 0.0760951690976322, 2.9807262837725103e-07, 1.2244318495599528e-09, 1.7228290717169489e-15, 3.710408078040021e-05, 0.002402489230530913, nan, nan, nan, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, 3.710408078040021e-05, 2.9807262837725103e-07, 2.35467663376914e-12, 3.710408078040021e-05, 0.0760951690976322, 0.0760951690976322, 1.2244318495599528e-09, 2.9807262837725103e-07, nan, 3.710408078040021e-05, nan, nan, nan, 3.710408078040021e-05, 0.002402489230530913, nan, 0.0760951690976322, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, nan, nan, nan, nan, nan, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, nan, 0.0760951690976322, nan, 0.002402489230530913, nan, 0.002402489230530913, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.002402489230530913, 0.0760951690976322, nan, 3.710408078040021e-05, nan, 0.0760951690976322, nan, nan, nan, 0.0760951690976322, nan, nan, nan, nan, nan, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, nan, 0.0760951690976322, nan, nan, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, 0.0760951690976322, 0.002402489230530913, 0.0760951690976322, 0.0760951690976322, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, nan, nan, nan, nan, 0.002402489230530913, nan, 0.0760951690976322, nan, 0.0760951690976322, nan, nan, nan, nan, nan, 0.0760951690976322, nan, 0.0760951690976322]
}
```

# 2. Performance tests for the paper

**Test Datasets:**

| Name | # observations | variable |
|------|----------------|----------|
|U.S. counties (natregimes.shp)| 3,085 | HR60 (homicide rates for 1960) |
|U.S. census tracts (us-sdoh-2014-chi_utm.shp) | 72,344 | EP_UNEMP (unemployment rate by U.S. census tract in 2010) |
|New York City census blocks | 108,487 | CE01_02 (employed persons earning less than $1250 per month in 2002) |
| Chicago parcels | 592,521 | HVAL (assessed house value) |

**Test function:**

The main time-consuming part in the Local Moran statistic is the conditional permutation. The number of permutations ranges from 999 (the default in GeoDa) to 9,999 and 99,999 (the largest possible value in GeoDa). 

**Test implementations:**

|  | Software/Library | version |
|--|------------------|---------|
| 1 | GeoDa desktop (using GPU) | 1.18 |
| 2 | libgeoda C++ API | 0.0.8 |
| 3 | rgeoda | 0.0.8 |
| 4 | spdep | ?? |
| 5 | pygeoda | 0.0.8 |
| 6 | PySAL | 2.4.0 |

Each test function will be executed 10 times, and the average executing time (in seconds with 2 digital decimals) will be recorded.

