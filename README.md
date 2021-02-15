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

**Test datasets:**

| Name | # observations | variable |
|------|----------------|----------|
|U.S. counties (natregimes.shp)| 3,085 | HR60 (homicide rates for 1960) |
|U.S. census tracts (us-sdoh-2014.shp) | 72,344 | EP_UNEMP (unemployment rate by U.S. census tract in 2010) |
|New York City census blocks (NYC Area2010_2data.shp) | 108,487 | CE01_02 (employed persons earning less than $1250 per month in 2002) |
| Chicago parcels (Chicago_parcels_points.shp) | 592,521 | EstBuild Board of Review final estimated market value of building from the prior tax year.|

**Test function:**

The main time-consuming part in the Local Moran statistic is the conditional permutation. 
The number of permutations ranges from 999 (the default in GeoDa) to 9,999 and 99,999 
(the largest possible value in GeoDa). 

| Software | Test Function |
|----------|---------------|
| GeoDa    |  Local Moran using GPU |
| pygeoda  |  local_moran() with permutation_method="brutal-force" |
| pygeoda  |  local_moran() with permutation_method="lookup-table" |
| rgeoda   |  local_moran() with permutation_method="brutal-force" |
| rgeoda   |  local_moran() with permutation_method="lookup-table" |
| pysal/esda |  Moran_Local() without Numba (single-thread) |
| pysal/esda |  Moran_Local() with Numba (multi-threads) |
| spedp |  localmoran_perm() |

* NOTE: permutation_method="brutal-force" vs "lookup-table"

In "brutal-force" permutation method, for example with 999 permutations,  each observation will find 999 groups of random neighbors which are used to compute a pseudo-p value.
Therefore, the total number of permutation computation is: sum(999 x nbr_i)

In "lookup-table" permutation method, for example with 999 permutations, a 999 groups of random neighbors (size = max_neighbors) 
from a pool of (N-1) indices will be created as a "lookup-table". Then, each observation will use this "lookup-table" to 
compute a pseudo-p value. The (N-1) indices in the "lookup-table" will be reordered by removing the index of current observation,
so to create a "conditional" permutation test. Therefore, the total number of permutation computation is: 999 x max_neighbors

The "lookup-table" method is implemented in pysal/esda (version 2.3.6) and pygeoda/rgeoda (version 0.0.8).
 
**Test machine:**

* Mac Pro (Later 2013)
* Processor: 2.7 GHz 12-Core Intel Xeon E5
* Memory: 64 GB 1866 MHz DDR3
* Graphic: AMD FirePro D700 6 GB

**Test environment:**


| Software  | Version |
|--|---------------------|
|macOS| Mojave Version 10.14.6| 
|Python| Python3.6.6 64-bit |
|R | R 4.0.3 |
|clang | Apple clang version 11.0.0|

**Test implementations:**

|  | Software/Library | version |
|--|------------------|---------|
| 1 | GeoDa desktop (using GPU) | 1.18 |
| 2 | libgeoda C++ API | 0.0.8 |
| 3 | rgeoda | 0.0.8 |
| 4 | spdep |  remotes::install_github("r-spatial/spdep") |
| 5 | pygeoda | 0.0.8 |
| 6 | PySAL | libpysal 4.4.0, esda-2.3.6 |

Each test function will be executed 3 times, and the average executing time (in seconds with 6 digital decimals) will be recorded.

**Test results:**


1. Pygeoda using permutation_method="complete"

```bash
./run_pygeoda_perf.sh > result_pygeoda_complete_1.txt
```

1.1 Natregimes

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999    | 0.5914509296417236 | 0.08591008186340332 | 0.05975604057312012 | |
| 9999  | 6.03707218170166 | 0.8514440059661865 | 0.5646729469299316 | |
| 99999 | 58.92710328102112 | 8.485954999923706 | 5.570709943771362 | |

1.2 US-SDOH

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 17.454599857330322  | 2.4892380237579346| 1.6712172031402588| |
| 9999 | 175.07298302650452 | 25.021250009536743 | 16.907100200653076| |
| 99999  | 1727.7120940685272| 248.83428502082825| 166.1402678489685| |

1.3 NYC

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 28.46846580505371  | 4.277080059051514 | 2.896711826324463 | |
| 9999 | 282.76479601860046| 42.7974419593811| 28.276558876037598  | |
| 99999  | 2821.240134000778 | 422.4912781715393 | 283.2045419216156 | |

1.4 Chicago (knn=20)

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 389.7134437561035  | 57.798383951187134| 43.7291738986969  | |
| 9999 | 3842.998600959778 | 556.979868888855 | 436.6491787433624 | |
| 99999  | | | | |

(>10:38:45 )

2. Pygeoda using permutation_method="lookup-table"

2.1 Natregimes

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999    | 0.05076098442077637 | 0.009467840194702148 | 0.007524013519287109 | |
| 9999  | 0.49645209312438965| 0.07634782791137695| 0.05653190612792969| |
| 99999 | 4.989437103271484  | 0.6796438694000244  | 0.5439951419830322| |

