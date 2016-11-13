#Reading in the data and subsetting for the required dates
powerdata <- read.table("household_power_consumption.txt",header = TRUE, sep=";")
subpowerdata <- subset(powerdata, powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")

# Changing the data from factor to numeric
subpowerdata$Global_active_power <- as.numeric(as.character(subpowerdata$Global_active_power))
#combining the date and time in one
datetime <- paste(subpowerdata$Date, subpowerdata$Time)
#converting datetime
newdatetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
#creating png file
png("Plot2.png", width=600, height=600)
#plotting data
plot(newdatetime, subpowerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#closing device
dev.off()