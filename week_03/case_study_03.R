library(ggplot2); library(gapminder); library(dplyr)
data<-gapminder
data<-filter(data, country!='Kuwait')


par(mfrow=c(2,1))
up<-ggplot(data=data,aes(y=gdpPercap, x=lifeExp))+
  geom_point(aes(color=continent,size=pop/100000))+
  scale_y_continuous(trans = "sqrt")+
  facet_wrap(~year,nrow=1)+
  theme_bw()+
  xlab("Life Expectancy")+
  ylab("GPD per capita")+
  labs(size='Populaiton (100k)')


gapminder_continent<-data%>%
  group_by (continent,year)%>%
  summarize(
    gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
    pop = sum(as.numeric(pop))
    )


low<-ggplot(data=data,aes( y=gdpPercap, x=year))+
  geom_line(aes(color=continent,group=country))+
  geom_point(aes(color=continent))+
  geom_line(data=gapminder_continent,mapping=aes(x=year, y=gdpPercapweighted))+
  geom_point(data=gapminder_continent,mapping=aes(x=year, y=gdpPercapweighted, size=pop))+
  facet_wrap(~continent,nrow=1) +
  theme_bw() +
  xlab("Year")+
  ylab("GPD per capita")+
  labs(size='Populaiton (100k)')


library(ggpubr)
ggarrange(up, low + font("x.text", size = 10),
                    ncol = 1, nrow = 2)  
  
figure
ggsave("case_study_03.png")
