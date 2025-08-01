# Quick Volcano Plot Graph in ggplot2

    ggplot(data = dataframe, 
           aes(x = dataframe_column1, y = dataframe_column2, 
               col = dataframe_column3, label = dataframe_column4)) +
      geom_vline(xintercept = vline_thresholds, col = "gray", linetype = 'dashed') +
      geom_hline(yintercept = abs(hline_threshold), col = "gray", linetype = 'dashed') +
      geom_point(size = 2) +
      scale_colour_manual(
        values = c("blue", "gray", "red"),
        labels = c("Downregulated", "Not significant", "Upregulated"),
        drop = FALSE
      )+
      geom_text_repel(
        data = top_genes,
        aes(label = dataframe_column4),
        max.overlaps = Inf
      )+
      ggtitle(title)
  

