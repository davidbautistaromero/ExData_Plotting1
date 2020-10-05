##plot 2

data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", stringsAsFactors = FALSE,
                   dec = ".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

sapply(data, class)
data$Global_active_power <- as.numeric(data$Global_active_power)
subsetdata$datetime <- strptime(paste(subsetdata$Date, subsetdata$Time,
                                      sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
with(subsetdata, plot(datetime, Global_active_power, type = "l",
                      xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
