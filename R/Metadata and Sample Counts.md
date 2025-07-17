# BEST WAYS TO DEAL WITH COMPLEX COUNTS AND METADATA COMBINATIONS IN R

conceptually I have to make sure that I understand this and apply this correctly. 

I load in the data first, I load in the metadata as well. 

Then I transpose my counts data and join it with the metadata

Now make the multi part function that runs the t-tests and everything:

This part of the function decides on the groups (loops through all combinations of two levels at a time for each feature

    for(feature in c("Race")){
      group_levels <- unique(MS_lupus_joined_data[[feature]])
      group_pairs <- combn(group_levels, 2, simplify = FALSE)


Grab each group pair and then filter each table so that it is only for that specified group. The filter(!!sym(feature))
is used to convert a string into a symbol that functions like filter() can understand in the context of non-standard evaluation. 
The double exclamation is used to unquote the symbol so dplyr evaluates it as the real column inside a pipeline

      results_list <- lapply(group_pairs, function(pair) {
        G1 <- pair[1]
        G2 <- pair[2]

        expr1 <- MS_lupus_joined_data %>% filter(!!sym(feature) == G1)
        expr2 <- MS_lupus_joined_data %>% filter(!!sym(feature) == G2)



For each unique gene pull its expression into two different columns

    map_dfr(unique(MS_lupus_joined_data$GenSymbol), function(gene) {
      vals1 <- expr1 %>% filter(GenSymbol == gene) %>% pull(`Protein Expression`)
      vals2 <- expr2 %>% filter(GenSymbol == gene) %>% pull(`Protein Expression`)

Means: Taking the means of the groups of interest and calculating the log2 ratio

    mean1 <- mean(vals1, na.rm = TRUE)
    mean2 <- mean(vals2, na.rm = TRUE)
    ratio <- mean1 / mean2
    log2ratio <- log2(ratio)

T-testing it:

      if(length(vals1) > 1 & length(vals2) > 1){
      tt <- t.test(vals1, vals2)
      tstat <- tt$statistic
      pval <- tt$p.value
    } else {
      tstat <- NA
      pval <- NA
    }


Naming the Features

    tibble(
      Feature = feature,
      Group1 = G1, Group2 = G2,
      GenSymbol = gene,
      Mean1 = mean1, Mean2 = mean2,
      log2ratio = log2ratio,
      tstat = tstat,
      pval = pval








