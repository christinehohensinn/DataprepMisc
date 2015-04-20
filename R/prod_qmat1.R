#' Produces weight matrix for special LLTM application (e.g. position effects)
#'
#' Function prod_qmat1 produces a weight matrix for the LLTM (e.g. estimable with package eRm) e.g. for the examination of position effects. Function is very restricted and assumes a data matrix with special colnames for producing the Q matrix. Warning: function does not proof Q for full rank!
#'
#' @param virtdat data matrix with "virtual items" (e.g. resulting from function virtblock), data matrix has to be 0/1 matrix and colnames must have the form 'it30_pos4' that is the number of item and the number of position
#' @param nr_itemstem number of item stems
#' @param nr_pos number of different positions
#' @return qmat weight matrix (warning: check for full rank!)
#'
#'@author Christine Hohensinn
#'
#'@example ./R/.example-prodqmat1.R


prod_qmat1 <- function(virtdat, nr_itemstem, nr_pos){

zwi <- gsub("it", "", colnames(virtdat, nr_itemstem, nr_pos))
inr <- as.numeric(gsub("_pos\\d", "", zwi, perl=T))
posnr <- as.numeric(gsub("\\d+_pos", "", zwi))
qmat1 <- matrix(0, nrow=ncol(virtdat), ncol=(nr_itemstem+nr_pos))

for(x in 1:length(inr)){
  co <- inr[x]
  pob <- posnr[x]
  qmat1[x, co] <- 1
  qmat1[x, (nr_itemstem+pob)] <- 1
}
if(any(colSums(qmat1)==0)){
    fullna <- which(colSums(qmat1)==0)
    qmat <- qmat1[,-fullna]
  } else {
    qmat <- qmat1
}
return(qmat)
}
