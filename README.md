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

# apply neighbor match test with 8 nearest neighbors
chsdoh = pygeoda.neighbor_match_test(chi, v, 8)

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
|U.S. counties (natregimes.shp)| 3,085 (.shp 1.5MB)| HR60 (homicide rates for 1960) |
|U.S. census tracts (us-sdoh-2014.shp) | 72,329<sup>1</sup> (.shp 72.1MB) | EP_UNEMP (unemployment rate by U.S. census tract in 2010) |
|New York City census blocks (NYC Area2010_2data.shp) | 108,332<sup>2</sup> (.shp 34.1MB)| CE01_02 (employed persons earning less than $1250 per month in 2002) |
| Chicago parcels (Chicago_parcels_points.shp) | 321,701<sup>3</sup> (.shp 9MB)| EstBuild (Board of Review final estimated market value of building from the prior tax year)|

<sup>1</sup>The original dataset has 72,344 observations with 15 islands were removed.

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
| pysal/esda |  Moran_Local() without Numba |
| spedp |  localmoran_perm() with Multi-Processing |

* NOTE: permutation_method="complete" vs "lookup-table"

In "complete" permutation method, for example with 999 permutations,  each observation will find 999 groups of random neighbors which are used to compute a pseudo-p value.
Therefore, the total number of permutation computation is: sum(999 x nbr_i)

In "lookup-table" permutation method, for example with 999 permutations, a 999 groups of random neighbors (size = max_neighbors) 
from a pool of (N-1) indices will be created as a "lookup-table". Then, each observation will use this "lookup-table" to 
compute a pseudo-p value. The (N-1) indices in the "lookup-table" will be reordered by removing the index of current observation,
so to create a "conditional" permutation test. Therefore, the total number of permutation computation is: 999 x max_neighbors

The "lookup-table" method is implemented in pysal/esda (version 2.3.6) and pygeoda/rgeoda (version 0.0.8 with parameter: permutation_method="lookup-table").

In this test, the weights creation function is also tested among pygeoda, rgeoda, pysal and spdep
 
| Software | Test Function |
|----------|---------------|
| libgeoda | gda_knn_weights(), gda_queen_weights() |
| pygeoda | Weights.queen_weights(), Weights.knn_weights() |
| rgeoda | queen_weights(), knn_weights() |
| pysal | libpysal.weights.Queen.from_dataframe(), libpysal.weights.KNN.from_dataframe(), libpysal.weights.Queen.from_shapefile(), libpysal.weights.KNN.from_shapefile() |
| spdep | poly2nb()+nb2list2(), knearneigh()+knn2nb()+nb2listw() |


**Test machine:**

For most testing jobs:

* Mac Pro (Later 2013)
* Processor: 2.7 GHz 12-Core Intel Xeon E5
* Memory: 64 GB 1866 MHz DDR3
* Graphic: AMD FirePro D700 6 GB

For pygeoda(arm64) on Apple Sillicon M1 chip

* MacBook Pro (13-inch, M1, 2020)
* Chip: Apple M1
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

Each test function will be executed 3 times, and the average executing time (in seconds with 6 digital decimals) will be recorded.

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
* 2.1.2 Using 4 CPU cores or 8 CPU threads
* 2.1.3 Using 8 CPU cores or 16 CPU threads
* 2.1.4 Weights creation
* 2.1.5 Memory Usage

(Unit: seconds; Average running time for 3 runs)

NOTE: for pygeoda(arm64) on Apple M1 chip, there are results only for "no parallelization" and "using 8 CPU threads" since Apple M1 chip has 8 total cores (4 performance and 4 efficiency).

See the spreadsheet: https://docs.google.com/spreadsheets/d/18zsN6JMGKCObf7DW0NlVQUJYEE4Qt3WTVkYuQ0pNZ-Y/edit?usp=sharing

### 2.1.1 No parallelization<sup>4</sup>

