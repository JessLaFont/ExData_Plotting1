#Exploratory Data Anaysis in R - Course Project 1
## Plot 4
### 1. Load data for UCI Electric Power Consumption
file <- "./household_power_consumption.txt"
dt <- read.csv2(file, header = TRUE, stringsAsFactors = FALSE, dec = ".")
### 2. Subset data by dates
Focus <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"), ]
### 3. Reclassify Variables 
Date <- as.Date(Focus$Date, format = "%d/%m/%Y")
GAP <- as.numeric(Focus$Global_active_power)
GRP <- as.numeric(Focus$Global_reactive_power)
Voltage <- as.numeric(Focus$Voltage)
SubM1 <- as.numeric(Focus$Sub_metering_1)
SubM2 <- as.numeric(Focus$Sub_metering_2)
SubM3 <- as.numeric(Focus$Sub_metering_3)
### 4. Make new Variables
DateTime <- paste(Date, Focus$Time, sep = " ")
DateTime <- strftime(DateTime, format = "%Y/%m/%d %H:%M:%S")
DateTime <- strptime(DateTime, format = "%Y/%m/%d %H:%M:%S")
### 5. Create Plot(s)
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(DateTime, GAP, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(DateTime, SubM1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(DateTime, SubM2, type = "l", col = "red")
lines(DateTime, SubM3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty= "o")
plot(DateTime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
