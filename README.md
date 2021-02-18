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
| pygeoda  |  local_moran() with permutation_method="complete" |
| pygeoda  |  local_moran() with permutation_method="lookup-table" |
| rgeoda   |  local_moran() with permutation_method="complete" |
| rgeoda   |  local_moran() with permutation_method="lookup-table" |
| pysal/esda |  Moran_Local() without Numba (No multi-threading) |
| pysal/esda |  Moran_Local() with Numba (multi-threading) |
| spedp |  localmoran_perm() using Multi-Processing |

* NOTE: permutation_method="complete" vs "lookup-table"

In "complete" permutation method, for example with 999 permutations,  each observation will find 999 groups of random neighbors which are used to compute a pseudo-p value.
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

## 2.1 Summary of Test Results

* 2.1.1 No parallelization
* 2.1.2 Using 4 CPU cores or 8 CPU threads
* 2.1.3 Using 8 CPU cores or 16 CPU threads

(Unit: seconds; Average running time for 3 runs)

### 2.1.1 No parallelization<sup>*</sup>

| Data | Permutations | GeoDa GPU | pygeoda (complete) | pygeoda (lookup-table) | PySAL/ESDA | rgeoda (complete) | spdep | rgeoda (lookup-table) |
|------|--------------|-----------|--------------------|------------------------|------------|-------------------|-------|-----------------------|
|Natregimes|999|||||0.597|||
|Natregimes|9999|||||5.90|||
|Natregimes|99999|||||57.196|||
|US-SDOH|999|||||17.188|||
|US-SDOH|9999|||||174.760|||
|US-SDOH|99999|||||1734.242|||
|NYC|999|||||28.814|||
|NYC|9999|||||285.253|||
|NYC|99999|||||2850.638|||
|Chicago|999||||||||
|Chicago|9999||||||||
|Chicago|99999||||||||

* <sup>*</sup>PySAL/ESDA uses Moran_Local() function with parameters: keep_simulations=False and n_jobs=1.
The Numba package is not installed. The n_jobs=1 parameter is used to explicitly set not using multi-threading on the function. However, the Moran_Local() function still takes all 12 cores to run its sub-function `_prepare_univariate()` in parallel on the testing machine.

### 2.1.2 Using 4 CPU cores or 8 CPU threads (hyper-threading)<sup>*</sup>

| Data | Permutations | GeoDa GPU | pygeoda (complete) | pygeoda (lookup-table) | PySAL/ESDA | rgeoda (complete) | spdep | rgeoda (lookup-table) |
|------|--------------|-----------|--------------------|------------------------|------------|-------------------|-------|-----------------------|
|Natregimes|999|||||0.109|||
|Natregimes|9999|||||0.909|||
|Natregimes|99999|||||9.498|||
|US-SDOH|999|||||2.760|||
|US-SDOH|9999|||||25.927|||
|US-SDOH|99999|||||253.039|||
|NYC|999|||||4.486666667|||
|NYC|9999|||||43.28133333|||
|NYC|99999||||||||
|Chicago|999||||||||
|Chicago|9999||||||||
|Chicago|99999||||||||

* <sup>*</sup>spdep does multi-processing for parallalization instead of hyper-threading that used in pygeoda/rgeoda. Therefore, the function localmoran_perm() is called after setting up using 4 CPU cores and 8 CPU cores:
```R
# using 4 CPU cores
set.coresOption(4) 
# using 8 CPU cores
set.coresOption(8) 
``` 
### 2.1.3 Using 8 CPU cores or 16 CPU threads (hyper-threading)<sup>*</sup>

| Data | Permutations | GeoDa GPU | pygeoda (complete) | pygeoda (lookup-table) | PySAL/ESDA | rgeoda (complete) | spdep | rgeoda (lookup-table) |
|------|--------------|-----------|--------------------|------------------------|------------|-------------------|-------|-----------------------|
|Natregimes|999|||||0.0793|||
|Natregimes|9999|||||0.585|||
|Natregimes|99999|||||5.772|||
|US-SDOH|999|||||1.860|||
|US-SDOH|9999|||||17.079|||
|US-SDOH|99999|||||166.148|||
|NYC|999|||||3.083|||
|NYC|9999|||||28.872|||
|NYC|99999||||||||
|Chicago|999||||||||
|Chicago|9999||||||||
|Chicago|99999||||||||