| Data | Permutations | GeoDa GPU | libgeoda | pygeoda | rgeoda | spdep | pygeoda (lookup-table) | rgeoda (lookup-table) | pygeoda-AppleM1 (complete) |
|------|--------------|-----------|----------|---------|--------|-------|------------------------|-----------------------|----------------------------|
|Natregimes|999|0.06666666667|0.570333|0.5861863295|0.597|1.314|0.04602972666|0.054|0.1605165799|
|Natregimes|9999|0.4303333333|5.76967|5.894174417|5.90|9.22|0.4580373764|0.478|1.556330681|
|Natregimes|99999|4.077333333|56.616|58.42296004|57.196|89.39866667|4.580973943|4.477666667|15.68434167|
|US-SDOH|999|0.309|16.849|17.30434664|17.188|77.53933333|1.876623313|2.525|4.108779351|
|US-SDOH|9999|2.897666667|166.898|172.4183534|174.760|383.189|18.74490062|19.428|41.89048203|
|US-SDOH|99999|28.05333333|1675.58|1709.570349|1734.242|3465.897|215.611668|248.4403333|426.1011527|
|NYC|999|1.753666667|27.6187|28.45079025|28.814|138.8043333|3.535606623|3.68|8.06589365|
|NYC|9999|17.41733333|273.915|282.0992463|285.253|502.8656667|34.31966758|34.90566667|80.29664334|
|NYC|99999|50.59|2782.88|2814.519481|2850.638|4275.771333|453.8002907|492.5203333|838.5820987|
|Chicago|999|0.8403333333|108.819|113.7595565|113.233|1339.121333|13.85470406|14.99833333|27.22306705|
|Chicago|9999|5.342666667|1088.7|1153.4873|1137.660|3503.14|134.816866|134.4793333|276.7192132|
|Chicago|99999|52.83633333|10830.4|13514.23282|13189.34033|>5hours|1354.542644|1337.711333|2826.268243|

<sup>4</sup>PySAL/ESDA uses Moran_Local() function with parameters: keep_simulations=False and n_jobs=1.
The Numba package is not installed. The n_jobs=1 parameter is used to explicitly set not using multi-threading on the function. However, the Moran_Local() function still takes 12 CPU cores (specifically 12 CPU threads) to run its sub-function `_prepare_univariate()` in parallel on the testing machine. Therefore, the running time of PySAL/ESDA is moved to table in 2.1.3

### 2.1.2 Using 4 CPU cores or 8 CPU threads (hyper-threading)<sup>5</sup>

| Data | Permutations | GeoDa GPU | libgeoda | pygeoda | rgeoda | spdep | pygeoda (lookup-table) | rgeoda (lookup-table) | pygeoda-AppleM1 (complete) |
|------|--------------|-----------|----------|---------|--------|-------|------------------------|-----------------------|----------------------------|
|Natregimes|999|0.06666666667|0.084|0.08737667402|0.109|0.5746666667|0.008454958598|0.01633333333|0.03832832972|
|Natregimes|9999|0.4303333333|0.830333|0.8471396764|0.909|3.084|0.06996099154|0.078|0.3403144677|
|Natregimes|99999|4.077333333|8.37|8.611579974|8.498|27.57366667|0.6632655462|0.6653333333|3.408513467|
|US-SDOH|999|0.309|2.521|2.524351994|2.760|26.18133333|0.2906908989|0.4236666667|0.9343883991|
|US-SDOH|9999|2.897666667|24.654|24.97697441|25.927|128.4393333|2.727758964|2.943|9.552996079|
|US-SDOH|99999|28.05333333|248.595|249.5261346|253.039|1144.179667|27.48555231|29.12133333|98.13868761|
|NYC|999|1.753666667|4.31167|4.287986279|4.487|45.63833333|0.5528754393|0.6826666667|1.937014182|
|NYC|9999|17.41733333|42.0707|42.35134069|43.281|170.3116667|5.123643319|5.388666667|19.60354439|
|NYC|99999|50.59|424.6791393|418.525|431.787|1406.528667|56.57580392|60.02066667|206.378281|
|Chicago|999|0.8403333333|16.5197|16.51535312|17.137|407.7156667|2.2724394|2.587333333|7.576208989|
|Chicago|9999|5.342666667|159.269|161.4538433|164.331|949.7773333|19.51306844|20.197|72.33786313|
|Chicago|99999|52.83633333|1589.36|1629.589604|1640.682|6927.177|191.0071477|193.1073333|809.6136088|

