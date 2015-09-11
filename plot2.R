# It takes time to download and unzip the file
# It has been done once in plot1.R
# We will assume that the data file "household_power_consumption.txt" is in the current directory

# Loading Data
colN <- names(read.csv("household_power_consumption.txt", sep = ";", nrows = 1))
epc <- read.csv("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 2880, header = TRUE, na.strings = "?", col.names = colN)
epc$Time <- as.POSIXct(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
#epc$Time <- strptime(epc$Time, format="%H:%M:%S")
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")

# Plot
plot (Global_active_power ~ Time, data = epc, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()
