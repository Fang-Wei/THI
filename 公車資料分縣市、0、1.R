setwd("D:/BusDataTest/")

rm(list=ls(all=TRUE))

YUN_0 <- read.csv("YUN_0.csv",encoding="UTF-8-BOM") #雲林_0
YUN_1 <- read.csv("YUN_1.csv",encoding="UTF-8-BOM") #雲林_1
CYI_0 <- read.csv("CYI_0.csv",encoding="UTF-8-BOM") #嘉義市_0
CYI_1 <- read.csv("CYI_1.csv",encoding="UTF-8-BOM") #嘉義市_1
CYQ_0 <- read.csv("CYQ_0.csv",encoding="UTF-8-BOM") #嘉義縣_0
CYQ_1 <- read.csv("CYQ_1.csv",encoding="UTF-8-BOM") #嘉義縣_1
TNN_0 <- read.csv("TNN_0.csv",encoding="UTF-8-BOM") #臺南_0
TNN_1 <- read.csv("TNN_1.csv",encoding="UTF-8-BOM") #臺南_1
KHH_0 <- read.csv("KHH_0.csv",encoding="UTF-8-BOM") #高雄_0
KHH_1 <- read.csv("KHH_1.csv",encoding="UTF-8-BOM") #高雄_1
PIF_0 <- read.csv("PIF_0.csv",encoding="UTF-8-BOM") #屏東_0
PIF_1 <- read.csv("PIF_1.csv",encoding="UTF-8-BOM") #屏東_1

#########################################################################
#資料_0
country <- c("雲林縣", "嘉義市", "嘉義縣", "台南市", "高雄市", "屏東縣")
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

#資料_1
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
