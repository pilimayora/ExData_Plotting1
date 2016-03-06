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

# Replace by URL where graph should be saved
png("/Users/pilimayora/Sites/personal/ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px")
# Create line graph
plot(x = epc_feb$datetime, y = epc_feb$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")
# Close graphic device
dev.off()