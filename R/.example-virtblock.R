library(DataprepMisc)

exdat_v <- matrix(sample(c(0,1),3*5, rep=TRUE),ncol=3)
colnames(exdat_v) <- paste0("it", 1:3)
group <- sample(1:3, 5, rep=TRUE)
position <- matrix(c(1,2,1,2,2,1),ncol=3)
exdat_v2 <- cbind(exdat_v, group)
exdat_v2

virtblock(exdat_v2, 1:3, 4, position)

