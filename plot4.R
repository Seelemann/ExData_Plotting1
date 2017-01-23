library(lubridate)

# Load the data
data <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep=";")

# Change the Date column to date type using lubridate
data$Date <- dmy(data$Date)

# Change the Time column to time type using lubridate
data$Time <- hms(data$Time)

# Subset the data to the two days for this assignment
twodays <- subset(data,data$Date == '2007-02-01' | data$Date == '2007-02-02')

# Create panel of graphs and save to plot4.png
png("plot4.png", width = 480, height = 480)

# Set up dimensions of panel
par(mfrow = c(2,2))

# Plot top left graph
with(twodays, plot(Date+Time, Global_active_power, ylab = "Global Active Power", type = "l"))

# Plot top right graph
with(twodays, plot(Date+Time, Voltage, ylab = "Voltage", xlab = "datetime", type = "l"))

# Plot bottom left graph
with(twodays, plot(Date+Time, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", col="black"))
with(twodays,points(Date+Time, Sub_metering_2, type = "l", col="red"))
with(twodays, points(Date+Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))    

# Plot bottom right graph
with(twodays, plot(Date+Time, Global_reactive_power, xlab = "datetime", type = "l"))

dev.off()