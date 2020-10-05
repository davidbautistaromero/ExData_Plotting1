## plot 4

## plot 3

data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", stringsAsFactors = FALSE,
                   dec = ".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

sapply(data, class)
data$Global_active_power <- as.numeric(data$Global_active_power)
subsetdata$datetime <- strptime(paste(subsetdata$Date, subsetdata$Time,
                                      sep = " "), "%d/%m/%Y %H:%M:%S")
subsetdata$Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3 <- as.numeric(subsetdata$Sub_metering_3)
subsetdata$Voltage <- as.numeric(subsetdata$Voltage)
subsetdata$Global_reactive_power <- as.numeric(subsetdata$Global_reactive_power)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(subsetdata, 
     plot(datetime, Global_active_power, type = "l",
                      xlab = "", ylab = "Global Active Power (kilowatts)"))

with(subsetdata, plot(datetime, Voltage, type = "l"))

with(subsetdata, plot(datetime, Sub_metering_1, type = "l", col = "black",
          xlab = "", ylab = "Energy sub metering"))
     lines(subsetdata$datetime, subsetdata$Sub_metering_2, 
          type = "l", col = "red")
     lines(subsetdata$datetime, subsetdata$Sub_metering_3, 
          type = "l", col = "blue")
     legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = , lwd = 2, bty = "n")
     
with(subsetdata, plot(datetime, Global_reactive_power, type = "l"))
dev.off()