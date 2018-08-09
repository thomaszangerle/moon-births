
library(tidyverse)
library(lubridate)

births <- read_csv("results/moon-births.csv")

levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

births <- births %>% 
  mutate(
    weekday = factor(weekdays(date), levels = levels),
    full_moon = (!is.na(phaseid)&(phaseid == 4))
  )

ggplot(births, aes(weekday, num_births)) + 
  geom_boxplot(aes(color = full_moon)) +
  labs(title = "Births count vs. weekday and full moon")

ggsave('results/births_weekday_moon.png')

count(births, weekday, full_moon)

