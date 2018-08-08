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

### Plot 4 ###

png(filename='plot4.png')
par(mfrow=c(2,2))
plot(powersub$Time,powersub$Global_active_power,type = 'l',xlab='',ylab='Global Active Power')
plot(powersub$Time,powersub$Voltage,xlab='datetime',ylab='Voltage',type='l')
with(powersub,plot(Time,Sub_metering_1,type='n',xlab='',ylab='Energy sub metering'))
points(powersub$Time,powersub$Sub_metering_1,type='l')
points(powersub$Time,powersub$Sub_metering_2,type='l',col='red')
points(powersub$Time,powersub$Sub_metering_3,type='l',col='blue')
legend('topright',col=c('black','red','blue'),lty=c(1,1,1),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),bty='n')
plot(powersub$Time,powersub$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')
dev.off()
