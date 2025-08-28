#Barplot with error bars and interquartile range. 


median_IQR <- function(x) {
  data.frame(
    y = median(x),               # median point
    ymin = quantile(x, 0.25),   # 1st quartile line start
    ymax = quantile(x, 0.75)    # 3rd quartile line end
  )
}

ggplot(dataframe, aes(x = x, y = y, fill = grouping)) +
  geom_bar(stat = "summary", position = position_dodge(width=0.9), fun = "mean") +
  geom_jitter(position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.8)) +
  theme_minimal() +
  ggtitle("Title") +
  theme(
    plot.title = element_text(face = "bold", size = 15, color = "black", hjust = 0.5),
    axis.text.x = element_text(face = "bold", size = 8, angle = 45, hjust = 1),
    axis.title.x = element_text(face = "bold"),
    axis.title.y = element_text(face = "bold")
  ) +
  
  # Add interquartile range lines
  stat_summary(
    fun.data = median_IQR, 
    geom = "errorbar",
    position = position_dodge(width = 0.9),  # ensure error bars dodge to align with bars
    size = 0.7,                      
    color = "black"
  )+
  
  # Add median points
  stat_summary(
    fun = median,
    geom = "point",
    position = position_dodge(width = 0.9),
    size = 0.5,
    color = "black"
  )
