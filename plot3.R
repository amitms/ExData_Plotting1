#download,read and read data are in plot1.R
#stripint same as from plot2.R
electric_data$DateTime <- strptime(paste(electric_data$Date, electric_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

if(!file.exists('figure')) dir.create('figure')
png(filename='./figure/plot3.png',width=480, height = 480,units='px')

#plot3
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(electric_data$DateTime, electric_data$Sub_metering_1, xlab='', ylab = 'Energy sub metering', type = 'l')
lines(electric_data$DateTime, electric_data$Sub_metering_2, col='red')
lines(electric_data$DateTime, electric_data$Sub_metering_3, col='blue')
legend('topright',col = c('black', 'red', 'blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd = 1)
dev.off()
