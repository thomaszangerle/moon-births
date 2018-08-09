# TIDYING THE BIRTHS AND MOON DATA, JOIN AND CREATING TIDY DATA ----

library(tidyverse)

Sys.setenv(TZ="Europe/Brussels")

# load the data
births <- read_delim("data/TF_BIRTHS.txt", "|")
moon <- read_csv("data/moon-phases-2008-2016-Europe_Brussels.csv")

# correct the date format of moon and rename the date key from births
moon <- moon %>% 
  select(date:datetime) %>% 
  mutate(date = parse_date(date, "%m/%d/%Y"))
births <- rename(births, date = DT_DATE, num_births = MS_NUM_BIRTHS)

# join the moon phase and phaseid
births <- left_join(births, moon, by =  "date")

# saving the tidy data
write_csv(births, "results/moon-births.csv")
