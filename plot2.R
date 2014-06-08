
hpc<-read.csv2("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
hpc$Date=as.character(hpc$Date)
hpc$Time=as.character(hpc$Time)
hpc$datetime=paste(hpc$Date,hpc$Time)

hpc$Date=as.Date(hpc$Date,format="%d/%m/%Y")

hpc$Global_active_power=as.numeric(hpc$Global_active_power)

hpc07=hpc[hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02",]

hpc07$datetime2=strptime(hpc07$datetime, format="%d/%m/%Y %H:%M:%S")

plot(hpc07$datetime2, hpc07$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="",type="l")

dev.copy(png,"plot2.png")
dev.off()