<sup>5</sup>spdep does multi-processing for parallalization instead of multi-threading that used in pygeoda/rgeoda. On this test machine, each CPU core has 2 CPU threads. For testing spdep, the function localmoran_perm() is called after setting up using 4 CPU cores and 8 CPU cores:
```Rupdate 
# using 4 CPU cores
set.coresOption(4) 
# using 8 CPU cores
set.coresOption(8) 
``` 
### 2.1.3 Using 8 CPU cores or 16 CPU threads (hyper-threading)

| Data | Permutations | GeoDa GPU | libgeoda |pygeoda | rgeoda | spdep | PySAL/ESDA | pygeoda (lookup-table) | rgeoda (lookup-table) |
|------|--------------|-----------|----------|--------|--------|-------|------------|------------------------|-----------------------|
|Natregimes|999|0.06666666667|0.0586667|0.05985840162|0.0793|0.4123333333|0.5129142602|0.006822745005|0.015|
|Natregimes|9999|0.4303333333|0.580333|0.5781105359|0.585|1.875333333|2.478509982|0.05192867915|0.061|
|Natregimes|99999|4.077333333|5.70267|5.664550781|5.772|15.29533333|28.37590798|0.4838843346|0.496|
|US-SDOH|999|0.309|1.77233|1.726169745|1.860|16.36433333|23.15247003|0.2171577613|0.3186666667|
|US-SDOH|9999|2.897666667|17.4743|16.95118411|17.079|70.43233333|69.00951242|2.014290571|2.120666667|
|US-SDOH|99999|28.05333333|166.635|165.9426964|166.148|608.695|702.7699699|20.96293465|21.02633333|
|NYC|999|1.753666667|2.97567|2.897502263|3.083|28.68066667|47.00624776|0.3977809747|0.5156666667|
|NYC|9999|17.41733333|28.3143|28.33021959|28.872|96.24366667|129.1338846|3.816352606|3.964333333|
|NYC|99999|50.59|289.036|280.0743279|282.211|761.3146667|1352.874198|41.43982744|42.481|42.481|
|Chicago|999|0.8403333333|11.6433|11.80314898|11.701|275.6243333|471.7471529|1.847482602|2.009|
|Chicago|9999|5.342666667|109.078|113.620623|111.078|560.1833333|720.8917576|15.56285644|15.737|
|Chicago|99999|52.83633333|1100.37|1131.008971|1175.597333|3651.002333|4456.907564|152.6243389|149.5633333|

### 2.1.4 Weights Creation

| Data | libgeoda |pygeoda | PySAL (from_dataframe) | rgeoda | spdep | PySAL (from_shapefile) | pygeoda (Apple M1) |
|------|----------|--------|------------------------|--------|-------|------------------------|--------------------|
| Natregimes | 0.025 | 0.02688233058| 0.7145156066| 0.498| 2.667666667| 0.3945383231| 0.01253199577 |
| US-SDOH | 0.8543333333 | 0.9045639833| 34.34305215| 40.06166667|868.514|21.06307236| 0.4436721802|
| NYC | 1.165? | 1.272605975 | 19.53454574 | 3.496 | 2072.118 | 13.52057767|0.5766201019|
|Chicago | 3.1495? | 3.517646313| 30.32266418 | 6.466333333 | 13313.13367 | 22.42620635|1.776056051|



NOTE: The first-time call of queen_weights() or knn_weights() includes a procedure to convert sf geometry objects (wkb) to an internally used object of rgeoda. 


### 2.1.5 Memory Usage

The `/usr/bin/time -l` command is used to get the "**maximum resident set size**" (the peak memory used by the process on the test machine).

result_memory_usage.txt

Natregimes:

| Software | Permutations | Single Thread | 
|----------|--------------|---------------|
| pygeoda  | 999 | 72.75 Mb |
| pysal    | 999 | 173.0664063 Mb |
| rgeoda   | 999 | 151.3710938 Mb |
| spdep    | 999 | 468.3359375 Mb <sup>6</sup>|
| pygeoda  | 9999 | 199.2578125 Mb |
| pysal    | 9999 | 163.4492188 Mb |
| rgeoda   | 9999 | 151.3710938 Mb |
| spdep    | 9999 | 684.8046875 Mb |
| pygeoda  | 99999 | 84.0625 Mb |
| pysal    | 99999 | 440.2929688 Mb |
| rgeoda   | 99999 | 155.4882813 Mb |
| spdep    | 99999 | 1314.460938 Mb |