2.2 US-SDOH

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 2.0331978797912598 | 0.30008673667907715| 0.23631691932678223 | |
| 9999 | 20.22104287147522 | 2.7842931747436523 | 2.2208046913146973| |
| 99999  | 278.66816306114197 | 29.182877779006958  | 23.67146110534668  | |


2.3 NYC

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | 3.9321858882904053 | 0.5913081169128418  | 0.45052385330200195 | |
| 9999  | 37.25004291534424 | 5.340345859527588 | 4.245307922363281  | |
| 99999  | 656.4548988342285 | 62.88683271408081 | 48.3938422203064 | |


2.4 Chicago (TBD)

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |

3. PySAL/ESDA without Numba (No multi-threading)

3.1 Natregimes

| Permutations | No multi-threading |
|--------------|--------------------|
| 999  |0.5763969421386719 |
| 9999  | 2.856947898864746  |
| 99999  | 32.94658708572388 |


3.2 US-SDOH 

| Permutations | No multi-threading | Average |
|--------------|--------------------|---------|
| 999  | | |
| 9999  | | |
| 99999  | | |

The new Moran_Local() can't handle the islands and throws ValueError:

```
('WARNING: ', 6540, ' is an island (no neighbors)')
...
('WARNING: ', 70050, ' is an island (no neighbors)')
/Users/xun/Github/libgeoda_paper/venv/lib/python3.6/site-packages/libpysal/weights/weights.py:172: UserWarning: The weights matrix is not fully connected: 
 There are 30 disconnected components.
 There are 15 islands with ids: 6540, 6583, 7933, 19288, 23844, 33314, 35600, 38699, 39317, 53310, 58715, 58849, 69632, 70049, 70050.
  warnings.warn(message)
Traceback (most recent call last):
  File "perf_pysal.py", line 33, in <module>
    li = esda.moran.Moran_Local(x, w, permutations=perms, n_jobs=cpu_threads)
  File "/Users/xun/Github/libgeoda_paper/venv/lib/python3.6/site-packages/esda/moran.py", line 1040, in __init__
    seed=seed,
  File "/Users/xun/Github/libgeoda_paper/venv/lib/python3.6/site-packages/esda/crand.py", line 169, in crand
    stat_func,
  File "/Users/xun/Github/libgeoda_paper/venv/lib/python3.6/site-packages/esda/crand.py", line 265, in compute_chunk
    rstats = stat_func(chunk_start + i, z, permuted_ids, weights_i, scaling)
  File "/Users/xun/Github/libgeoda_paper/venv/lib/python3.6/site-packages/esda/moran.py", line 1792, in _moran_local_crand
    zi, zrand = _prepare_univariate(i, z, permuted_ids, weights_i)
  File "/Users/xun/Github/libgeoda_paper/venv/lib/python3.6/site-packages/esda/crand.py", line 483, in _prepare_univariate
    zrand = z_no_i[flat_permutation_ids].reshape(-1, cardinality)
ValueError: cannot reshape array of size 0 into shape (0)
```

3.3 NYC 

The new Moran_Local() can't handle the islands and throws ValueError:

| Permutations | No multi-threading | Average |
|--------------|--------------------|---------|
| 999  | | |
| 9999  | | |
| 99999  | | |


3.4 Chicago

| Permutations | No multi-threading | Average |
|--------------|--------------------|---------|
| 999  | | |
| 9999  | | |
| 99999  | | |



5. rgeoda with permutation_method="complete"


5.1 Natregimes

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | 0.643  |  0.104 | 0.079  | |
| 9999  | 6.419  | 0.891  | 0.673  | |
| 99999  | 65.327  | 9.141  | 6.844  | |


5.2 US-SDOH 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | 27.756  | 2.760  | 2.195  | |
| 9999  | | | | |
| 99999  | | | | |


5.3 NYC 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |

5.4 Chicago

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |



7. spdep 


7.1 Natregimes

| Permutations | No parallel   | 4 Cores       | 8 Cores        | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  |1.271  | 0.618 | 0.434 | |
| 9999  | 9.714  | 3.492  | 1.956  | |
| 99999  | 97.019  | 33.408  | 18.353 | |


7.2 US-SDOH 

| Permutations | No parallel|| 4 Cores | 8 Cores | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |


7.3 NYC 

| Permutations | No parallel|| 4 Cores | 8 Cores | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |

7.4 Chicago

| Permutations | No parallel|| 4 Cores | 8 Cores | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |

6. rgeoda with permutation_method="lookup-table"


6.1 Natregimes

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |


6.2 US-SDOH 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |


6.3 NYC 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |

6.4 Chicago

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |

4. PySAL/ESDA with Numba


4.1 Natregimes

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |


4.2 US-SDOH 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |


4.3 NYC 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |

4.4 Chicago

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | | | | |
| 9999  | | | | |
| 99999  | | | | |
