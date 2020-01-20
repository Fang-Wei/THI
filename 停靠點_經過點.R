rm(list=ls(all=TRUE))

#########################################################################
country <- "嘉義縣" #設定縣市
direction <- "1"  #設定去返程

txtpath <- paste("D:/BusDataTest/", country, direction, "/進入R", sep = "")

if (file.exists(paste(txtpath, "/Node_ID", sep = ""))) {
     setwd(txtpath)
  } else {
     dir.create(paste(txtpath, "/Node_ID", sep = ""))
     setwd(txtpath)
  }

txtlist <- list.files( path = txtpath, pattern="*.txt")
n <- length(txtlist)

data <- list()

for (i in 1:n) {
  data[[i]] <- read.delim(txtlist[i], header = T, sep = "\t")
}

for (i in 1:n) {
  for (j in 2:(nrow(data[[i]])-1)) {
    a <- which(colnames(data[[i]]) == "Node_ID")
    if (data[[i]][j+1,a] == 0 & data[[i]][j+2,a] == 0) {data[[i]][j,a] = data[[i]][j,a]*(1)}
    else if (data[[i]][j+1,a] == 0 & data[[i]][j,a] == data[[i]][j+2,a]) {data[[i]][j,a] = 999}
    else if (data[[i]][j,a] != 0 & data[[i]][j-1,a] == 0) {data[[i]][j,a] = data[[i]][j,a]*(1)}
    else {data[[i]][j,a] = data[[i]][j,a]*(-1)}
  }
  
  e <- which(data[[i]][,a] == 999)
  if (length(e) > 0) {data[[i]] <- data[[i]][-e,]}
  b <- which(data[[i]][,a] != 0)
  c <- rbind(data[[i]][b,a])
  
  d <- paste(txtpath, "/Node_ID/", txtlist[i], sep = "")
  write.table(c, file=d, col.names = F, row.names = F, sep = ",")
}

#########################################################################
#Check
csvpath <- paste("D:/BusDataTest/", country, "/", direction, sep = "")
setwd(csvpath)

csvlist <- list.files( path = csvpath, pattern="*.csv")
m <- length(csvlist)

data2 <- list()
nstop <- c()

for (k in 1:m) {
  data2[[k]] <- read.delim(csvlist[k], header = T, sep = ",")
  nstop[k] <- nrow(data2[[k]])
}

for (i in 1:n) {
  a <- which(colnames(data[[i]]) == "Node_ID")
  b <- length(which(data[[i]][,a] > 0))
  print(paste(txtlist[i], ";", csvlist[i], "：", b, "：", nstop[i], sep = ""))
}