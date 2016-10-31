#Reading the file (in the same directory)
house <- read.csv("household_power_consumption.txt",header = TRUE, sep=";", na.string = "?")
#Subsetting to separate yr we're going to use
house <- subset(house,house$Date == "1/2/2007" | house$Date == "2/2/2007")
#Generating plot1.png
png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(house$Global_active_power)/500, main = "Global Active Power", xlab = "Global Active Power (killowatts)",col = "red")
dev.off()
