#Reading the file (in the same directory)
house <- read.csv("household_power_consumption.txt",header = TRUE, sep=";", na.string = "?")
#Subsetting to separate yr we're going to use
house <- subset(house,house$Date == "1/2/2007" | house$Date == "2/2/2007")
#converting datetime
house$NDate <- strptime(paste(house$Date, house$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
#4 graphics (2 and 2)
#Generating plot4.png
png(filename = "plot4.png",width = 480, height = 480)
par(mfcol = c(2,2))
#plot 1
plot(house$NDate,house$Global_active_power, type="l",ylab = "Global Active Power (killowatts)",xlab = "")
#plot 2
plot(house$NDate,house$Sub_metering_1, col = "black", type="l",ylab = "Energy sub metering",xlab = "")
lines(house$NDate,house$Sub_metering_2, col = "red")
lines(house$NDate,house$Sub_metering_3, col = "blue")
legend("topright",lty = c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
#plot 3
plot(house$NDate,house$Voltage, type="l",ylab = "datetime",xlab = "Voltage")
#plot 4
plot(house$NDate,house$Global_reactive_power, type="l",ylab = "Global_reactive_power",xlab = "datetime")
#closing device
dev.off()
