#download,read and read data are in plot1.R
#stripint same as from plot2.R
electric_data$DateTime <- strptime(paste(electric_data$Date, electric_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(electric_data$Global_active_power)
globalReactivePower <- as.numeric(electric_data$Global_reactive_power)
voltage <- as.numeric(electric_data$Voltage)
subMetering1 <- as.numeric(electric_data$Sub_metering_1)
subMetering2 <- as.numeric(electric_data$Sub_metering_2)
subMetering3 <- as.numeric(electric_data$Sub_metering_3)

if(!file.exists('figure')) dir.create('figure')
png(filename='./figure/plot4.png',width=480, height = 480,units='px')

#plot4
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mfrow=c(2,2))
#par(mar = rep(2, 4))
plot(electric_data$DateTime,electric_data$Global_active_power, xlab='',ylab='Global Active Power (kilowatt)', type = 'l')
plot(electric_data$DateTime,electric_data$Voltage, xlab= 'datetime', ylab= 'Voltage', type = 'l')
plot(electric_data$DateTime,electric_data$Sub_metering_1, xlab = '', ylab= 'Energy sub metering', type = 'l')
lines(electric_data$DateTime,electric_data$Sub_metering_2,col = 'red')
lines(electric_data$DateTime,electric_data$Sub_metering_3,col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(electric_data$DateTime, electric_data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
# close device
dev.off()
