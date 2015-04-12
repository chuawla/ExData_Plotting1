setwd("C:/Users/user/Desktop/R/Course 4/Quiz 1")
##Load Data
data<- read.csv(file = "household_power_consumption.txt", header = T, sep = ";")

##Convert to Date
data$Date <- as.Date(data$Date, format  = "%d/%m/%Y")

##Subset only those between 1st and 2nd Feb 2007
subsetData<- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

##Convert Global_active_power to numeric
subsetData$Global_active_power<- as.numeric(as.character(subsetData$Global_active_power))


par(bg = "transparent")

par("bg")

hist(subsetData$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", bg = "transparent")

dev.copy(png, file = "plot1.png", width = 480, height = 480 )
dev.off()
