rm(list=ls())
getwd()
setwd("/Users/edmondlowjy/datasciencecoursera/Exploratory-Data-Analysis/Week\ 1/ExData_Plotting1")

### Reading in data ###

library(data.table)
power=fread('household_power_consumption.txt')

### Subsetting for chosen Dates ###

powersub=data.frame(subset(power,Date=='1/2/2007' | Date=='2/2/2007'))
powersub[,-(1:2)]=apply(powersub[,-(1:2)], MARGIN = 2, FUN=function(x){as.numeric(x)}) #converting columns to numeric

### Converting to Date/Time ###

powersub$Time=strptime(paste(powersub$Date,powersub$Time), format='%d/%m/%Y %H:%M:%S')
powersub$Date=as.Date(powersub$Date,format='%d/%m/%Y')
rm(list=c('power'))

### Plot 1 ###

png(filename='plot1.png')
hist(powersub$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()


