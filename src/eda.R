
library(tidyverse)
library(lubridate)

births <- read_delim("data/TF_BIRTHS.txt", "|")
glimpse(births)
head(births)

moon <- read_csv("data/moon-phases-2008-2016-Europe_Brussels.csv")
glimpse(moon)

mutate(moon, date = date(datetime))
