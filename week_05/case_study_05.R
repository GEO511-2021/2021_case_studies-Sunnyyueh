library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)
library(dplyr)


   
data(world)  #load 'world' data from spData package
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)


library(ncdf4)
download.file("https://crudata.uea.ac.uk/cru/data/temperature/absolute.nc","crudata.nc")
tmean=raster("crudata.nc")

world<-filter(world, subregion!='Antarctica')
world<-as(world,"Spatial")

plot(tmax_monthly)

gain(tmax_monthly )<-0.1
tmax_annual<-max(tmax_monthly)
names(tmax_annual) <- "tmax"

max_tem_country<- raster::extract(tmax_annual, world, fun=max, na.rm=T, small=T, sp=T)
max_tem_country<- st_as_sf(max_tem_country)

ggplot(data = max_tem_country)+
  geom_sf(aes(fill=tmax))+
  scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)")+
  labs(title="The Annual Maximum Temperature\nfor Each Country")+ 
  xlab("Latitude")+
  ylab("Longitude")+
  theme(plot.title = element_text(face="bold",size=15,hjust = 0.5), axis.title = element_text(size=10))+
  theme(legend.position="bottom")

hottest_country<- max_tem_country%>%
  group_by(continent)%>%
  top_n(tmax,n=1)%>%
  select(name_long,continent,tmax)%>%
  arrange(desc(tmax))%>%
  st_set_geometry(NULL)


hottest_country

