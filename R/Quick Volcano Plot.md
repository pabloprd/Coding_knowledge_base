# Quick Volcano Plot Graph in ggplot2

    ggplot(data = dataframe, 
           aes(x = dataframe_column1, y = dataframe_column2, 
               col = dataframe_column3, label = dataframe_column4)) +
      geom_vline(xintercept = vline_thresholds, col = "gray", linetype = 'dashed') +
      geom_hline(yintercept = abs(hline_threshold), col = "gray", linetype = 'dashed') +
      geom_point(size = 2) +
      scale_colour_manual(
        values = c("colors here", "here too"),
        labels = c("label_name1", "label_name2", "label_name3"),
        drop = FALSE
      )+
      geom_text_repel(
        data = dataframe_column4_selection,
        aes(label = dataframe_column4),
        max.overlaps = Inf
      )+
      ggtitle(title)
  

