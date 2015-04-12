setwd("C:/Users/user/Desktop/R/Course 4/Quiz 1")
##Load Data
data<- read.csv(file = "household_power_consumption.txt", header = T, sep = ";")

DateTime<- paste(data$Date, data$Time)
data$DateTime<- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format  = "%d/%m/%Y")

#Subset the data
subsetData<- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

subsetData$Global_active_power<- as.numeric(as.character(subsetData$Global_active_power))
subsetData$Sub_metering_1<- as.numeric(as.character(subsetData$Sub_metering_1))
subsetData$Sub_metering_2<- as.numeric(as.character(subsetData$Sub_metering_2))
subsetData$Sub_metering_3<- as.numeric(as.character(subsetData$Sub_metering_3))

subsetData$Voltage<- as.numeric(as.character(subsetData$Voltage))
subsetData$Global_reactive_power<- as.numeric(as.character(subsetData$Global_reactive_power))

xrange<- range(subsetData$DateTime)
yrange<- range(subsetData$Sub_metering_1, subsetData$Sub_metering_2, subsetData$Sub_metering_3)


par(mfcol = c(2,2), mar= c(2,5,2,1))


plot( y = subsetData$Global_active_power, x = subsetData$DateTime, type = "l", 
      ylab = "Global Active Power", xlab = "")

plot(x=xrange, y=yrange, type = "n", ylab = "Energy sub metering", xlab = "")

points(x=subsetData$DateTime, y=subsetData$Sub_metering_1, col = "black", type = "l")
points(x=subsetData$DateTime, y=subsetData$Sub_metering_2, col = "orange", type = "l")
points(x=subsetData$DateTime, y=subsetData$Sub_metering_3, col = "blue", type = "l")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "orange", "blue")
       , cex = 0.5)

plot(x=subsetData$DateTime, y= subsetData$Voltage, type = "l",  xlab = "datetime", ylab = "Voltage")

plot(x=subsetData$DateTime, y= subsetData$Global_reactive_power, type = "l",  xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480 )
dev.off()
