
library("ggplot2")
library("ggmap")
arrests <- USArrests
arrests

##1)	Read in the census dataset and the USArrests and merge them (just like HW6)
CombinedData <- merge(data,arrests,by.x = "statename",by.y = 0) #merged the columns of both the data frames by statename
CombinedData
