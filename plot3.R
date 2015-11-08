## plot3.R Exploratory Data Analysis - Course Project 1

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

## Generate the plot
plot(hpcdata$DateTime, hpcdata$Sub_metering_1,  
     pch = NA, xlab = "", ylab = 'Energy sub metering')
lines(hpcdata$DateTime, hpcdata$Global_active_power)
lines(hpcdata$DateTime, hpcdata$Sub_metering_2, col='red')
lines(hpcdata$DateTime, hpcdata$Sub_metering_3, col='blue')
legend('topright', lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.65)


## Save as PNG
dev.copy(device = png, filename = 'plot3.png')
dev.off()