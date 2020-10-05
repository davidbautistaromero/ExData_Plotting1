## plot 1

data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", stringsAsFactors = FALSE,
                   dec = ".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

sapply(data, class)
data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot1.png", width = 480, height = 480)
with(subsetdata, hist(Global_active_power, col = "red", 
                      main = "Global Active Power", 
                      xlab = "Global Active Power (kilowatts)"))
dev.off()