<sup>6</sup>Since spdep uses multiple-processing for parallization, 
each spawn process will have a separated (copied) memeory space. When running the spdep with 4 CPU cores, the total peak memory usage could be 4 x ~460Mb = ~1840Mb.

US-SDOH:

| Software | Permutations | Single Thread | 
|----------|--------------|---------------|
| pygeoda  | 999 | 409.3867188 Mb |
| pysal    | 999 | 1786.71875 Mb |
| rgeoda   | 999 | 747.8476563 Mb |
| spdep    | 999 | 4150.246094 Mb |

## 2.2 Detailed Information:

### Test results

libgeoda C++ results: result_libgeoda_complete.txt, result_libgeoda_lookup.txt

### 1. Natregimes


* Desktop GeoDa using GPU (permutation_method="complete")

logger_geoda_gpu_NAT.txt

| Permutations | 1st run | 2nd run | 3rd run |
|--------------|---------|---------|---------|
| 999  | 0.069 | 0.065 | 0.066 |
| 9999  | 0.431 | 0.430 | 0.430 |
| 99999  | 4.072 | 4.074 | 4.086 |

* pygeoda (permutation_method="complete")

result_pygeoda_complete_1.txt
| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999    | 0.5914509296417236 | 0.08591008186340332 | 0.05975604057312012 | 
| 9999  | 6.03707218170166 | 0.8514440059661865 | 0.5646729469299316 | 
| 99999 | 58.92710328102112 | 8.485954999923706 | 5.570709943771362 | 

result_pygeoda_complete_2.txt
| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999    | 0.5823240280151367  | 0.08785891532897949 | 0.06045413017272949| 
| 9999  | 5.851770877838135 | 0.8463799953460693 | 0.5798778533935547 | 
| 99999 | 57.246336936950684 | 8.669429063796997 | 5.765250205993652 | 

result_pygeoda_complete_3.txt
| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999    | 0.5847840309143066  | 0.08836102485656738 | 0.059365034103393555| 
| 9999  | 5.793680191040039 | 0.843595027923584 | 0.5897808074951172 | 
| 99999 | 59.09543991088867 | 8.67935585975647 |  5.657692193984985 | 

* pygeoda using permutation_method="lookup-table"

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999    | 0.05076098442077637 | 0.009467840194702148 | 0.007524013519287109 | 
| 9999  | 0.49645209312438965| 0.07634782791137695| 0.05653190612792969| 
| 99999 | 4.989437103271484  | 0.6796438694000244  | 0.5439951419830322| 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999    | 0.043720245361328125 | 0.007912158966064453 | 0.006490230560302734 | 
| 9999  | 0.44381117820739746| 0.06636810302734375| 0.04943704605102539| 
| 99999 | 4.413371801376343  | 0.6548998355865479 | 0.44294190406799316| 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999    |0.04360795021057129 | 0.00798487663269043| 0.006453990936279297| 
| 9999  |0.43384885787963867 |0.06716704368591309|0.04981708526611328|
| 99999 |4.340112924575806 |0.6552529335021973|0.46471595764160156|

* PySAL/ESDA without Numba (No multi-threading)

| Permutations | 1st run  | 2nd run | 3rd run |
|--------------|----------|---------|---------|
| 999  |0.5763969421386719 |0.48716282844543457 |0.47518301010131836 |
| 9999  | 2.856947898864746  |2.2893621921539307 |2.289219856262207 |
| 99999  | 32.94658708572388 |26.458045959472656 |25.723090887069702 |

* PySAL/ESDA with Numba cx

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999    | 4.20540714263916  | 8.051929950714111  | 11.0227689743042  | 
| 9999  | 5.640074968338013 | 9.817737817764282 | 12.505669832229614 | 
| 99999 | ??? | | | 

* rgeoda (permutation_method="complete")

(Average from 3 rounds test)

result_rgeoda_3runs_noChicago.txt
| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 0.5973333333  |  0.1086666667 | 0.07933333333  | 
| 9999  | 5.900666667  | 0.909  | 0.585  | 
| 99999  | 57.19633333  | 8.498333333  | 5.772333333 | 

