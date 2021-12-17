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




D<-flights%>%
  group_by(dest)%>%
  summarise(mean_delay=mean(arr_delay,na.rm = TRUE))

df<-merge(x=D,y=airports, by.x="dest",by.y="faa",all.x=TRUE)
df<-df[complete.cases(df),]
out <- strsplit(as.character(df$tzone),'/')
a<-do.call(rbind, out)
df$country<-a[1,]

df<-filter(df, country=='America')

library("viridis")
ggplot(df,aes(lon,lat,color=mean_delay))+
  borders("state") +
  geom_point() +
  coord_quickmap()+
  scale_color_viridis( option = "D")+
  scale_fill_viridis() 
  

########
farthest_airport<-flights%>%
  select(distance,dest)%>%
  arrange(desc(distance))%>%
  slice(1)%>%
  left_join(airports,by=c("dest"="faa"))%>%
  select(name)%>%
  as.character()

#####





