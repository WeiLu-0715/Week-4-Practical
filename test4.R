intall.packages("here")
install.packages("here")
install.packages("sf")
library(sf)
library(here)
st_layers(here("prac3_data", "gadm41_AUS.gpkg"))
st_layers(here("Week 3", "gadm41_AUS.gpkg"))
st_layers(here("Week 3 Practical", "gadm41_AUS.gpkg"))
st_layers(here("gadm41_AUS.gpkg"))
Ausoutline <- st_read(here("gadm41_AUS.gpkg"),
                      layer='ADM_ADM_0')
print(Ausoutline)
st_crs(Ausoutline)$proj4string
Ausoutline <- Ausoutline %>%
  st_set_crs(., 4326)
st_set_crs()
#or more concisely
Ausoutline <- st_read(here("prac3_data", "gadm41_AUS.gpkg"),
                      layer='ADM_ADM_0') %>%
  st_set_crs(4326)
#or more concisely
Ausoutline <- st_read(here("gadm41_AUS.gpkg"),
                      layer='ADM_ADM_0') %>%
  st_set_crs(4326)
AusoutlinePROJECTED <- Ausoutline %>%
  st_transform(.,3112)
print(AusoutlinePROJECTED)
#From sf to sp
AusoutlineSP <- Ausoutline %>%
  as(., "Spatial")
install.packages(sp)
install.packages("sp")
library("sp")
Hide#From sf to sp
#From sf to sp
AusoutlineSP <- Ausoutline %>%
  as(., "Spatial")
#From sp to sf
AusoutlineSF <- AusoutlineSP %>%
  st_as_sf()
install.packages(terra)
install.packages("terra")
library("terra")
install.packages("raster")
library("raster")
jan<-terra::rast(here("prac3_data", "wc2.1_5m_tavg_01.tif"))
jan<-terra::rast(here("Week 3","Practical 2 World Clim","wc2.1_5m_tavg_01.tif"))
jan<-terra::rast(here("wc2.1_5m_tavg_01.tif"))
# have a look at the raster layer jan
jan
plot(jan)
# set the proj 4 to a new object
pr1 <- terra::project(jan, "+proj=moll +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")
plot(pr1)
View(pr1)
View(jan)
View(pr1)
pr1 <- pr1 %>%
  terra::project(., "+proj=longlat +datum=WGS84 +no_defs +type=crs")
plot(pr1)
install.packages("fs")

library("fs")
# look in our folder, find the files that end with .tif and
library(fs)
dir_info("prac3_data/")
dir_info()
install.packages("dplyr")
install.packages("stringr")
library("stringr")
library("dplyr")
# look in our folder, find the files that end with .tif and
dir_info("Week 3 Practical")
dir_info("week3")
dir_info("data")
dir_info("week3","data")

dir_info("D:/0005/week3/data")
dir_info("D:/0005/week3/Week 3 Practical")
install.packages("tideverse")
install.packages("tidyverse")
library("tidyverse")
library(tidyverse)
listfiles<-dir_info("week3/") %>%
  filter(str_detect(path, ".tif")) %>%
  dplyr::select(path)%>%
  pull()
listfiles<-dir_info("D:\0005\week3\data") %>%
  listfiles<-dir_info("D:/0005/week3/data") %>%
  filter(str_detect(path, ".tif")) %>%
  dplyr::select(path)%>%
  pull()
#have a look at the file names
listfiles
worldclimtemp <- listfiles %>%
  terra::rast()
#have a look at the raster stack
worldclimtemp
# access the january layer
worldclimtemp[[1]]
month <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
           "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
names(worldclimtemp) <- month
worldclimtemp$Jan
site <- c("Brisbane", "Melbourne", "Perth", "Sydney", "Broome", "Darwin", "Orange",
          "Bunbury", "Cairns", "Adelaide", "Gold Coast", "Canberra", "Newcastle",
          "Wollongong", "Logan City" )
lon <- c(153.03, 144.96, 115.86, 151.21, 122.23, 130.84, 149.10, 115.64, 145.77,
         138.6, 153.43, 149.13, 151.78, 150.89, 153.12)
lat <- c(-27.47, -37.91, -31.95, -33.87, 17.96, -12.46, -33.28, -33.33, -16.92,
         -34.93, -28, -35.28, -32.93, -34.42, -27.64)
#Put all of this inforamtion into one list
samples <- data.frame(site, lon, lat, row.names="site")
# Extract the data from the Rasterstack for all points
AUcitytemp<- terra::extract(worldclimtemp, samples)
Perthtemp <- Aucitytemp2 %>%
  filter(site=="Perth")

#testtest