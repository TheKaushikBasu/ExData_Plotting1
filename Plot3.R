# ------------------------------------------------------------------------------------
# Course Name    : Exploratory Data Analysis
# Assignment Name: Peer-graded Assignment: Course Project 1
# File Name      : Plot3.R
# Student Name   : Kaushik Basu
# Created By     : 14-OCT-2017
# ------------------------------------------------------------------------------------

#Load in necessary libraries
library(dplyr)
library(data.table)

#Set working Directory
setwd("E:/Work/Coursera/Exploratory Data Analysis/Assignments")

#Reads in data from file then subsets data for specified dates
dataPowerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subDataPowerConsumption <- subset(dataPowerConsumption, Date %in% c("1/2/2007","2/2/2007"))
subDataPowerConsumption$Date <- as.Date(subDataPowerConsumption$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subDataPowerConsumption$Date), subDataPowerConsumption$Time)
subDataPowerConsumption$Datetime <- as.POSIXct(datetime)

## Saving to Plot3.png file
png("Plot3.png", width=480, height=480)

# Plot 3
with(subDataPowerConsumption, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})


legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Write to File
dev.off()