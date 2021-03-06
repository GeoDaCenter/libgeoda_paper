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
df = [chi.GetRealCol(i) for i in v]

# apply neighbor match test with 8 nearest neighbors
chsdoh = pygeoda.neighbor_match_test(chi, df, 8)

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

| Name | Alias | # observations | variable |
|------|-------|----------------|----------|
|U.S. Counties (natregimes.shp)| Natregimes | 3,085 (.shp 1.5MB)| HR60 (homicide rates for 1960) |
|U.S. Tracts (us-sdoh-2014.shp) | US-SDOH | 71,886<sup>1</sup> (.shp 72.1MB) | EP_UNEMP (unemployment rate by U.S. census tract in 2010) |
|New York City (NYC) Blocks (NYC Area2010_2data.shp) | NYC_blocks | 108,332<sup>2</sup> (.shp 34.1MB)| CE01_02 (employed persons earning less than $1250 per month in 2002) |
| Chicago Parcels (Chicago_parcels_points.shp) | Chicago_parcels | 321,701<sup>3</sup> (.shp 9MB)| EstBuild (Board of Review final estimated market value of building from the prior tax year)|

<sup>1</sup>The original dataset has 71,901 observations with 15 islands were removed.

<sup>2</sup>The original dataset has 108,487 observations with 155 islands were removed.

<sup>3</sup>The Chicago_parcels_points.shp is create using the dataset download from https://datacatalog.cookcountyil.gov/Property-Taxation/Archive-Cook-County-Assessor-s-Residential-Sales-D/5pge-nu6u (Feb 14, 2021), and the duplicate points are removed.


**Test function:**

The main time-consuming part in the Local Moran statistic is the conditional permutation. 
The number of permutations ranges from 999 (the default in GeoDa) to 9,999 and 99,999 
(the largest possible value in GeoDa). 

| Software | Test Function |
|----------|---------------|
| GeoDa    |  Local Moran using GPU |
| libgeoda |  gda_localmoran() with permutation_method="complete" and "lookup-table" |
| pygeoda  |  local_moran() with permutation_method="complete" and "lookup-table" |
| rgeoda   |  local_moran() with permutation_method="complete" and "lookup-table" |
| PySAL/esda |  Moran_Local() without Numba |
| spedp |  localmoran_perm() with Multi-Processing |

* NOTE: permutation_method="complete" vs "lookup-table"

In "complete" permutation method, for example with 999 permutations,  each observation will find 999 groups of random neighbors which are used to compute a pseudo-p value.
Therefore, the total number of permutation computation is: ~sum(999 x nbrs_i)

In "lookup-table" permutation method, for example with 999 permutations, a 999 groups of random neighbors (size = max_neighbors) 
from a pool of (N-1) indices will be created as a "lookup-table". Then, each observation will use this "lookup-table" to 
compute a pseudo-p value. The (N-1) indices in the "lookup-table" will be "reordered" by removing the index of current observation,
so to create a "conditional" permutation test. Therefore, the total number of permutation computation is: 999 x max_neighbors

The "lookup-table" method is implemented in PySAL/esda (version 2.3.6) and libgeoda/pygeoda/rgeoda (version 0.0.8 with parameter: permutation_method="lookup-table").

In this test, the weights creation function is also tested among libgeoda, pygeoda, rgeoda, PySAL and spdep.
 
| Software | Test Function |
|----------|---------------|
| libgeoda | gda_knn_weights(), gda_queen_weights() |
| pygeoda | Weights.queen_weights(), Weights.knn_weights() |
| rgeoda | queen_weights(), knn_weights() |
| PySAL | libpysal.weights.Queen.from_dataframe(), libpysal.weights.KNN.from_dataframe(), libpysal.weights.Queen.from_shapefile(), libpysal.weights.KNN.from_shapefile() |
| spdep | poly2nb()+nb2list2(), knearneigh()+knn2nb()+nb2listw() |


**Test machine:**

For most testing jobs:

* Mac Pro (Later 2013)
* Processor: 2.7 GHz 12-Core Intel Xeon E5 (24 CPU logical cores, each physical CPU core has 2 logical CPU cores)
* Memory: 64 GB 1866 MHz DDR3
* Graphic: AMD FirePro D700 6 GB

For pygeoda(arm64) on Apple Sillicon M1 chip

