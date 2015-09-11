# Loading Data
colN <- names(read.csv("household_power_consumption.txt", sep = ";", nrows = 1))
epc <- read.csv("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 2880, header = TRUE, na.strings = "?", col.names = colN)
#epc$Time <- as.POSIXct(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
epc$Time <- strptime(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")

# Plot
# png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(epc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
# dev.off()
