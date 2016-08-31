#Install packages that work with main libraries
# install.packages(c("reshape", "MASS", "psych", "Rglpk", "XML"), dependencies=TRUE)
### INITIALIZATION ####
setwd("~/Projects/External/ffanal/FantasyFootballAnalyticsR")

library(ffanalytics)
library("Rglpk")
source(paste(getwd(),"/R Scripts/Functions/Functions.R", sep=""))
source(paste(getwd(),"/R Scripts/Functions/League Settings.R", sep=""))
