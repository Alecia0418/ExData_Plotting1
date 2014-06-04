# plot1.R
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

## Create plot1
## 1. Launch png graphics device
png(file = "plot1.png", width = 480, height = 480)

## 2. Create histogram
hist(powerdata$Global_active_power, main="Global Active Power", 
          xlab="Global Active Power (kilowatts)", col="red")

## 3. Close Connection
dev.off()
