rm(list=ls(all=TRUE))

#########################################################################

setwd("D:/BusDataTest/")

BUS <- read.csv("Cube_v2.csv",encoding="UTF-8-BOM", stringsAsFactors = FALSE)

country <- "" 
direction <- "1"  

txtpath <- paste("D:/BusDataTest/", country, direction, "/R/Node_ID", sep = "")
txtlist <- list.files( path = txtpath, pattern="*.txt")
n <- length(txtlist)
txtlist2 <- character()

for (i in 1:n) {
  txtlist2[i] <- gsub('.txt', "", txtlist[i], fixed=TRUE)
  a <- which(txtlist2[i] == BUS[,11])
  b <- read.table(paste(txtpath, "/", txtlist[i], sep = ""))
  c <- as.character(b[1,1])
  BUS[a,12] <- c
}

write.csv(BUS, file="Cube_v2.csv", row.names = FALSE)

