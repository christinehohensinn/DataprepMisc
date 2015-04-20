library(DataprepMisc)

it1 <- c(rep(1,5),rep(NA,7))
it2 <- c(rep(NA,5),rep(0,4), rep(NA,3))
it3 <- c(rep(NA,9),rep(0,3))
it4 <- c(rep(NA,5),rep(0,4), rep(NA,3))
it5 <- c(rep(1,5), rep(NA,7))
it6 <- c(rep(NA, 9), rep(1,3))
exqd <- cbind(it1,it2, it3, it4, it5, it6)
colnames(exqd) <- c("it1_pos1", "it1_pos2", "it1_pos3", "it2_pos1", "it2_pos2", "it2_pos3")

prod_qmat1(exqd, 2,3)
