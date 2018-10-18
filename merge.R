
library("ggplot2")
library("ggmap")
arrests <- USArrests
arrests

#1)	Read in the census dataset and the USArrests and merge them (just like HW6)
CombinedData <- merge(data,arrests,by.x = "statename",by.y = 0) #merged the columns of both the data frames by statename
CombinedData #display combined data

#2)	Add the area of each state, and the center of each state, to the merged dataframe, using the ‘state.center’, ‘state.center’ and ‘state.name’ vectors
statename<-state.name #added the statenames gathered into 'statename' variable
stateArea<- state.area #added the areas of the state into 'stateArea' variable
stateCenter<-state.center #added the center of the states into 'stateCenter' variable
newFrame<-data.frame(statename,stateArea,stateCenter) #combined states names, areas and centers into new frame
CombinedData<-merge(CombinedData,newFrame) #merged the above combined data and the new frame into CombinedData
CombinedData
CombinedData$statename= tolower(CombinedData$statename) #set all the state names to lower case

#3)	Create a color coded map, based on the area of the state
usa <- map_data("state") #added the state mapdata into variable named usa
maparea <- ggplot(CombinedData,aes(map_id = statename)) #used ggplot and passed it the map id which in this case is statename
maparea <- maparea + geom_map(map = usa, aes(fill = stateArea)) #geom_map will map the mapdata in variable usa and fill the regions by the area in the states
maparea <-  maparea + expand_limits(x	=	usa$long,	y	=	usa$lat) #expanded the x and y limits based on the latitude and longitudes of usa
maparea <- maparea +  coord_map() + ggtitle("Color based on Area of the state") #
maparea

#4)	Repeat step B, but color code the map based on the murder rate of each state.
mapmurder <- ggplot(CombinedData,aes(map_id = statename))
mapmurder <- mapmurder + geom_map(map = usa, aes(fill = CombinedData$Murder))
mapmurder <-  mapmurder + expand_limits(x	=	usa$long,	y	=	usa$lat)	
mapmurder <- mapmurder +  coord_map() + ggtitle("Color based on Murders in the states")
mapmurder

#5)	Show the population as a circle per state (the larger the population, the larger the circle), using the location defined by the center of each state
mapplot <- ggplot(CombinedData, aes(map_id=statename)) 
mapplot <- mapplot + geom_map(map=usa, aes(fill=CombinedData$population)) + expand_limits(x= usa$long, y= usa$lat) + coord_map()
mapplot <- mapplot + geom_point(aes(x = x, y = y, size=population))
mapplot

#6)	Repeat step C, but only show the states in the north east
#Hint: get the lat and lon of new york city
#Hint: set the xlim and ylim to NYC +/- 10
latlon <- geocode(source = "dsk","nyc,new york,ny")
latlon
mapzoom<-mapplot+ xlim(-84,-64)+ ylim(30,50)
mapzoom
