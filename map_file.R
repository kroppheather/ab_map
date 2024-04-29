library(terra)

wb <- vect("G:/My Drive/GIS/natural_earth/ne_10m_admin_0_countries")
plot(wb)
###### figure director ----
dirSave <- "G:/My Drive/research/projects/Kolyma/manuscript/figures"


#read in permafrost shapefile
shapeC <- vect("G:/My Drive/GIS/NSIDC/NSIDC/cont_dissolve.shp")
shapeD <- vect("G:/My Drive/GIS/NSIDC/NSIDC/discont_dissolve.shp")
shapeS <- vect("G:/My Drive/GIS/NSIDC/NSIDC/spor_dissolve.shp")
#######################################
#####projection                   ##### 
#######################################


ext <- c(-180,180,35,90)
worldC <- crop(wb, ext)
custP <- crs(shapeC)
worldPolar <- project(worldC,custP)
plot(worldPolar)


plot(worldPolar,
     col="seashell4", border=NA, 
     background="#B3D6E655")

plot(shapeC, add=TRUE, col="mediumpurple4", border=NA)
plot(shapeD, add=TRUE, col="mediumpurple3", border=NA)
plot(shapeS, add=TRUE, col="mediumpurple1", border=NA)
plot(graticule(lon=seq(-180,180, by=40), lat=seq(50,80, by=10), crs=custP),
     add=TRUE)
