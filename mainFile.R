setwd("/Users/therealrussellkim/DarkNetAnalysis")
library(stringr)
data <- read.csv("Agora.csv")
drugData <- data[which(data$Category == "Drugs/RCs"),]
drugDataCleaned <- drugData[,3:5]

bitcoinPrices <- read.csv("market-price_bitcoin.csv")

#Get rid of timestamp for hour of day 
bitcoinPrices[,1] <- sapply(bitcoinPrices[,1], function(x)substr(x, 1, 10))
plot(as.Date(bitcoinPrices[,1]), bitcoinPrices[,2])

# Look for FMA drugs
FMA_Prices <- drugDataCleaned[str_detect(drugDataCleaned[,1], "FMA"),]