* MacBook Pro (13-inch, M1, 2020)
* Chip: Apple M1 (8 CPU logical cores, 4 performance and 4 efficiency)
* Memory: 16Gb


**Test environment:**


| Software  | Version |
|-----------|---------|
|macOS| Mojave Version 10.14.6| 
|Python| Python3.6.6 64-bit |
|R | R 4.0.3 |
|clang | Apple clang version 11.0.0|

pygeoda (arm64)

| Software  | Version |
|-----------|---------|
|macOS| Big Sur Version 11.2.1 (20D74)| 
|Python| Python3.9.1 arm64 |
|clang | Apple clang version 12.0.0 (clang-1200.0.32.29)|

**Test implementations:**

|  | Software/Library | version |
|--|------------------|---------|
| 1 | GeoDa desktop (using GPU) | 1.18 |
| 2 | libgeoda C++ API | "geodacenter/libgeoda" (v0.0.8) |
| 3 | rgeoda | "geodacenter/rgeoda" (v0.0.8) |
| 4 | spdep |  remotes::install_github("r-spatial/spdep") |
| 5 | pygeoda | "geodacenter/pygeoda" (v0.0.8) |
| 6 | PySAL | libpysal 4.4.0, esda-2.3.6 |

Each test function will be executed 3 times, and the average executing time (in seconds)) will be recorded.

Note: The GeoDe desktop app for Mac OSX used for this test can be downloaded from here: https://github.com/GeoDaCenter/libgeoda_paper/releases/download/v0.1/GeoDa-GPU-test.zip

One needs to check the box "Use GPU to accelerate computation" in GeoDa->Preference dialog. 

The running time of Univariate Local Moran feature can be found in the log file located at: GeoDa.app/Contents/Resources/logger.txt

Please check the running time (**by reopening the log file each time**) after each run since it doesn't print other information other than the GPU running time.

The content will be like:

```
Entering LisaCoordinator::Calc()
Exiting LisaCoordinator::Calc()
GPU took 231 ms
...
In OnRanOtherPer()
99999
GPU took 4073 ms
...
```

The testing code `perf_local_moran.cpp` for libgeoda C++ is compiled as a binary file: `libgeoda_perf`. The usage is

```
#./libgeoda_perf DATA_PATH VARIABLE_NAME PERMUTATION_METHOD
./libgeoda_perf ./data/natregimes HR60 complete
```

## 2.1 Summary of Test Results

* 2.1.1 No parallelization
* 2.1.2 Using 8 logical CPU cores or CPU threads
* 2.1.3 Using 16 logical CPU cores or CPU threads
* 2.1.4 Weights creation
* 2.1.5 Memory Usage

(Unit: seconds; Average running time for 3 runs)

NOTE: for pygeoda(arm64) on Apple M1 chip, there are results only for "no parallelization" and "using 8 CPU threads" since Apple M1 chip has 8 total logical cores (4 performance and 4 efficiency).

See the details in Google spreadsheet: https://docs.google.com/spreadsheets/d/18zsN6JMGKCObf7DW0NlVQUJYEE4Qt3WTVkYuQ0pNZ-Y

### 2.1.1 No parallelization<sup>4</sup>

