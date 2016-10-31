#Reading the file (in the same directory)
house <- read.csv("household_power_consumption.txt",header = TRUE, sep=";",na.string = "?")
#Subsetting to separate yr we're going to use
house <- subset(house,house$Date == "1/2/2007" | house$Date == "2/2/2007")
#Generating plot3.png
png(filename = "plot3.png",width = 480, height = 480)
#converting datetime
house$NDate <- strptime(paste(house$Date, house$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(house$NDate,house$Sub_metering_1, col = "black", type="l",ylab = "Energy sub metering",xlab = "")
lines(house$NDate,house$Sub_metering_2, col = "red")
lines(house$NDate,house$Sub_metering_3, col = "blue")
legend("topright",lty = c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
dev.off()
