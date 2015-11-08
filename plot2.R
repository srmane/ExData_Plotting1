## plot2.R Exploratory Data Analysis - Course Project 1

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
plot(hpcdata$DateTime, hpcdata$Global_active_power, 
                    pch = NA, xlab = "", ylab = 'Global Active Power (kilowatts)')
lines(hpcdata$DateTime, hpcdata$Global_active_power)

## Save as PNG
dev.copy(device = png, filename = 'plot2.png')
dev.off()