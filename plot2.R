setwd("C:/Users/user/Desktop/R/Course 4/Quiz 1")
##Load Data
data<- read.csv(file = "household_power_consumption.txt", header = T, sep = ";")


#Combine Date and Time
DateTime<- paste(data$Date, data$Time)
data$DateTime<- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format  = "%d/%m/%Y")

##Subset only those between 1st and 2nd Feb 2007
subsetData<- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
subsetData$Global_active_power<- as.numeric(as.character(subsetData$Global_active_power))

plot( y = subsetData$Global_active_power, x = subsetData$DateTime, type = "l", 
      ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", width = 480, height = 480 )
dev.off()
