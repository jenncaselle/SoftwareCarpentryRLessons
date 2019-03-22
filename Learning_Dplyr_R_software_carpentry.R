#learning dplyr
#afternoon Day 2 of software carpentry

#install and load package
#install.packages('dplyr')
library(dplyr)
library (ggplot2)
#import data
gapminder <- read.csv("~/Desktop/data-shell/gapminder_data.csv", header=TRUE)

head(gapminder)

#select function
#choosing specific columns (%>% is a pipe)

gap_yr_gdp <- gapminder %>% select (year, gdpPercap)
head (gap_yr_gdp)

#filter function
#choose specific rows

gap_1960s <- gapminder %>% filter(year >= 1960 & year<1970)

#using multiple dplyr functions together
gap_yr_gdp_1960s <- gapminder %>% 
  select (year, gdpPercap) %>% 
  filter(year >= 1960 & year<1970)

head(gap_yr_gdp_1960s)

gap_Africa_only <- gapminder %>%
  filter(continent == "Africa") %>%
  select(lifeExp, country, year)
  

nrow(gap_Africa_only)

#summarizing data
gdp_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp = mean(gdpPercap))
gdp_by_continent

#using mutate function
#add new columns that are functions of other columns
gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion=gdpPercap*pop/10^9) %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop),
            mean_gdp_billion=mean(gdp_billion),
            sd_gdp_billion=sd(gdp_billion))

#string with ggplot

gapminder %>%
  mutate(gdp_billion = (gdpPercap*pop)/10^9) %>%
  group_by(continent, year) %>%
  summarise (mean_gdp_bill = mean(gdp_billion)) %>%
  ggplot (aes(x=year, y=mean_gdp_bill, color=continent)) + geom_point()
