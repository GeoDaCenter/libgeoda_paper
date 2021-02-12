import pygeoda

sdoh = pygeoda.open("./data/us-sdoh-2014-chi_utm.shp")
ses = sdoh.GetRealCol("1_SES")
mob = sdoh.GetRealCol("2_MOB")
urb = sdoh.GetRealCol("3_URB")
mica = sdoh.GetRealCol("4_MICA")

data = (ses, mob, urb, mica)
chsdoh = pygeoda.neighbor_match_test(sdoh, data, 8)
print(chsdoh)