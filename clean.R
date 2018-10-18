
raw_data[-5,-4] 
raw_data <- raw_data[-53,] 
raw_data <- raw_data[-1,] 
raw_data <- raw_data[5:8] 
colnames(raw_data)<-c("statename", "population", "popover18", "percentover18") #renaming the columns to stateName, population, popOver18 and percentOver18
clean_data <- raw_data
clean_data
