#Boxplot



ggplot(dataframe, aes(x = x, y = y, fill = grouping)) +
    geom_boxplot(color = "black", size = line_size, outlier.shape = NA) +
    geom_jitter(width = 0.3, color = "black", alpha = 0.7, size = point_size) +#adding in the dots
    scale_fill_brewer(palette = paste0(palette_set)) + #determining color of inner boxes #What are the different pallets?
    labs(
      title = paste(plot_title),
      x = x_axis_title,
      y = y_axis_title
    ) +  
    guides(fill = "none")+
    theme_minimal(base_size = 16) +
    theme(
      axis.title = element_text(size = x_axis_title_size),
      axis.text = element_text(size = y_axis_title_size),
      panel.background = element_rect(fill = "white"),
      plot.background = element_rect(fill = "white"),
      plot.title = element_text(size = plot_title_size, hjust = 0.5, face = "bold"))