* spdep 

(spdep uses multi-processing programming to parallel the local moran computation)

result_spdep_1.txt
| Permutations | No parallel   | 4 Cores       | 8 Cores        | 
|--------------|---------------|---------------|----------------|
| 999  |1.271  | 0.618 | 0.434 |
| 9999  | 9.714  | 3.492  | 1.956  |
| 99999  | 97.019  | 33.408  | 18.353 |

result_spdep_2.txt
| Permutations | No parallel   | 4 Cores       | 8 Cores        | 
|--------------|---------------|---------------|----------------|
| 999  |1.322   | 0.563  | 0.409 |
| 9999  | 8.895   | 3.164  | 2.179  |
| 99999  | 83.868  | 24.320   | 13.872  |

result_spdep_4.txt
| Permutations | No parallel   | 4 Cores       | 8 Cores        | 
|--------------|---------------|---------------|----------------|
| 999  | 1.349  |0.543  | 0.394 |
| 9999  | 9.051 |2.596 |1.491 | 
| 99999  | 87.309|24.993 |13.661 | 

* rgeoda (permutation_method="lookup")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 0.061   |  0.018  | 0.016   | 
| 9999  | 0.528  | 0.081   | 0.070   | 
| 99999  | 4.954   | 0.695   | 0.549   | 

* rgeoda (permutation_method="lookup")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 0.05  |  0.015 | 0.014  | 
| 9999  | 0.467 | 0.0740  | 0.057  | 
| 99999  | 4.256   | 0.648  | 0.468  | 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999|0.051 | 0.016| 0.015 |
|9999|0.439 | 0.079|0.056  |
|99999|4.223 | 0.653| 0.471 |

### 2. US-SDOH

* Desktop GeoDa using GPU (permutation_method="complete")

logger_geoda_gpu_SDOH.txt

| Permutations | 1st run | 2nd run | 3rd run |
|--------------|---------|---------|---------|
| 999  | 0.306 | 0.310 | 0.311 |
| 9999  | 2.783| 2.974 | 2.936 |
| 99999  | 28.222| 28.019 | 27.919|

* pygeoda (permutation_method="complete")

result_pygeoda_complete_1.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999   | 17.454599857330322  | 2.4892380237579346| 1.6712172031402588|
| 9999 | 175.07298302650452 | 25.021250009536743 | 16.907100200653076|
| 99999  | 1727.7120940685272| 248.83428502082825| 166.1402678489685|

result_pygeoda_complete_2.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999   | 16.955991983413696  | 2.5823659896850586| 1.8001430034637451|
| 9999 | 168.69814705848694 | 24.859066247940063 | 16.953636169433594|
| 99999  | 1686.857502937317| 249.39736485481262| 165.59566617012024|

result_pygeoda_complete_3.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999   | 17.502448081970215  | 2.5014519691467285| 1.7071490287780762| 
| 9999 | 173.4839301109314 | 25.050606966018677 | 16.99281597137451|
| 99999  | 1714.141450881958| 250.3467538356781| 166.0921552181244|

* pygeoda (permutation_method="lookup-table")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999   | 2.0331978797912598 | 0.30008673667907715| 0.23631691932678223 |
| 9999 | 20.22104287147522 | 2.7842931747436523 | 2.2208046913146973|
| 99999  | 278.66816306114197 | 29.182877779006958  | 23.67146110534668  |

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999|1.8016300201416016  | 0.28637003898620605|0.20919442176818848 |
|9999| 18.03659701347351|2.678987741470337 | 1.8401479721069336|
|99999| 188.99081778526306|26.508763074874878 | 19.8468918800354|

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999|1.7950420379638672 |0.2856159210205078 | 0.2059619426727295|
|9999| 17.977061986923218|2.7199959754943848 |1.9819190502166748 |
|99999|179.1760232448578  |26.765016078948975 | 19.370450973510742|

* PySAL/ESDA without Numba (No multi-threading)

NOTE: `keep_simulations=False` to avoid out of memory issue

