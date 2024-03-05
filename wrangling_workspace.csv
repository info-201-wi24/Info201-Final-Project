library("dplyr")

obesity_income_2010_2020 <- read.csv("/Users/lesterli/Downloads/final-project-/temp_obesity_income")

Income_difference_20_10 <- 
  obesity_income_2010_2020 %>%
  mutate(income_difference_20_10 = Income_2020 - Income_2010)

Obesity_difference_20_10 <-
  obesity_income_2010_2020 %>%
  mutate(obesity_difference_20_10 = Obesity_2020 - Obesity_2010)

average_income_10 <-
  obesity_income_2010_2020 %>%
  summarise(average_income = mean(Income_2010, na.rm = TRUE))

average_income_20 <-
  obesity_income_2010_2020 %>%
  summarise(average_income = mean(Income_2020, na.rm = TRUE))

average_obesity_10 <-
  obesity_income_2010_2020 %>%
  summarise(average_obesity = mean(Obesity_2010, na.rm = TRUE))

average_obesity_20 <-
  obesity_income_2010_2020 %>%
  summarise(average_obesity = mean(Obesity_2020, na.rm = TRUE))
