library(tidyverse)
library(nycflights13)

airlines
flights<-flights
airports<-airports

far<-flights%>%
  arrange(desc(distance))%>%
  slice(1)


far2<-merge(x=far,y=airports, by.x="dest",by.y="faa",all.x=TRUE)


air_p<-airports
colnames(air_p)[1]<-"dest"


library(dplyr)
FAR= far %>% 
  left_join(air_p,by="dest")%>%
  select(name)

farthest_airport<-as.character(FAR)
