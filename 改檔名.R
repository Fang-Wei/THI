rm(list=ls(all=TRUE))

#########################################################################
country <- ""
direction <- "1"

csvpath <- paste("D:/BusDataTest/", country, "/", direction, sep = "")
setwd(csvpath)
csvlist <- list.files(path = csvpath, pattern="*.csv")
n <- length(csvlist)
csvlist2 <- character()

for (i in 1:n) {
  csvlist2[i] <- gsub('(',"_",csvlist[i], fixed=TRUE)
  csvlist2[i] <- gsub(')',"",csvlist2[i], fixed=TRUE)
  csvlist2[i] <- gsub('[',"_",csvlist2[i], fixed=TRUE)
  csvlist2[i] <- gsub(']',"",csvlist2[i], fixed=TRUE)
  csvlist2[i] <- gsub('~',"_",csvlist2[i], fixed=TRUE)
  file.rename(from = csvlist[i], to = csvlist2[i])
}


