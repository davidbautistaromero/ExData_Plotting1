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


png("plot3.png", width = 450, height = 450)
with(subsetdata, plot(datetime, Sub_metering_1, type = "l", col = "black",
                      xlab = "", ylab = "Energy sub metering"))
lines(subsetdata$datetime, subsetdata$Sub_metering_2, 
      type = "l", col = "red")
lines(subsetdata$datetime, subsetdata$Sub_metering_3, 
      type = "l", col = "blue")

dev.off()