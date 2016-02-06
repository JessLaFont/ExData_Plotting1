#Exploratory Data Anaysis in R - Course Project 1
## Plot 3
### 1. Load data for UCI Electric Power Consumption
file <- "./household_power_consumption.txt"
dt <- read.csv2(file, header = TRUE, stringsAsFactors = FALSE, dec = ".")
### 2. Subset data by dates
Focus <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"), ]
### 3. Reclassify Variable(s) 
GAP <- as.numeric(Focus$Global_active_power)
Date <- as.Date(Focus$Date, format = "%d/%m/%Y")
SubM1 <- as.numeric(Focus$Sub_metering_1)
SubM2 <- as.numeric(Focus$Sub_metering_2)
SubM3 <- as.numeric(Focus$Sub_metering_3)
### 4. Create New Variable(s)
DateTime <- paste(Date, Focus$Time, sep = " ")
DateTime <- strftime(DateTime, format = "%Y/%m/%d %H:%M:%S")
DateTime <- strptime(DateTime, format = "%Y/%m/%d %H:%M:%S")
### 5. Create Plot
png("plot3.png", width = 480, height = 480)
plot(DateTime, SubM1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(DateTime, SubM2, type = "l", col = "red")
lines(DateTime, SubM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2.5)
dev.off()