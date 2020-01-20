rm(list=ls(all=TRUE))

#########################################################################

setwd("D:/BusDataTest/")

BUS <- read.csv("市區公車匯入Cube_v2.csv",encoding="UTF-8-BOM", stringsAsFactors = FALSE)

country <- "嘉義市" #設定縣市
direction <- "1"  #設定去返程

txtpath <- paste("D:/BusDataTest/", country, direction, "/進入R/Node_ID", sep = "")
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

write.csv(BUS, file="市區公車匯入Cube_v2.csv", row.names = FALSE)