| Data | Permutations | GeoDa GPU | libgeoda | pygeoda | rgeoda | spdep | PySAL+numba |pygeoda (lookup-table) | rgeoda (lookup-table) | libgeoda (lookup-table) | pygeoda-AppleM1 | libgeoda-AppleM1 | libgeoda-M1 (lookup) |
|------|--------------|-----------|----------|---------|--------|-------|-------------|-----------------------|-----------------------|-------------------------|-----------------|------------------|----------------------|
|Natregimes|999|0.06666666667|0.570333|0.5861863295|0.597|1.314|0.1495076815|0.04602972666|0.054|0.042|0.1605165799|0.147|0.023|
|Natregimes|9999|0.4303333333|5.76967|5.894174417|5.90|9.22|1.007939339|0.4580373764|0.478|0.417|1.556330681|1.54133|0.234667|
|Natregimes|99999|4.077333333|56.616|58.42296004|57.196|89.39866667|12.81152924|4.580973943|4.477666667|4.251|15.68434167|14.999|2.36767|
|US-SDOH|999|0.309|16.849|17.30434664|17.188|77.53933333|17.33241868|1.876623313|2.525|1.77233|4.108779351|4.07567|0.586|
|US-SDOH|9999|2.897666667|166.898|172.4183534|174.760|383.189|43.98250111|18.74490062|19.428|17.8793|41.89048203|40.2537|5.677|
|US-SDOH|99999|28.05333333|1675.58|1709.570349|1734.242|3465.897|501.7582227|215.611668|248.4403333|177.241|426.1011527|406.263|58.2803|
|NYC_blocks|999|1.753666667|27.6187|28.45079025|28.814|138.8043333|37.19531957|3.535606623|3.68|3.22467|8.06589365|7.77867|0.989667|
|NYC_blocks|9999|17.41733333|273.915|282.0992463|285.253|502.8656667|93.65690366|34.31966758|34.90566667|32.0497|80.29664334|78.0457|9.636|
|NYC_blocks|99999|50.59|2782.88|2814.519481|2850.638|4275.771333|903.7217659|453.8002907|492.5203333|337.156|838.5820987|802.617|156.24|
|Chicago_parcels|999|0.8403333333|108.819|113.7595565|113.233|1339.121333|345.8915047|13.85470406|14.99833333|13.3857|27.22306705|25.8913|3.84467|
|Chicago_parcels|9999|5.342666667|1088.7|1153.4873|1137.660|3503.14|526.65153|134.816866|134.4793333|129.789|276.7192132|252.098|35.5853|
|Chicago_parcels|99999|52.83633333|10830.4|13514.23282|13189.34033|>5hours|3134.579399|1354.542644|1337.711333|1301.51|2826.268243|2541.72|355.573|

<sup>4</sup>The function Moran_Local() in PySAL has been tested with parameters: keep_simulations=False and n_jobs=1.
The n_jobs=1 parameter is used to explicitly set not doing parallel run. However, the Moran_Local() function still uses 12 CPU cores (specifically 1200% CPU usage) to run its sub-function `_prepare_univariate()` in parallel on the testing machine. To avoid this issue, additional environment setting `export OPENBLAS_NUM_THREADS=1` needs to be set before running the tests.
You can find the result with or without `OPENBLAS_NUM_THREADS` setting in the google spreadsheet.
`PySAL+numba` has been tested using PySAL with Numba (version 0.52.0). PySAL uses Numba package to compile the python code into fast machine code when calling Moran_Local() the first time. The compilation takes extra 3-4 seconds, which is not included in the testing results. PySAL+numba also provides a parallelized Moran_Local() function using multi-processing.

### 2.1.2 Using 8 logical CPU cores or CPU threads<sup>5</sup>

| Data | Permutations | GeoDa GPU | libgeoda | pygeoda | rgeoda | spdep | PySAL+numba | pygeoda (lookup-table) | rgeoda (lookup-table) | libgeoda (lookup-table) | pygeoda-AppleM1 | libgeoda-AppleM1 | libgeoda-M1 (lookup) |
|------|--------------|-----------|----------|---------|--------|-------|-------------|------------------------|-----------------------|-------------------------|-----------------|------------------|----------------------|
|Natregimes|999|0.06666666667|0.084|0.08737667402|0.109|0.4123333333|0.1109683514|0.008454958598|0.01633333333|0.007|0.03832832972|0.0326667|0.00533333|
|Natregimes|9999|0.4303333333|0.830333|0.8471396764|0.909|1.875333333|0.7170015176|0.06996099154|0.078|0.063|0.3403144677|0.368333|0.05|
|Natregimes|99999|4.077333333|8.37|8.611579974|8.498|15.29533333|6.829287926|0.6632655462|0.6653333333|0.624333|3.408513467|3.54533|0.471667|
|US-SDOH|999|0.309|2.521|2.524351994|2.760|16.36433333|4.362103383|0.2906908989|0.4236666667|0.280333|0.9343883991|0.932667|0.132667|
|US-SDOH|9999|2.897666667|24.654|24.97697441|25.927|70.43233333|19.20629199|2.727758964|2.943|2.654|9.552996079|9.52133|1.16767|
|US-SDOH|99999|28.05333333|248.595|249.5261346|253.039|608.695|212.230346|27.48555231|29.12133333|26.4387|98.13868761|102.395|12.846|
|NYC_blocks|999|1.753666667|4.31167|4.287986279|4.487|28.68066667|8.700031042|0.5528754393|0.6826666667|0.519667|1.937014182|1.87933|0.221667|
|NYC_blocks|9999|17.41733333|42.0707|42.35134069|43.281|96.24366667|38.37287958|5.123643319|5.388666667|4.99833|19.60354439|19.952|2.07133|
|NYC_blocks|99999|50.59|424.6791393|418.525|431.787|761.3146667|377.9261179|56.57580392|60.02066667|52.7277|206.378281|206.218|41.338|
|Chicago_parcels|999|0.8403333333|16.5197|16.51535312|17.137|275.6243333|116.2662616|2.2724394|2.587333333|2.24833|7.576208989|6.69833|0.921|
|Chicago_parcels|9999|5.342666667|159.269|161.4538433|164.331|560.1833333|259.9330783|19.51306844|20.197|19.4687|72.33786313|71.2023|8.17933|
|Chicago_parcels|99999|52.83633333|1589.36|1629.589604|1640.682|3651.002333|1511.241152|191.0071477|193.1073333|190.031|809.6136088|753.725|85.9223|

