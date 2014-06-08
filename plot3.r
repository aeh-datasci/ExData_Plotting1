hpc<-read.csv2("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
hpc$Date=as.character(hpc$Date)
hpc$Time=as.character(hpc$Time)
hpc$datetime=paste(hpc$Date,hpc$Time)

hpc$Date=as.Date(hpc$Date,format="%d/%m/%Y")

hpc$Global_active_power=as.numeric(hpc$Global_active_power)
hpc$Sub_metering_1=as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2=as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3=as.numeric(hpc$Sub_metering_3)

hpc07=hpc[hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02",]

hpc07$datetime2=strptime(hpc07$datetime, format="%d/%m/%Y %H:%M:%S")

png("plot3.png")
plot(hpc07$datetime2, hpc07$Sub_metering_1, ylab="Energy sub metering",xlab="",type="l",)
lines(hpc07$datetime2, hpc07$Sub_metering_2,col="red", type="l")
lines(hpc07$datetime2, hpc07$Sub_metering_3,col="blue", type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=1, col=c("black","red","blue"))

#dev.copy(png,"plot3.png")
dev.off()
 