# Replace by URL where file was downloaded
epc <- read.csv("/Users/pilimayora/Downloads/household_power_consumption.txt", sep=";")

# Change ? by NA
epc[epc == "?"] <- NA
# Update date column as Date
epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# Subset only Feb1st and Feb2nd, 2007
epc_feb <- subset(epc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
# Update Global Active Power column as numeric
epc_feb$Global_active_power <- as.numeric(as.character(epc_feb$Global_active_power))

# Replace by URL where graph should be saved
png("/Users/pilimayora/Sites/personal/ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")
# Generate graph
hist(epc_feb$Global_active_power, breaks=15, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
# Close graphic device
dev.off()