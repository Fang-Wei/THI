setwd("D:/BusDataTest/")

rm(list=ls(all=TRUE))

#0
R_0 <- read.csv("_0.csv",encoding="UTF-8-BOM")

for (i in 1:nrow(R_0)) {
  a <- c(which(R_0[,4] == R_0[i,4]))
  b <- R_0[a,]
  c <- paste("D:/BusDataTest/", R_0[i,4], "_0", ".csv", sep = "")
  write.csv(b, file=c, row.names = FALSE)
}

#1
setwd("D:/BusDataTest/")

rm(list=ls(all=TRUE))

R_1 <- read.csv("_1.csv",encoding="UTF-8-BOM")

for (i in 1:nrow(R_1)) {
  a <- c(which(R_1[,4] == R_1[i,4]))
  b <- R_1[a,]
  c <- paste("D:/BusDataTest/", R_1[i,4], "_1", ".csv", sep = "")
  write.csv(b, file=c, row.names = FALSE)
}
