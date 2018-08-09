
library(tidyverse)
library(lubridate)

births <- read_csv("results/moon-births.csv")

levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

births <- births %>% 
  mutate(weekday = factor(weekdays(date), levels = levels))

ggplot(births, aes(date, num_births)) +
  geom_point()

ggplot(births, aes(weekday, num_births)) + 
  geom_boxplot()
