#data sorting
theme_set(theme_minimal())
# 1. Deleting duplicates (if they are)
duplicates <- nrow(day[duplicated(day), ]) > 0
if (duplicates) {
  day <- day[!duplicated(day), ]
}
#2.Deleting missing values
missing_values <- any(is.na(day))
if (missing_values) {
  day <- na.omit(day)
}
#3.Sorting columns and making plots

weekday_vs_weekend <- data.frame(workingday = c(0, 1),
                                 average_count = c(4330, 4585))
ggplot(data = weekday_vs_weekend,
       aes(x = factor(workingday), y = average_count, fill = factor(workingday))) +
  geom_bar(stat = "identity") +
  ggtitle("Average Bike Rentals for Weekdays vs. Weekend Days") +
  xlab("Day Type (0 = Weekend, 1 = Weekday)") +
  ylab("Average Number of Bike Rentals") +
  scale_fill_manual(values = c("0" = "red", "1" = "blue"), labels = c("Weekend", "Weekday")) +
  scale_color_brewer(palette = "Dark2")

data_wethertocnt <- select(day, temp:windspeed, cnt)

ggplot(data_wethertocnt,
       aes(x = temp, y = cnt)) +
  geom_point() +
  ggtitle("Scatterplot of Temperature vs Total Count") +
  scale_color_brewer(palette = "Dark2")