<sup>5</sup>On this test machine, each physical CPU core has 2 CPU threads (logical CPU cores). Therefore, there are total of 24 logical CPU cores, and the maximum CPU usage could be 2400%. The spdep and PySAL+numba do multi-processing for parallalization.  For testing spdep, the function localmoran_perm() is called after setting up using 8/16 CPU logical cores (or 800%/1600% CPU usage): `set.coresOption(8)` or `set.coresOption(16)`. For testing PySAL+numba, the parameter `n_jobs=8` and `n_jobs=16` are defined to use 8/16 logical CPU cores.

### 2.1.3 Using 16 logical CPU cores or CPU threads 

| Data | Permutations | GeoDa GPU | libgeoda |pygeoda | rgeoda | spdep | PySAL+numba | pygeoda (lookup-table) | rgeoda (lookup-table) | libgeoda (lookup-table) |
|------|--------------|-----------|----------|--------|--------|-------|-------------|------------------------|-----------------------|-------------------------|
|Natregimes|999|0.06666666667|0.0586667|0.05985840162|0.0793|0.343|0.141546011|0.006822745005|0.015|0.005|
|Natregimes|9999|0.4303333333|0.580333|0.5781105359|0.585|1.126666667|0.7108952999|0.05192867915|0.061|0.0466667|
|Natregimes|99999|4.077333333|5.70267|5.664550781|5.772|9.930666667|6.857626677|0.4838843346|0.496|0.443667|
|US-SDOH|999|0.309|1.77233|1.726169745|1.860|13.361|4.298636675|0.2171577613|0.3186666667|0.202|
|US-SDOH|9999|2.897666667|17.4743|16.95118411|17.079|41.66766667|20.97272158|2.014290571|2.120666667|1.90467|
|US-SDOH|99999|28.05333333|166.635|165.9426964|166.148|340.0086667|204.9198567|20.96293465|21.02633333|19.369|
|NYC_blocks|999|1.753666667|2.97567|2.897502263|3.083|23.62766667|13.86122473|0.3977809747|0.5156666667|0.377|
|NYC_blocks|9999|17.41733333|28.3143|28.33021959|28.872|60.51|43.93848205|3.816352606|3.964333333|3.55733|
|NYC_blocks|99999|50.59|289.036|280.0743279|282.211|417.348|365.8231714|42.481|42.481|38.2043|
|Chicago_parcels|999|0.8403333333|11.6433|11.80314898|11.701|164.3243333|115.3440681|1.847482602|2.009|1.80967|
|Chicago_parcels|9999|5.342666667|109.078|113.620623|111.078|331.2663333|250.7607864|15.56285644|15.737|15.251|
|Chicago_parcels|99999|52.83633333|1100.37|1131.008971|1175.597333|2219.241|1594.583883|152.6243389|149.5633333|149.441|

### 2.1.4 Weights Creation

| Data | libgeoda |pygeoda | PySAL (from_dataframe) | rgeoda | spdep | PySAL (from_shapefile) | pygeoda (Apple M1) | libgeoda (Apple M1) |
|------|----------|--------|------------------------|--------|-------|------------------------|--------------------|---------------------|
| Natregimes | 0.025 | 0.02688233058| 0.7145156066| 0.498| 2.667666667| 0.3945383231| 0.01253199577 |0.014|
| US-SDOH | 0.8543333333 | 0.9045639833| 34.34305215| 40.06166667|868.514|21.06307236| 0.4436721802|0.434|
| NYC_blocks | 1.179666667 | 1.272605975 | 19.53454574 | 3.496 | 2072.118 | 13.52057767|0.5766201019|0.572|
|Chicago_parcels | 3.118666667 | 3.517646313| 30.32266418 | 6.466333333 | 13313.13367 | 22.42620635|1.776056051|1.751|



