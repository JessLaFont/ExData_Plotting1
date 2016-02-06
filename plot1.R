#Exploratory Data Anaysis in R - Course Project 1
## Plot 1
### 1. Load data for UCI Electric Power Consumption
file <- "./household_power_consumption.txt"
dt <- read.csv2(file, header = TRUE, stringsAsFactors = FALSE, dec = ".")
### 2. Subset data by dates
Focus <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"), ]
### 3. Reclassify Variables 
GAP <- as.numeric(Focus$Global_active_power)
### 4. Create Plot
png("plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()