result_pysal_1/2/3.txt
| Permutations | 1st run  | 2nd run | 3rd run |
|--------------|----------|---------|---------|
| 999  | 22.939248085021973 | 23.320177793502808 |23.197984218597412 |
| 9999  | 68.79567408561707|68.48119711875916 |69.75166606903076 |
| 99999  |  664.0670731067657 |736.4576556682587|707.7851810455322 |

* rgeoda (permutation_method="complete")

result_rgeoda_3runs_noChicago.txt
(Average from 3 rounds test)

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 17.18766667 | 2.760666667 | 1.860333333  | 
| 9999  | 174.7603333 | 25.927 | 17.07933333 | 
| 99999  | 1734.242  | 253.039 | 166.1483333  | 

* spdep

result_spdep_1.txt
| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  | 78.861 | 28.678 | 17.504  |
| 9999  | 394.205  | 159.013  | 86.205  |
| 99999  | 3517.074  | 1435.823  | 766.686 |

result_spdep_2.txt
| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  | 75.336|23.962  |15.469  |
| 9999  |370.892 | 110.437  | 62.620  |
| 99999  |3346.190  |978.384 |530.585  |

result_spdep_4.txt
| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999 |78.421 |25.904 |16.120 |
| 9999|384.470 |115.868 |62.472 |
|99999|3534.427  |1018.332 | 528.814|

* rgeoda (permutation_method="lookup")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 2.185    |  0.432   | 0.345    | 
| 9999  | 21.004   | 3.039    | 2.402    | 
| 99999  | 373.949    | 31.582    | 23.572    | 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 2.715    |  0.374  | 0.2910    | 
| 9999  | 18.154   | 2.831  | 1.952  | 
| 99999  | 186.359   | 27.788   | 19.7560    | 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999| 2.675| 0.465 |0.320 |
|9999| 19.126|2.959 |2.008  |
|99999| 185.013 |27.994 |19.751 |

### 3. NYC

* Desktop GeoDa using GPU (permutation_method="complete")

logger_geoda_gpu_NYC.txt

| Permutations | 1st run | 2nd run | 3rd run |
|--------------|---------|---------|---------|
| 999  | 1.787 | 1.740 | 1.734 |
| 9999  | 17.322| 17.622 | 17.308 |
| 99999  | 46.099| 52.831 | 52.840 |

* pygeoda (permutation_method="complete")

result_pygeoda_complete_1.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999   | 28.46846580505371  | 4.277080059051514 | 2.896711826324463 | 
| 9999 | 282.76479601860046| 42.7974419593811| 28.276558876037598  | 
| 99999  | 2821.240134000778 | 422.4912781715393 | 283.2045419216156 | 

result_pygeoda_complete_2.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999   | 28.80146622657776  | 4.268202781677246 | 2.8846561908721924 | 
| 9999 | 280.46854281425476| 42.28598403930664 | 28.225948810577393  | 
| 99999  | 2824.0770411491394 | 423.4444420337677 | 280.7923278808594  | 

result_pygeoda_complete_3.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999   | 28.082438707351685  | 4.318675994873047 | 2.9111387729644775 | 
| 9999 | 283.06440019607544| 41.97059607505798 | 28.48815107345581  | 
| 99999  | 2798.241266965866 | 428.10169768333435 | 276.2261140346527 | 

* pygeoda (permutation_method="lookup-table")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 3.9321858882904053 | 0.5913081169128418  | 0.45052385330200195 | 
| 9999  | 37.25004291534424 | 5.340345859527588 | 4.245307922363281  | 
| 99999  | 656.4548988342285 | 62.88683271408081 | 48.3938422203064 | 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999| 3.389691114425659|0.5356402397155762| 0.3721961975097656|
|9999|33.0835177898407  | 4.975275993347168| 3.612794876098633|
|99999| 359.7893280982971| 53.48566174507141| 37.71713399887085|

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999|3.284942865371704 |0.5316779613494873 | 0.3706228733062744 |
|9999| 32.625442028045654| 5.055308103561401| 3.5909550189971924|
|99999| 345.15664529800415|53.35491728782654 |  38.20850610733032|


* PySAL/ESDA 

result_pysal_1.txt  result_pysal_2.txt result_pysal_3.txt