NOTE: In rgeoda, the first-time call of queen_weights() or knn_weights() includes a procedure to convert sf geometry objects (wkb) to an internally used object of rgeoda. 


### 2.1.5 Memory Usage

The `/usr/bin/time -l` command is used to get the "**maximum resident set size**" (the peak memory used by the process on the test machine).

result_memory_usage.txt

Natregimes:

| Software | Permutations | Single Thread | 
|----------|--------------|---------------|
| libgeoda | 999 | 11.8359375 Mb |
| pygeoda  | 999 | 72.75 Mb |
| PySAL    | 999 | 173.0664063 Mb |
| rgeoda   | 999 | 151.3710938 Mb |
| spdep    | 999 | 468.3359375 Mb <sup>6</sup>|
| pygeoda  | 9999 | 199.2578125 Mb |
| PySAL    | 9999 | 163.4492188 Mb |
| rgeoda   | 9999 | 151.3710938 Mb |
| spdep    | 9999 | 684.8046875 Mb |
| pygeoda  | 99999 | 84.0625 Mb |
| PySAL    | 99999 | 440.2929688 Mb |
| rgeoda   | 99999 | 155.4882813 Mb |
| spdep    | 99999 | 1314.460938 Mb |

<sup>6</sup>Since spdep and PySAL+numba uses multiple-processing for parallization, 
each spawn process will have a separated (copied) memeory space. For example, when running the spdep with 4 CPU cores, the total peak memory usage could be 4 x ~460Mb = ~1840Mb.

US-SDOH:

| Software | Permutations | Single Thread | 
|----------|--------------|---------------|
| libgeoda | 999 | 358.56640625 Mb |
| pygeoda  | 999 | 409.3867188 Mb |
| PySAL    | 999 | 1786.71875 Mb |
| rgeoda   | 999 | 747.8476563 Mb |
| spdep    | 999 | 4150.246094 Mb |

NYC_blocks:

| Software | Permutations | Single Thread | 
|----------|--------------|---------------|
| libgeoda | 999 | 261.859375 Mb |
| pygeoda  | 999 | 329.72265625 Mb |
| PySAL    | 999 | 1052.296875 Mb |
| rgeoda   | 999 | 644.08203125 Mb |
| spdep    | 999 | 4419.4140625 Mb |

Chicago_parcels:

| Software | Permutations | Single Thread | 
|----------|--------------|---------------|
| libgeoda | 999 | 246.2421875 Mb |
| pygeoda  | 999 | 295.59375 Mb |
| PySAL    | 999 | 1234.16015625 Mb |
| rgeoda   | 999 | 657.7265625 Mb |
| spdep    | 999 | 3443.359375 Mb |

## 3. Re-Run with updated spdep and projected Chicago dataset

### 3.1 Project Chicago_parcels.shp using UTM 16N

The Chicago_parcels.shp dataset uses latitude/longitude, which is unprojected. The kNN calcuations could be incorrect in a strict sense. Therefore, the Chicago_parcels_points.shp dataset has been projected using UTM 16N and was saved as Chicago_parcels_projected.shp. We re-run all the Chicago_parcels results for projected dataset.

### 3.2 Re-Run weights creation with updated spdep and RANN

The spdep package has a soft dependency "RANN" package (for spatial indexing) that is used to improve the performance of weights creation. However, the "RANN" package does not be installed automatically when installing spdep package. This means that the testing cases of weights creation using spdep above doesn't have "RANN" installed. Besides, the spdep package made some changes to improve the weights creation on 3/1/2021 (see https://github.com/r-spatial/spdep/commit/ef833665b28b48a2bcb724164eba7b55c15f5467). 

Therefore, we re-run the weights creation tests for spdep by:
1. manually install "RANN" package
2. reinstall the latest spdep package (3/1/2021) 

### 3.3 Re-Run weights creation with updated rgeoda

