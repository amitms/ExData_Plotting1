#download,read and read data are in plot1.R
#convert data and time
DateTime <- strptime(paste(electric_data$Date, electric_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(electric_data$Global_active_power)

if(!file.exists('figure')) dir.create('figure')
png(filename='./figure/plot2.png',width=480, height = 480,units='px')

######plot2
Sys.setlocale(category="LC_ALL",locale="english")
plot(DateTime,globalActivePower,xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
dev.off()