## 2.2 Supplementary Information:

### Test results

### 1. Natregimes


* Desktop GeoDa using GPU (permutation_method="complete")

| Permutations | GPU |
|--------------|-----|
| 999  | 0.069 |
| 9999  | 0.429 |
| 99999  | 4.085 |

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

* Pygeoda using permutation_method="lookup-table"

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999    | 0.05076098442077637 | 0.009467840194702148 | 0.007524013519287109 | 
| 9999  | 0.49645209312438965| 0.07634782791137695| 0.05653190612792969| 
| 99999 | 4.989437103271484  | 0.6796438694000244  | 0.5439951419830322| 

* PySAL/ESDA without Numba (No multi-threading)

| Permutations | No Numba |
|--------------|----------|
| 999  |0.5763969421386719 |
| 9999  | 2.856947898864746  |
| 99999  | 32.94658708572388 |

* PySAL/ESDA with Numba cx

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999    | 4.20540714263916  | 8.051929950714111  | 11.0227689743042  | 
| 9999  | 5.640074968338013 | 9.817737817764282 | 12.505669832229614 | 
| 99999 | ??? | | | 

* rgeoda (permutation_method="complete")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 0.643  |  0.104 | 0.079  | 
| 9999  | 6.419  | 0.891  | 0.673  | 
| 99999  | 65.327  | 9.141  | 6.844  | 

* spdep 

(Using multi-processing, so no hyper-threading)

spdep uses multi-processing programming to parallel the local moran computation

| Permutations | No parallel   | 4 Cores       | 8 Cores        | 
|--------------|---------------|---------------|----------------|
| 999  |1.271  | 0.618 | 0.434 |
| 9999  | 9.714  | 3.492  | 1.956  |
| 99999  | 97.019  | 33.408  | 18.353 |

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

### 2. US-SDOH

* Desktop GeoDa using GPU (permutation_method="complete")

| Permutations | GPU |
|--------------|-----|
| 999  | 0.420 |
| 9999  | 2.790|
| 99999  | 28.089|

* pygeoda (permutation_method="complete")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 17.454599857330322  | 2.4892380237579346| 1.6712172031402588| |
| 9999 | 175.07298302650452 | 25.021250009536743 | 16.907100200653076| |
| 99999  | 1727.7120940685272| 248.83428502082825| 166.1402678489685| |

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 16.955991983413696  | 2.5823659896850586| 1.8001430034637451| |
| 9999 | 168.69814705848694 | 24.859066247940063 | 16.953636169433594| |
| 99999  | 1686.857502937317| 249.39736485481262| 165.59566617012024| |

* pygeoda (permutation_method="lookup-table")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 2.0331978797912598 | 0.30008673667907715| 0.23631691932678223 | |
| 9999 | 20.22104287147522 | 2.7842931747436523 | 2.2208046913146973| |
| 99999  | 278.66816306114197 | 29.182877779006958  | 23.67146110534668  | |


* PySAL/ESDA without Numba (No multi-threading)

NOTE: `keep_simulations=False` to avoid out of memory issue

| Permutations | No Numba |
|--------------|----------|
| 999  | 22.939248085021973 |
| 9999  | 68.79567408561707|
| 99999  |  664.0670731067657 |

* rgeoda (permutation_method="complete")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 27.756  | 2.760 | 2.195  | 
| 9999  | 185.212 | 25.342 | 17.780 | 
| 99999  | 1910.860    | 253.879  | 185.140  | 

* spdep

(Using multi-processing, so no hyper-threading)

| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  | 78.861 | 28.678 | 17.504  |
| 9999  | 394.205  | 159.013  | 86.205  |
| 99999  | 3517.074  | 1435.823  | 766.686 |

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

### 3. NYC

* Desktop GeoDa using GPU (permutation_method="complete")

