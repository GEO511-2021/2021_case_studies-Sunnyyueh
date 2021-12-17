library(ggplot2)
library(tidyverse)
dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"
temp=read_table(dataurl,
                skip=3, #skip the first line which has column names
                na="999.90", # tell R that 999.90 means missing in this dataset
                col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                              "APR","MAY","JUN","JUL",  
                              "AUG","SEP","OCT","NOV",  
                              "DEC","DJF","MAM","JJA",  
                              "SON","metANN"))
 
ggplot(data=temp,aes(x=YEAR,y=JJA))+
  geom_line(na.rm=TRUE)+
  #geom_smooth(col="red",fill="yellow")+
  geom_smooth(formula= y~x,method= "loess",col="red", na.rm=TRUE)+
  xlab("Year")+
  ylab("Mean summer temperature(c)")+
  ggtitle("Mean summer temperature in Buffalo, NY")+
  labs(subtitle = "Summer \nnew line")
theme(plot.title = element_text(face="bold",size=15,hjust = 0.5), axis.title = element_text(size=10))
#labs(title="Mean summer temperature in Buffalo, NY",x="Year",y="Mean summer temperature(c)")

#span 

ggsave("climate.png")

png("climate2.png")
dev.off()
