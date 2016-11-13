#Reading in the data and subsetting for the required dates
powerdata <- read.table("household_power_consumption.txt",header = TRUE, sep=";")
subpowerdata <- subset(powerdata, powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")
# Changing the data from factor to numeric
subpowerdata$Global_active_power <- as.numeric(as.character(subpowerdata$Global_active_power))
subpowerdata$Sub_metering_1 <- as.numeric(as.character(subpowerdata$Sub_metering_1))
subpowerdata$Sub_metering_2 <- as.numeric(as.character(subpowerdata$Sub_metering_2))
subpowerdata$Voltage <- as.numeric(as.character(subpowerdata$Voltage))
subpowerdata$Global_reactive_power <- as.numeric(as.character(subpowerdata$Global_reactive_power))
#combining date and time
datetime <- paste(subpowerdata$Date, subpowerdata$Time)
#converting datetime
newdatetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
#creating png file
png("Plot4.png", width=600, height=600)
#setting graph row and column
par(mfrow=c(2,2))
#Plot1
plot(newdatetime, subpowerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#Plot 2
plot(newdatetime, subpowerdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
#Plot 3
plot(newdatetime, subpowerdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(newdatetime, subpowerdata$Sub_metering_2, type="l", col = "red")
lines(newdatetime, subpowerdata$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
#Plot 4
plot(newdatetime, subpowerdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#closing the device
dev.off()