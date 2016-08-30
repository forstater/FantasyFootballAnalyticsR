# DASHBOARD ---------------------------------------------------------------


###################
### Draft Dashboard
###################

###--UPDATE--###
myteam <- data.frame(
  player = c(),
  position = c(),
  cost = c()
)
myteam$player <- as.character(myteam$player)

drafted <- c(myteam$player)
###----------###

### Optimize Team ###
# Projected Points
optimizeDraft(maxRisk=5.0, omit=drafted)
optimizeDraft(maxRisk=4.1, omit=drafted) #From Optimum Risk.R #1554
optimizeDraft(maxRisk=3.3, omit=drafted) #From Simulation.R   #1532
optimizeDraft(maxRisk=100, omit=drafted)                      #1568

# Simulated Points
optimizeDraft(maxRisk=5.0, omit=drafted, points=removedPlayers$simulation) #From Optimum Risk.R
sum(draftData[player %in% optimizeDraft(maxRisk=5.0, omit=drafted, points=removedPlayers$simulation)$players, "points", with=FALSE]) #1389

optimizeDraft(maxRisk=4.1, omit=drafted, points=removedPlayers$simulation) #From Optimum Risk.R
sum(draftData[player %in% optimizeDraft(maxRisk=4.1, omit=drafted, points=removedPlayers$simulation)$players, "points", with=FALSE]) #1374

optimizeDraft(maxRisk=3.3, omit=drafted, points=removedPlayers$simulation) #From Simulation.R
sum(draftData[player %in% optimizeDraft(maxRisk=3.3, omit=drafted, points=removedPlayers$simulation)$players, "points", with=FALSE]) #1178

optimizeDraft(maxRisk=100, omit=drafted, points=removedPlayers$simulation)
sum(draftData[player %in% optimizeDraft(maxRisk=100, omit=drafted, points=removedPlayers$simulation)$players, "points", with=FALSE]) #1330

# Remaining ---------------------------------------------------------------


### Remaining Players ###
#Player Info
draftData[draftData$player == "Adrian Peterson",]

#All
draftData[!(player %in% drafted) & !is.na(points),]

#QB
draftData[!(player %in% drafted) & !is.na(points) & draftData$pos == "QB",]

#RB
draftData[!(player %in% drafted) & !is.na(points) & draftData$pos == "RB",]

#WR
draftData[!(player %in% drafted) & !is.na(points) & draftData$pos == "WR",]

#TE
draftData[!(player %in% drafted) & !is.na(points) & draftData$pos == "TE",]

# Starters ----------------------------------------------------------------


### Starters ###
#All
draftData[!(player %in% drafted) & vor > 0 & risk < 5 & !is.na(points),]

#QB
draftData[!(player %in% drafted) & vor > 0 & risk < 5 & !is.na(points) & draftData$pos == "QB",]

#RB
draftData[!(player %in% drafted) & vor > 0 & risk < 5 & !is.na(points) & draftData$pos == "RB",]

#WR
draftData[!(player %in% drafted) & vor > 0 & risk < 5 & !is.na(points) & draftData$pos == "WR",]

#TE
draftData[!(player %in% drafted) & vor > 0 & risk < 5 & !is.na(points) & draftData$pos == "TE",]

# Sleepers ----------------------------------------------------------------


### Sleepers ###
#All
draftData[!(player %in% drafted) & risk >= 6 & !is.na(points),]

#QB
draftData[!(player %in% drafted) & risk >= 6 & !is.na(points) & draftData$pos == "QB",]

#RB
draftData[!(player %in% drafted) & risk >= 6 & !is.na(points) & draftData$pos == "RB",]

#WR
draftData[!(player %in% drafted) & risk >= 6 & !is.na(points) & draftData$pos == "WR",]

#TE
draftData[!(player %in% drafted) & risk >= 6 & !is.na(points) & draftData$pos == "TE",]

### Kickers ###
kickers[!(player %in% drafted),]