| Permutations | 1st run  | 2nd run | 3rd run |
|--------------|----------|---------|---------|
| 999  |47.61773729324341 |46.0396671295166 |47.36133885383606 |
| 9999  | 125.48144698143005 |132.58697986602783 |129.3332269191742 |
| 99999  | 1302.5638799667358 |1396.2914578914642|1359.767255783081 |


* rgeoda (permutation_method="complete")

result_rgeoda_3runs_noChicago.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 28.814  | 4.486666667 | 3.083333333  | 
| 9999  | 285.2526667 | 43.28133333 | 28.87166667 | 
| 99999  | 2850.638  | 431.7873333|282.2106667 | 

* spdep

result_spdep_1.txt
| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  | 143.273 | 49.197 | 30.782  |
| 9999  | 518.500 | 206.445  | 113.492  |
| 99999  | 4254.713 | 1745.632  | 933.819  |

result_spdep_2.txt
| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  |132.710  |42.543 | 26.720 |
| 9999  | 477.047|149.024 | 87.095 |
| 99999  |4235.111 | 1225.555 | 687.102 |

result_spdep_4.txt
| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  |140.43 |45.175| 28.54 |
| 9999  | 513.05|155.466 | 88.144 |
| 99999  |4337.49 | 1248.399 | 663.023 |

* rgeoda (permutation_method="lookup")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 4.074    |  0.706    | 0.567     | 
| 9999  | 37.748    | 5.500     | 4.387     | 
| 99999  | 735.241     | 68.873     | 48.744     | 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 3.472   |  0.666   | 0.516 | 
| 9999  | 33.2980   | 5.304   | 3.762 | 
| 99999  | 357.5210   | 56.234 | 38.686  | 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999|3.494 |0.676 |  0.464|
|9999|  33.671| 5.362| 3.744|
|99999|384.799 |54.955  |40.013 |

### 4. Chicago (knn=10)

* Desktop GeoDa using GPU (permutation_method="complete")

logger_geoda_gpu_CHI.txt

| Permutations | 1st run | 2nd run | 3rd run |
|--------------|---------|---------|---------|
| 999  | 0.850 | 0.845 | 0.826 |
| 9999  | 5.143 | 5.413 | 5.472 |
| 99999  | 52.836| 52.836 | 52.837 |

* pygeoda (permutation_method="complete")

result_pygeoda_complete_1.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999   | 119.42543983459473 | 16.434907913208008  |12.032907962799072 | 
| 9999  | 1222.1919560432434 | 162.7958836555481 | 120.59185600280762| 
| 99999  |  13525.546596050262 | 1605.97736287117 | 1161.3201611042023   | 

result_pygeoda_complete_2.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999   | 110.09417772293091 | 16.643314361572266  |11.75134801864624 | 
| 9999  | 1105.2691671848297 | 161.012845993042 | 109.39576888084412| 
| 99999  |  11064.583874940872 | 1635.1613550186157 | 1124.493618965149  | 

result_pygeoda_complete_3.txt

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999   | 111.75905203819275 | 16.46783709526062  |11.62519097328186 | 
| 9999  | 1133.0007779598236 | 160.55280017852783| 110.87424397468567| 
| 99999  |  15952.567998170853 | 1647.6300950050354 | 1107.213131904602 | 

* pygeoda (permutation_method="lookup-table")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999  | 14.267882108688354| 2.284726142883301| 1.8891620635986328 | 
| 9999 | 140.48916697502136 | 19.4720401763916 | 16.17879605293274 | 
| 99999  | 1449.7298228740692 | 191.051757812  | 164.23768401145935 | 

result_pygeoda_lookup_2.txt
| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads |
|--------------|---------------|---------------|----------------|
| 999  |13.469430923461914 |2.273153066635132| 1.832197904586792|
| 9999 | 132.1586151123047|19.551851987838745| 15.13193130493164|
| 99999  | 1305.104752779007 |190.86125826835632 | 147.06435203552246| 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999| 13.826799154281616|2.259438991546631 | 1.8210878372192383|
|9999|131.80281591415405 | 19.515313148498535| 15.37784194946289|
|99999| 1308.7933557033539| 191.1084270477295| 146.57098078727722|

* PySAL/ESDA 

