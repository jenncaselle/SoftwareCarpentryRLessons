#practice for lesson on ggplot
#software carpentry

#open ggplot library
library("ggplot2")

#GAPMINDER a more realistic example

gapminder <- read.csv("~/Desktop/data-shell/gapminder_data.csv", header=TRUE)
gapminder

#visually inspect gapminder
#DATASubsetting in [a,b] a is rows and b is columns
#looking at row 1, col 1
gapminder[1,1]

#look at Row 1
gapminder[1,]

#preview top few lines
head(gapminder)

#preview bottom few lines
tail(gapminder)

#lets look at the middle, : is a range
gapminder[900:905, ]

# the first part sets up the axes but the geom_point part add points and geom_line adds lines

ggplot(data = gapminder, aes(x = year, y = lifeExp)) + geom_point(aes(colour = factor(continent)))

ggplot(data = gapminder, aes(x = year, y = lifeExp)) + geom_point(aes(colour = factor(continent)))

ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country, color=continent)) +  geom_line()

ggplot(data = gapminder, aes(x=year, y=lifeExp, color=continent)) +  geom_line() +geom_point()

ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) +
  geom_line(aes(color=continent)) +
  geom_point()
    
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=continent)) +
  geom_point() +
  geom_line(color="purple")


#TRANSFRMATION AND STATS
#overlay statistical models on plot

ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) +  geom_point()

#we have some outliers and it's hard to see
#let's change the sacle of units on x-axis usign scale function
#log10 function transforms gdp
#each multiple of 10 is now 1 on transformed scale
#1000 is now 3, 10,000 is now 4, 100,000 is now 5 on x-axis
#alpha sets transpareceny of the dots

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point(alpha = 0.5) + 
  scale_x_log10()

#make another layer here with geom_smooth
#lm-fit linear model

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point(alpha = 0.5, size=2.5, shape=10) + 
  scale_x_log10() +
  geom_smooth(method= "lm", size=1.5)

