#Reading the file (in the same directory)
house <- read.csv("household_power_consumption.txt",header = TRUE, sep=";",na.string = "?")
#Subsetting to separate yr we're going to use
house <- subset(house,house$Date == "1/2/2007" | house$Date == "2/2/2007")
#Generating plot2.png
png(filename = "plot2.png",width = 480, height = 480)
#converting datetime
house$NDate <- strptime(paste(house$Date, house$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
plot(house$NDate,house$Global_active_power, type="l",ylab = "Global Active Power (killowatts)",xlab = "")
dev.off()
