
hpc<-read.csv2("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
hpc$Date=as.Date(hpc$Date,format="%d/%m/%Y")
hpc$Global_active_power=as.numeric(hpc$Global_active_power)

hpc07=hpc[hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02",]

hist(hpc07$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power",col="red")
dev.copy(png,"plot1.png")
dev.off()