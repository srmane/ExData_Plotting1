## plot4.R Exploratory Data Analysis - Course Project 1

## Load data from the file 
hpcdata <- read.table('./data/household_power_consumption.txt', sep=';', header=T, 
                      colClasses = c('character', 'character', 'numeric',
                                     'numeric', 'numeric', 'numeric',
                                     'numeric', 'numeric', 'numeric'), na.strings='?')

## convert dates in R format
hpcdata$DateTime <- strptime(paste(hpcdata$Date, hpcdata$Time), "%d/%m/%Y %H:%M:%S")

## Subset data for two days per requirement
hpcdata <- subset(hpcdata, as.Date(DateTime) >= as.Date("2007-02-01") & 
                    as.Date(DateTime) <= as.Date("2007-02-02"))

## Set device for four plots
par(mfrow=c(2,2))

## Generate Global Active Power Plot
plot(hpcdata$DateTime, hpcdata$Global_active_power, xlab="", pch=NA, 
     ylab="Global Active Power")
lines(hpcdata$DateTime, hpcdata$Global_active_power)

## Generate Voltage Plot
plot(hpcdata$DateTime, hpcdata$Voltage, pch=NA, xlab="datetime", ylab="Voltage")
lines(hpcdata$DateTime, hpcdata$Voltage)

## Generate Sub Metering Plot
plot(hpcdata$DateTime, hpcdata$Sub_metering_1,  
     pch = NA, xlab = "", ylab = 'Energy sub metering')
lines(hpcdata$DateTime, hpcdata$Global_active_power)
lines(hpcdata$DateTime, hpcdata$Sub_metering_2, col='red')
lines(hpcdata$DateTime, hpcdata$Sub_metering_3, col='blue')
legend(x = hpcdata$DateTime[1950], y = 38.5, lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       cex = 0.25, box.col=NA) 

## Generate Global Reactive Power Plot
with(hpcdata, plot(DateTime, Global_reactive_power, pch=NA, xlab='datetime'))
with(hpcdata, lines(DateTime, Global_reactive_power))

## Save as PNG
dev.copy(device = png, filename = 'plot4.png')
dev.off()