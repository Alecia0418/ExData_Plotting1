# plot3.R
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

## Create plot3
## 1. Launch png graphics device
png(file = "plot3.png", width = 480, height = 480)

## 2. Create line graph code with legend
plot(powerdata$DateTime, 
     powerdata$Sub_metering_1, type="n", 
          xlab="", ylab="Energy sub metering")
lines(powerdata$DateTime, powerdata$Sub_metering_1)
lines(powerdata$DateTime, powerdata$Sub_metering_2, col='red')
lines(powerdata$DateTime, powerdata$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

## 3. Close Connection
dev.off()
