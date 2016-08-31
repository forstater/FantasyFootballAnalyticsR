#Install packages that work with main libraries
# install.packages(c("reshape", "MASS", "psych", "Rglpk", "XML"), dependencies=TRUE)
### INITIALIZATION ####
setwd("~/Projects/External/ffanal/FantasyFootballAnalyticsR")

library(ffanalytics)
library("Rglpk")
source(paste(getwd(),"/R Scripts/Functions/Functions.R", sep=""))
source(paste(getwd(),"/R Scripts/Functions/League Settings.R", sep=""))
#Load data
load(paste(getwd(), "/Data/BidUpToSimulation.RData", sep = ""))
load(paste(getwd(), "/Data/IDP.RData", sep = ""))
load(paste(getwd(), "/Data/kickers.RData", sep = ""))

#Subset data
draftData <-
  projections[sourceName == "averageRobust", c(
    "name",
    "player",
    "pos",
    "team",
    "points",
    "vor",
    "simulation",
    "sdPick",
    "sdPts",
    "risk",
    "avgCost",
    "inflatedCost",
    "bidUpTo",
    "bidUpToSim"
  ), with = FALSE]

#Save data
save(draftData, file = paste(getwd(), "/Data/DraftDay.RData", sep = ""))
write.csv(
  draftData,
  file = paste(getwd(), "/Data/DraftDay.csv", sep = ""),
  row.names = FALSE
)

save(
  draftData,
  file = paste(
    getwd(),
    "/Data/Historical Files/DraftDay-",
    season,
    ".RData",
    sep = ""
  )
)
write.csv(
  draftData,
  file = paste(
    getwd(),
    "/Data/Historical Files/DraftDay-",
    season,
    ".csv",
    sep = ""
  ),
  row.names = FALSE
)

options(digits = 2)
draftData

#Day of Draft
removedPlayers <-
  draftData[rowSums(is.na(draftData[, c("points", "simulation", "risk", "inflatedCost"), with =
                                      FALSE])) == 0, ]