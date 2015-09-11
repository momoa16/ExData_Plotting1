# It takes time to download and unzip the file
# It has been done once in plot1.R
# We will assume that the data file "household_power_consumption.txt" is in the current directory

# Loading Data
colN <- names(read.csv("household_power_consumption.txt", sep = ";", nrows = 1))
epc <- read.csv("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 2880, header = TRUE, na.strings = "?", col.names = colN)
epc$Time <- as.POSIXct(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")

# Plot
par(mfcol = c(2, 2), cex=0.65)
with(epc, {
plot (Global_active_power ~ Time, type="l", xlab="", ylab = "Global Active Power")

plot (Sub_metering_1 ~ Time, type="l", xlab="", ylab = "Energy sub metering")
lines(x= epc$Time, y=epc$Sub_metering_2, col = "red")
lines(x= epc$Time, y=epc$Sub_metering_3, col = "blue")
legend("topright", lty="solid", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot (Voltage ~ Time, type="l", xlab="datetime")

plot (Global_reactive_power ~ Time, type="l", xlab="datetime")
})

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()