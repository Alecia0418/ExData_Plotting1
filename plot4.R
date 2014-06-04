# plot4.R
## If needed, run the following to read in the dataset.  Make sure file is in wd.
powerdata <- read.table('household_power_consumption.txt', sep=';', header=T, 
                  colClasses = c('character', 'character', 'numeric','numeric', 'numeric', 
                                 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')
powerdata$DateTime <- strptime(paste(powerdata$Date, 
                                     powerdata$Time),  "%d/%m/%Y %H:%M:%S")
powerdata <- subset(powerdata,
                    as.Date(DateTime) >= as.Date("2007-02-01") & 
                    as.Date(DateTime) <= as.Date("2007-02-02"))

## Run this code after reading in the dataset and changing the dates.

## Create plot4
## 1. Launch png graphics device
png(file = "plot4.png", width = 480, height = 480)

## Change options for multiple plots
par(mfrow=c(2,2))

## 2. Create 4 plots
## 2a. GAP plot
plot(powerdata$DateTime, powerdata$Global_active_power, type="n", 
     xlab="", ylab="Global Active Power")
lines(powerdata$DateTime, powerdata$Global_active_power) 

## 2b. Voltage plot
plot(powerdata$DateTime, powerdata$Voltage,  type="n",
     xlab="datetime", ylab="Voltage")
lines(powerdata$DateTime, powerdata$Voltage)

## 2c. SM plot
plot(powerdata$DateTime, 
     powerdata$Sub_metering_1, type="n", 
     xlab="", ylab="Energy sub metering")
lines(powerdata$DateTime, powerdata$Sub_metering_1)
lines(powerdata$DateTime, powerdata$Sub_metering_2, col='red')
lines(powerdata$DateTime, powerdata$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty="n")

## 2d. GRP plot
plot(powerdata$DateTime, powerdata$Global_reactive_power,  type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(powerdata$DateTime, powerdata$Global_reactive_power)

## 3. Close connection
dev.off()
