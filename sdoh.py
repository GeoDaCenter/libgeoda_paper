import pygeoda

sdoh = pygeoda.open("./data/us-sdoh-2014-chi_utm.shp")
v = ("1_SES", "2_MOB", "3_URB", "4_MICA")
chsdoh = pygeoda.neighbor_match_test(sdoh, v, 8)
print(chsdoh)