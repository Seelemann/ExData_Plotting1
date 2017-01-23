library(lubridate)

# Load the data
data <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep=";")

# Change the Date column to date type using lubridate
data$Date <- dmy(data$Date)

# Change the Time column to time type using lubridate
data$Time <- hms(data$Time)

# Subset the data to the two days for this assignment
twodays <- subset(data,data$Date == '2007-02-01' | data$Date == '2007-02-02')

# Create histogram and save
png("plot1.png", width = 480, height = 480)
with(twodays, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))
dev.off()
