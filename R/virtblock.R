#'Splits data matrix according to feature of group variable; produces 'virtual columns'
#'
#' Function virtblock expands splits and expands a data matrix according to features of a group variable in it. Data matrix is a persons x variables matrix including a group variable. Part of the variables (items) should be split into independent variables / columns. The splitting is due to a feature of the group variable on the items variables. For example the group variable indicates booklets. These booklets have different positions for the items. Result is a data matrix with more columns than the original data matrix because those item variable that differ in the feature (position) are split into two or more columns (dependent on the level of the feature)
#'
#' @param data contains data and a group variable
#' @param where_items index vector which indicates which items have to be split
#' @param where_group index of the grouping variable (scalar)
#' @param pos_key integer matrix; feature x items; start with 1!
#' @return expanded data matrix with the split columns
#'
#'@author Manuel Reif, Christine Hohensinn


virtblock<- function(data, where_items, where_group, pos_key)
{
  
  
erg1 <- lapply(1:length(where_items), function(i)
    {
        
      # create dummy matrix
      myblocks <- unique(data[,where_group])
      dummy_matrix <- matrix(NA,nrow=nrow(data),ncol=max(pos_key))
      
      # write in blocks
      for(b in 1:length(myblocks))
        {
          wo_zeile  <- data[,where_group] == myblocks[b]
          wo_spalte <- pos_key[b,i]
          
          dummy_matrix[wo_zeile,wo_spalte] <- 1
        }
      
      # add colnames
      colnames(dummy_matrix) <- paste0(colnames(data)[where_items][i],"_pos",1:length(myblocks))
      # matrix by vector (write data in dummy matrix - now the matrix is not so dummy at all :-)
      dummy_new <- dummy_matrix * data[,where_items[i]]
      # skip NA only columns
      nurna_weg <- apply(dummy_new,2,function(x) !sum(is.na(x)) == nrow(dummy_new))
      dummy_red <- dummy_new[,nurna_weg, drop=FALSE]
      dummy_red
    })

return(erg1)
}