There is a update of rgeoda (version 0.0.8-1 https://github.com/GeoDaCenter/rgeoda/commit/433c7fc4f43d85b2d98f5ba0dc7b058168b54ff9) to improve the performance of weights creation on 3/2/2021. We re-run the weights creation tests for rgeoda by reinstalling the latest rgeoda package (3/2/2021)

### 3.3 Results:

#### 3.3.1 The updated results of weights creation:

| Data | libgeoda |pygeoda | PySAL (from_dataframe) | rgeoda (rerun) | spdep (rerun) | PySAL (from_shapefile) | pygeoda (Apple M1) | libgeoda (Apple M1) |
|------|----------|--------|------------------------|----------------|---------------|------------------------|--------------------|---------------------|
| Natregimes | 0.025 | 0.02688233058| 0.7145156066| **0.2376666667**| **1.668666667**| 0.3945383231| 0.01253199577 |0.014|
| US-SDOH | 0.8543333333 | 0.9045639833| 34.34305215| **3.097666667**|**46.07866667**|21.06307236| 0.4436721802|0.434|
| NYC_blocks | 1.179666667 | 1.272605975 | 19.53454574 |**2.928666667** | **63.53566667** | 13.52057767|0.5766201019|0.572|
|Chicago_parcels | 3.118666667 | 3.517646313| 30.32266418 | **5.559** | **36.264** | 22.42620635|1.776056051|1.751|


#### 3.3.2 The updated results using projected Chicago dataset

**No parallelization** 

| Data | Permutations | GeoDa GPU | libgeoda | pygeoda | rgeoda | spdep | PySAL+numba |pygeoda (lookup-table) | rgeoda (lookup-table) | libgeoda (lookup-table) | pygeoda-AppleM1 | libgeoda-AppleM1 | libgeoda-M1 (lookup) |
|------|--------------|-----------|----------|---------|--------|-------|-------------|-----------------------|-----------------------|-------------------------|-----------------|------------------|----------------------|
|Chicago_parcels|999|0.811|109.518|113.1555017|122.7653333|1232.191|351.6820914|14.25174697|14.26366667|13.453|28.19863915|26.8127|3.78133|
|Chicago_parcels|9999|5.209666667|1091.83|1128.426818|1137.513667|3386.519667|550.9887323|137.5472593|134.602|130.681|282.8068848|270.167|35.4723|
|Chicago_parcels|99999|50.586|10879.7|11275.49621|11498.43667|>5hours|2919.790882|1339.630583|1349.666667|1303.31|2785.58942|2664.21|353.835|


**8 CPU Cores/Threads** 

| Data | Permutations | GeoDa GPU | libgeoda | pygeoda | rgeoda | spdep | PySAL+numba |pygeoda (lookup-table) | rgeoda (lookup-table) | libgeoda (lookup-table) | pygeoda-AppleM1 | libgeoda-AppleM1 | libgeoda-M1 (lookup) |
|------|--------------|-----------|----------|---------|--------|-------|-------------|-----------------------|-----------------------|-------------------------|-----------------|------------------|----------------------|
|Chicago_parcels|999|0.811|16.5333|16.29952447|17.04533333|217.3633333|110.7283931|2.315855503|2.519|2.26133|7.328261296|7.156|0.885|
|Chicago_parcels|9999|5.209666667|162.286|163.6925741|162.6446667|534.693|250.8979822|19.65332659|20.00833333|19.487|75.01957703|72.1607|8.30133|
|Chicago_parcels|99999|50.586|1591.88|1608.64615|1611.862333|3593.604333|1495.017658|191.0675654|193.044|190.622|775.6198767|707.908|83.979|


**16 CPU Cores/Threads** 

| Data | Permutations | GeoDa GPU | libgeoda | pygeoda | rgeoda | spdep | PySAL+numba |pygeoda (lookup-table) | rgeoda (lookup-table) | libgeoda (lookup-table) |
|------|--------------|-----------|----------|---------|--------|-------|-------------|-----------------------|-----------------------|-------------------------|
|Chicago_parcels|999|0.811|11.5563|11.39887404|12.32|190.7413333|351.6820914|1.805101554|2.051666667|1.76867|
|Chicago_parcels|9999|5.209666667|111.097|111.1572822|112.5883333|354.803|550.9887323|15.32644812|15.43|15.349|
|Chicago_parcels|99999|50.586|1104.74|1086.440269|1136.704|2406.149|2919.790882|148.880654|149.1866667|147.968|