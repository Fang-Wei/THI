rm(list=ls(all=TRUE))

#########################################################################
direction <- "1"  #設定去返程

dbfpath <- paste("D:/BusDataTest/", direction, "/進入R/DBAF", sep = "")

if (file.exists(paste(dbfpath, "/Node_ID", sep = ""))) {
  setwd(dbfpath)
} else {
  dir.create(paste(dbfpath, "/Node_ID", sep = ""))
  setwd(dbfpath)
}

library("foreign")
dbflist <- list.files( path = dbfpath, pattern="*.dbf")
n <- length(dbflist)

dbflist2 <- character()
for (i in 1:n) {
  dbflist2[i] <- gsub('.dbf', ".txt", dbflist[i], fixed=TRUE)
  dbflist2[i] <- gsub('_Layer', "", dbflist2[i], fixed=TRUE)
}

data <- list()

for (i in 1:n) {
  data[[i]] <- read.dbf(dbflist[i])
}

for (i in 1:n) {
  for (j in 2:(nrow(data[[i]])-1)) {
    a <- which(colnames(data[[i]]) == "ZELEV")
    if (data[[i]][j+1,a] == 0 & data[[i]][j+2,a] == 0) {data[[i]][j,a] = data[[i]][j,a]*(1)}
    else if (data[[i]][j+1,a] == 0 & data[[i]][j,a] == data[[i]][j+2,a]) {data[[i]][j,a] = 999}
    else if (data[[i]][j,a] != 0 & data[[i]][j-1,a] == 0) {data[[i]][j,a] = data[[i]][j,a]*(1)}
    else {data[[i]][j,a] = data[[i]][j,a]*(-1)}
  }
  
  e <- which(data[[i]][,a] == 999)
  if (length(e) > 0) {data[[i]] <- data[[i]][-e,]}
  b <- which(data[[i]][,a] != 0)
  c <- rbind(data[[i]][b,a])
  
  d <- paste(dbfpath, "/Node_ID/", dbflist2[i], sep = "")
  write.table(c, file=d, col.names = F, row.names = F, sep = ",")
}
