setwd("D:/BusDataTest/")

rm(list=ls(all=TRUE))

YUN_0 <- read.csv("YUN_0.csv",encoding="UTF-8-BOM")
YUN_1 <- read.csv("YUN_1.csv",encoding="UTF-8-BOM")
CYI_0 <- read.csv("CYI_0.csv",encoding="UTF-8-BOM")
CYI_1 <- read.csv("CYI_1.csv",encoding="UTF-8-BOM")
CYQ_0 <- read.csv("CYQ_0.csv",encoding="UTF-8-BOM")
CYQ_1 <- read.csv("CYQ_1.csv",encoding="UTF-8-BOM")
TNN_0 <- read.csv("TNN_0.csv",encoding="UTF-8-BOM")
TNN_1 <- read.csv("TNN_1.csv",encoding="UTF-8-BOM")
KHH_0 <- read.csv("KHH_0.csv",encoding="UTF-8-BOM")
KHH_1 <- read.csv("KHH_1.csv",encoding="UTF-8-BOM")
PIF_0 <- read.csv("PIF_0.csv",encoding="UTF-8-BOM")
PIF_1 <- read.csv("PIF_1.csv",encoding="UTF-8-BOM")

#########################################################################
#戈_0
country <- c("", "", "", "", "", "")
country_english <- c("YUN", "CYI", "CYQ", "TNN", "KHH", "PIF")
data_0 <- list(YUN_0, CYI_0, CYQ_0, TNN_0, KHH_0, PIF_0)

for (j in 1:6) {
  for (i in 1:nrow(data_0[[j]])) {
    a <- c(which(data_0[[j]][,4] == data_0[[j]][i,4]))
    b <- data_0[[j]][a,]
    c <- paste("D:/BusDataTest/", country[j], "/0/", country_english[j], "_", data_0[[j]][i,4], "_0", ".csv", sep = "")
    write.csv(b, file=c, row.names = FALSE)
  }
}

#戈_1
data_1 <- list(YUN_1, CYI_1, CYQ_1, TNN_1, KHH_1, PIF_1)

for (j in 1:6) {
  for (i in 1:nrow(data_1[[j]])) {
    a <- c(which(data_1[[j]][,4] == data_1[[j]][i,4]))
    b <- data_1[[j]][a,]
    c <- paste("D:/BusDataTest/", country[j], "/1/", country_english[j], "_", data_1[[j]][i,4], "_1", ".csv", sep = "")
    write.csv(b, file=c, row.names = FALSE)
  }
}
#########################################################################
