# Heatmap

    ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
      geom_tile() +
      scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
      theme_minimal() +
      labs(title = "Heatmap using ggplot2",
           x = "Columns",
           y = "Rows",
           fill = "Value") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Barplot

# Boxplot

# Etc.
