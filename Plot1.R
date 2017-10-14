# ------------------------------------------------------------------------------------
# Course Name    : Exploratory Data Analysis
# Assignment Name: Peer-graded Assignment: Course Project 1
# File Name      : Plot1.R
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

# Save the plotted graph to Plot1.png
png("Plot1.png", width=480, height=480)

# Plot Graph
hist(subDataPowerConsumption$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Write to File
dev.off()