scoringRules <- list(
  QB = data.frame(dataCol = c("passYds", "passTds", "passInt", "rushYds", "rushTds", "twoPts", "fumbles"),
                  multiplier = c(1/25, 4, -2, 1/10, 6, 2, -1 )),
  RB = data.frame(dataCol = c("rushYds", "rushTds", "rec", "recYds", "recTds", "returnTds", "twoPts", "fumbles"),
                  multiplier = c(1/10, 6, 1/2, 1/8, 6, 6, 2, -1)),
  WR = data.frame(dataCol = c("rushYds", "rushTds", "rec", "recYds", "recTds", "returnTds", "twoPts", "fumbles"),
                  multiplier = c(1/10, 6, 1/2, 1/8, 6, 6, 2, -1)),
  TE = data.frame(dataCol = c("rushYds", "rushTds", "rec", "recYds", "recTds", "returnTds", "twoPts", "fumbles"),
                  multiplier = c(1/10, 6, 1/2, 1/8, 6, 6, 2, -1)),
  K = data.frame(dataCol = c("xp", "fg", "fg0019", "fg2029", "fg3039", "fg4049", "fg50"),
                 multiplier = c(1, 3, 3, 3, 3, 4, 5)),
  DST = data.frame(dataCol = c("dstFumlRec", "dstInt", "dstSafety", "dstSack", "dstTd", "dstBlk"),
                   multiplier = c(2, 2, 2, 1, 6, 1.5)),
  ptsBracket = data.frame(threshold = c(0, 6, 20, 34, 99),
                          points = c(10, 7, 4, 0, -4))
)