| Permutations | 1st run  | 2nd run | 3rd run |
|--------------|----------|---------|---------|
| 999  |  488.52151322364807 | 421.1374022960663| 505.58254313468933|
| 9999  | 727.2412669658661 | 646.2213499546051| 789.2126560211182|
| 99999  | 3937.0313351154327 | 5037.343729972839| 4396.347628116608 |

* rgeoda (permutation_method="complete")

result_rgeoda_3runs_noChicago.txt
| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 113.233  | 17.13666667 | 11.70133333 | 
| 9999  | 1137.66 | 164.331 | 111.0776667 | 

99999 Chicago (result_rgeoda_1/2/3_Chicago.txt)
| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 99999  | 12497.949 | 1613.119 | 1318.064 | 
| 99999  | 13916.134 | 1610.862 | 1120.153|
| 99999  | 13153.938 | 1698.065 | 1088.575|
 
* spdep 

result_spdep_1.txt

| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  | 1296.269 | 563.027 | 407.151 |
| 9999  | 3471.978| 929.183 | 490.794  |
| 99999  | >5 hours |6658.492  |3542.397 |

result_spdep_chicago2-3.txt
| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  | 1111.817| 328.786 | 209.526|
| 9999  | 3534.302 |959.811 |593.189 |
| 99999  | > 5 hours |7076.392 |3829.577 |

result_spdep_chicago2-3.txt
| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  | 1252.801| 331.334| 210.196 |
| 9999  | 3531.298 | 960.338|596.567 |
| 99999  | >5 hours | 7046.647|3581.033 |

* rgeoda (permutation_method="lookup-table")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999| 14.444|2.531 | 2.000|
|9999| 136.772| 19.948 |15.488 |
|99999|1357.252 | 193.11|148.234 |

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 16.675 | 2.701 | 1.974 | 
| 9999  | 133.7570 | 20.627| 15.9160 | 
| 99999  | 1325.492 | 193.2830 | 149.602 | 

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
|999|13.876 |2.530 | 2.053 |
|9999| 132.909 | 20.016| 15.807|
|99999| 1330.390|192.929  | 150.854 |

Weights creation:

pygeoda
| Data | 1st | 2nd | 3rd |
|------|-----|-----|-----|
| Natregimes | 0.026614904403686523 | 0.0269010066986084| 0.027131080627441406 |  
| US_SDOH | 0.9127089977264404|0.8969571590423584|0.9040257930755615|
| NYC | 1.2957468032836914 | 1.2584800720214844 | 1.2635910511016846 |
| Chicago | 3.445451021194458 | 3.462280035018921 | 3.6452078819274902 |

PySAL (libpysal.weights.Queen.from_dataframe(), libpysal.weights.KNN.from_dataframe())

| Data | 1st | 2nd | 3rd |
|------|-----|-----|-----|
| Natregimes | 0.6798999309539795 | 0.7444601058959961 | 0.7191867828369141 |
| US-SDOH | 34.027106046676636 |  34.312164068222046 | 34.68988633155823 |
| NYC |  19.808083057403564 | 19.361562252044678 | 19.4339919090271|
| Chicago | 28.692863941192627 | 30.992489337921143 | 31.282639265060425|

PySAL (libpysal.weights.Queen.from_shapefile(), libpysal.weights.KNN.from_shapefile())

| Data | 1st | 2nd | 3rd |
|------|-----|-----|-----|
| Natregimes | 0.3972747326 | 0.3956239223 | 0.3907163143 |
| US-SDOH | 20.96529508 |  21.3335681 | 20.89035392 |
| NYC |  13.87179804 | 13.38210988 | 13.30782509|
| Chicago | 22.30173087 | 22.68425012 | 22.29263806|

rgeoda
| Data | 1st | 2nd | 3rd |
|------|-----|-----|-----|
| Natregimes | 0.494 | 0.486 | 0.514|
| US_SDOH | 40.279 | 39.845 | 40.061|
| NYC | 3.459 | 3.505 | 3.524 |
| Chicago | 6.428 |  6.578 |  6.393|


spdep

| Data | 1st | 2nd | 3rd |
|------|-----|-----|-----|
| Natregimes | 2.676 | 2.661 | 2.666|
| US_SDOH | 791.513| 907.075 | 906.954|
| NYC |2020.326 | 2054.080  | 2141.948|
| Chicago | 13181.457 | 12974.014  | 13783.930 |
