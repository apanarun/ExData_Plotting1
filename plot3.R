##Load Data File

data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                 stringsAsFactors=FALSE, na.strings = "?", dec=".")

##Format Date + Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##data$Time <- as.POSIXct(data$Time, format = "%H:%M:%s")

##Subset Data to date ranges provided
data_subset <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")


##Combine Date + Time into new column
data_subset$TS <- as.POSIXct(paste(data_subset$Date, data_subset$Time, seperator = " "))


##Output Plot to 480 x 480 png
png("plot3.png", height = 480, width = 480)
plot(data_subset$Sub_metering_1~data_subset$TS, type = "l", ylab = "Energy sub metering", xlab = "")
##lines(data_subset$TS, data_subset$Sub_metering_1)
lines(data_subset$TS, data_subset$Sub_metering_2, col = "red")
lines(data_subset$TS, data_subset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))

dev.off()