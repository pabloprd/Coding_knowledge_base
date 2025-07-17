# WORKING WITH DATAFRAMES IN R



# Groupby
- This is a super important function to use in R and can be a link to other functions to implement as well

      race_avg <- MS_lupus_joined_data %>%
      group_by(GenSymbol, Race) %>%
      summarize(avg = mean(`Protein Expression`, na.rm = TRUE), .groups = "drop")
