library(RMySQL) 
library(tidyverse)
library(magrittr)
con = dbConnect(MySQL(), dbname = "gain_time", username="root", password="Ck@04080203")
produce = dbGetQuery(con, "SELECT * FROM produce")
market = dbGetQuery(con, "select * from market")
crop1 = dbGetQuery(con, "select * from price where produce = 'FA1' and market = '104'")
crop1 %<>% transform(date_ = as.Date(date_, "%Y/%m/%d"))
crop1$price_ave %>% summary
crop1$price_ave %>% {sd(.)/mean(.)}
crop1 %>% 
  ggplot(mapping = aes(date_,price_ave)) + geom_point() +
  stat_smooth(method='lm', formula = y ~ poly(x, degree = 20))

crop1 %>% 
  ggplot(mapping = aes(date_, volumn, group = market)) + geom_line() +
  facet_wrap(~market)

library(prophet)







