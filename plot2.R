#Exploratory Data Anaysis in R - Course Project 1
## Plot 2
### 1. Load data for UCI Electric Power Consumption
file <- "./household_power_consumption.txt"
dt <- read.csv2(file, header = TRUE, stringsAsFactors = FALSE, dec = ".")
### 2. Subset data by dates
Focus <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"), ]
### 3. Reclassify Variable(s) 
GAP <- as.numeric(Focus$Global_active_power)
Date <- as.Date(Focus$Date, format = "%d/%m/%Y")
### 4. Create New Variable(s)
DateTime <- paste(Date, Focus$Time, sep = " ")
DateTime <- strptime(DateTime, format = "%Y/%m/%d %H:%M:%S")
### 5. Create Plot
png("plot2.png", width = 480, height = 480)
plot(DateTime, GAP, type= "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()