#Heatmap in ggplot2
# To add

ggplot(dataframe, aes(x = x, y = y, fill = grouping)) +
    geom_tile(color = "black") +
    theme_minimal() +
    ggtitle(title)+
    labs(x = '', y = '')+
    scale_fill_gradient(low = "white", high = "darkblue") +
    theme(
      plot.title = element_text(face = "bold", size = 15, color = "black", hjust = 0.5),
      axis.text.x = element_text(face = "bold", size = 8, angle = 45, hjust = 1),
      axis.text.y = element_blank(),
      axis.title.x = element_text(face = "bold"),
      axis.title.y = element_text(face = "bold"),
      axis.ticks.y = element_blank(),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank()
      
      )




# TO ADD BOUNDARIES

  # Find group boundary positions on y-axis
#The variable names are specific to a project, but just interchange them
group_boundaries <- Sample_only_df_long_ordered %>%
  distinct(Sample, Group) %>%
  group_by(Group) %>%
  summarise(last_sample_position = max(as.numeric(Sample))) %>%
  arrange(last_sample_position) %>%
  mutate(boundary = last_sample_position + 0.5)  # position between groups

#Add this for boundary line between the groups
+ geom_hline(data = group_boundaries[-nrow(group_boundaries), ], aes(yintercept = boundary), size = 1.0, color = "black")