| Permutations | GPU |
|--------------|-----|
| 999  | 1.691 |
| 9999  | 17.506|
| 99999  | 46.120|

* pygeoda (permutation_method="complete")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 28.46846580505371  | 4.277080059051514 | 2.896711826324463 | |
| 9999 | 282.76479601860046| 42.7974419593811| 28.276558876037598  | |
| 99999  | 2821.240134000778 | 422.4912781715393 | 283.2045419216156 | |

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 28.80146622657776  | 4.268202781677246 | 2.8846561908721924 | |
| 9999 | 280.46854281425476| 42.28598403930664 | 28.225948810577393  | |
| 99999  | 2824.0770411491394 | 423.4444420337677 | 280.7923278808594  | |

* pygeoda (permutation_method="lookup-table")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | 3.9321858882904053 | 0.5913081169128418  | 0.45052385330200195 | |
| 9999  | 37.25004291534424 | 5.340345859527588 | 4.245307922363281  | |
| 99999  | 656.4548988342285 | 62.88683271408081 | 48.3938422203064 | |

* PySAL/ESDA 

| Permutations | No Numba |
|--------------|----------|
| 999  |47.61773729324341 |
| 9999  | 125.48144698143005 |
| 99999  | 1302.5638799667358 |

* rgeoda (permutation_method="complete")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 32.052  | 4.582 | 3.203  | 
| 9999  | 319.400 | 43.551  | 31.251  | 
| 99999  | 3262.898    | 432.714  | 319.074 | 

* spdep

(Using multi-processing, so no hyper-threading)

| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  | 143.273 | 49.197 | 30.782  |
| 9999  | 518.500 | 206.445  | 113.492  |
| 99999  | 4254.713 | 1745.632  | 933.819  |

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

### 4. Chicago (knn=10)

* Desktop GeoDa using GPU (permutation_method="complete")

| Permutations | GPU |
|--------------|-----|
| 999  | 0.933 |
| 9999  | 5.456|
| 99999  | 52.452|

* pygeoda (permutation_method="complete")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 119.42543983459473 | 16.434907913208008  |12.032907962799072 | |
| 9999  | 1222.1919560432434 | 162.7958836555481 | 120.59185600280762| |
| 99999  |  13525.546596050262 | 1605.97736287117 | 1161.3201611042023   | |

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999   | 110.09417772293091 | 16.643314361572266  |11.75134801864624 | |
| 9999  | 1105.2691671848297 | 161.012845993042 | 109.39576888084412| |
| 99999  |  11064.583874940872 | 1635.1613550186157 | 1124.493618965149  | |

* pygeoda (permutation_method="lookup-table")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | Average |
|--------------|---------------|---------------|----------------|---------|
| 999  | 14.267882108688354| 2.284726142883301| 1.8891620635986328 | |
| 9999 | 140.48916697502136 | 19.4720401763916 | 16.17879605293274 | |
| 99999  | 1449.7298228740692 | 191.051757812  | 164.23768401145935 | |

* PySAL/ESDA 

| Permutations | No Numba |
|--------------|----------|
| 999  |  488.52151322364807 |
| 9999  | 727.2412669658661 |
| 99999  | 3937.0313351154327 |

* rgeoda (permutation_method="complete")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 128.734   | 16.890 | 13.451  | 
| 9999  | 1269.854 | 162.848 | 121.514  | 
| 99999  | 12497.949 | 1613.119 | 1318.064 | 

* spdep 

(Using multi-processing, so no hyper-threading)

| Permutations | Not Use Core | 4 Cores | 8 CPU Cores|
|--------------|--------------|---------|------------|
| 999  | 1296.269 | 563.027 | 407.151 |
| 9999  | ??? > 5 hours | | 683.451  |
| 99999  | | | |

* rgeoda (permutation_method="lookup-table")

| Permutations | Single Thread | 8 CPU Threads | 16 CPU Threads | 
|--------------|---------------|---------------|----------------|
| 999  | 16.675 | 2.701 | 1.974 | 
| 9999  | 133.7570 | 20.627| 15.9160 | 
| 99999  | 1325.492 | 193.2830 | 149.602 | 