# download and unzip the data file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
unzip(temp, "household_power_consumption.txt")
unlink(temp)

# Loading Data
# Assuming that the file doesn't change. i.e. 1/2/2007 starts at line 66638 and
#   2 days takes 2880 rows (60*24*2)
# if the file is already dowloaded comment the following line and uncomment the line after
colN <- names(read.csv("household_power_consumption.txt", sep = ";", nrows = 1))
#colN <- names(read.csv("household_power_consumption.txt", sep = ";", nrows = 1))
epc <- read.csv("household_power_consumption.txt", sep = ";", skip = 66636, nrows = 2880, header = TRUE, na.strings = "?", col.names = colN)
#epc$Time <- as.POSIXct(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
epc$Time <- strptime(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")

# Plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(epc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
