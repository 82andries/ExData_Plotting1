#Reading in the data and subsetting for the required dates
powerdata <- read.table("household_power_consumption.txt",header = TRUE, sep=";")
subpowerdata <- subset(powerdata, powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")
# Changing the data from factor to numeric
subpowerdata$Global_active_power <- as.numeric(as.character(subpowerdata$Global_active_power))
subpowerdata$Sub_metering_1 <- as.numeric(as.character(subpowerdata$Sub_metering_1))
subpowerdata$Sub_metering_2 <- as.numeric(as.character(subpowerdata$Sub_metering_2))
#combining date and time in one
datetime <- paste(subpowerdata$Date, subpowerdata$Time)
#convert datetime
newdatetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
#creating png file
png("Plot3.png", width=480, height=480)
#create plot
plot(newdatetime, subpowerdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
#adding extra data to plot
lines(newdatetime, subpowerdata$Sub_metering_2, type="l", col = "red")
lines(newdatetime, subpowerdata$Sub_metering_3, type="l", col = "blue")
#adding the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
#closing the device
dev.off()
