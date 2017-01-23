library(lubridate)

# Load the data
data <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep=";")

# Change the Date column to date type using lubridate
data$Date <- dmy(data$Date)

# Change the Time column to time type using lubridate
data$Time <- hms(data$Time)

# Subset the data to the two days for this assignment
twodays <- subset(data,data$Date == '2007-02-01' | data$Date == '2007-02-02')

# Create graph and save
png("plot3.png", width = 480, height = 480)
with(twodays, plot(Date+Time, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l", col="black"))
with(twodays,points(Date+Time, Sub_metering_2, type = "l", col="red"))
with(twodays, points(Date+Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))     
dev.off()