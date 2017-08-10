library(dplyr)
library(foreach)
gb = read.csv('greenbuildings.csv')
#getting rid of the first column
gb = gb[,-(1)]

#grouping by cluster
by_cluster = gb %>% group_by(cluster)
cluster_ids = unique(by_cluster['cluster'])


get_green_ratios <- function(id, df)
{
  greenrent = 0
  average = 0
  ratio = 0
  
  for (id in df)
  {
    notgreensum = 0
    numgreen = 0
    for (i in nrow(group))
    {
      if (gb[i,'green_rating']==0)
      {
        notgreensum = notgreensum + gb[i, "Rent"]
        numgreen = numgreen + 1
      } 
      else
      {
        greenrent = gb[i, "Rent"]
      }
    }
    average = notgreensum/numgreen
    ratio = greenrent/average
    return(ratio)
  }
}

for( i in 1:length(cluster_ids) )
{
  cluster_ratios[i] = get_green_ratios(cluster_ids[i], by_cluster)
}
