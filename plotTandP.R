library(tidyverse)

mccall <- read_csv("AHAB_MET20032014_v2.csv")

mccallAnn <- mccall %>% 
  filter(`AT-1m` > -80) %>% 
  filter(`P (cm)` < 5) %>% 
  filter(between(DOY,120,243)) %>% 
  group_by(YR) %>% 
  summarize(annP = sum(`P (cm)`), annT = mean(`AT-1m`))


Tplot <- ggplot(mccallAnn)+
  geom_line(aes(x = YR, y = annT))+
  scale_x_continuous(name = "Year",breaks = mccallAnn$YR ,limits = c(2002,2015))+
  ylab("MJJA mean temperature")+
  theme_bw()


Pplot <- ggplot(mccallAnn)+
  geom_bar(aes(x = YR, y = annP),stat = "identity",fill = "sky blue", alpha = 0.6)+
  scale_x_continuous(name = "Year",breaks = mccallAnn$YR, limits = c(2002,2015))+
  ylab("MJJA total precipitation")+
  theme_bw()

library(gridExtra)

both <- grid.arrange(Tplot, Pplot, ncol = 1)

ggsave(both,filename =  "McCallT&P.pdf",width = 6, height = 5)
