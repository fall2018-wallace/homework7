
library("ggplot2")
arrests <- USArrests
arrests
CombinedData <- merge(data,arrests,by.x = "statename",by.y = 0) #merged the columns of both the data frames by statename
CombinedData