#Reading in the data and subsetting for the required dates
powerdata <- read.table("household_power_consumption.txt",header = TRUE, sep=";")
subpowerdata <- subset(powerdata, powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")
# Changing the data from factor to numeric
subpowerdata$Global_active_power <- as.numeric(as.character(subpowerdata$Global_active_power))
#create png file
png("Plot1.png", width=480, height=480)
# Calling the graph
hist(subpowerdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
#closing device
dev.off()







plot(subpowerdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", type="1")

subpowerdata$Date <- as.Date(subpowerdata$Date, format="%d/%m/%Y")
