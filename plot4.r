# Replace by URL where file was downloaded
epc <- read.csv("/Users/pilimayora/Downloads/household_power_consumption.txt", sep=";")

# Change ? by NA
epc[epc == "?"] <- NA
# Update date column as Date
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# Subset only Feb1st and Feb2nd, 2007
epc_feb <- subset(epc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

# Create datetime column
epc_feb$datetime <- as.POSIXct(paste(epc_feb$Date, epc_feb$Time), format="%Y-%m-%d %H:%M:%S")

# Update Global Active Power column as numeric
epc_feb$Global_active_power <- as.numeric(as.character(epc_feb$Global_active_power))
# Update Global Reactive Power column as numeric
epc_feb$Global_reactive_power <- as.numeric(as.character(epc_feb$Global_reactive_power))
# Update Voltage column as numeric
epc_feb$Voltage <- as.numeric(as.character(epc_feb$Voltage))
# Update Sub_metering columns as numeric
epc_feb$Sub_metering_1 <- as.numeric(as.character(epc_feb$Sub_metering_1))
epc_feb$Sub_metering_2 <- as.numeric(as.character(epc_feb$Sub_metering_2))
epc_feb$Sub_metering_3 <- as.numeric(as.character(epc_feb$Sub_metering_3))

# Replace by URL where graph should be saved
png("/Users/pilimayora/Sites/personal/ExData_Plotting1/plot4.png", width = 480, height = 480, units = "px")

# Two rows, two columns
par(mfrow=c(2,2))

# Top-left graph
plot(x = epc_feb$datetime, y = epc_feb$Global_active_power, type = "l", xlab = "", ylab="Global Active Power")
# Top-right graph
plot(x = epc_feb$datetime, y = epc_feb$Voltage, type = "l", xlab = "", ylab="Voltage")
# Bottom-left graph
plot(epc_feb$datetime, epc_feb$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(epc_feb$datetime, epc_feb$Sub_metering_2, col="red")
lines(epc_feb$datetime, epc_feb$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), lty=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
# Bottom-right graph
plot(x = epc_feb$datetime, y = epc_feb$Global_reactive_power, type = "l", xlab = "", ylab="Global_reactive_power")

# Close graphic device
dev.off()