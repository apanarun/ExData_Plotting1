##Load Data File
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

##Format Date + Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
##data_load$Time <- as.POSIXct(data_load$Time, format = "%H:%M:%s")

##Subset Data to date ranges provided
data_subset <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

##Combine Date + Time into new column
data_subset$TS <- as.POSIXct(paste(data_subset$Date, data_subset$Time))

##Output Plot to 480 x 480 png
png("plot1.png", height = 480, width = 480)
hist(data_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()