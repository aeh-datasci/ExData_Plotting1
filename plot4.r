hpc<-read.csv2("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")
hpc$Date=as.character(hpc$Date)
hpc$Time=as.character(hpc$Time)
hpc$datetime=paste(hpc$Date,hpc$Time)

hpc$Date=as.Date(hpc$Date,format="%d/%m/%Y")

hpc07=hpc[hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02",]

hpc07$datetime=strptime(hpc07$datetime, format="%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))
#UL plot: same as plot2
plot(hpc07$datetime, hpc07$Global_active_power, ylab="Global Active Power (kilowatts)",xlab="",type="l")
#UR plot
plot(hpc07$datetime, hpc07$Voltage,ylab="Voltage",xlab="datetime",type="l")
#LL plot: same as plot3
plot(hpc07$datetime, hpc07$Sub_metering_1, ylab="Energy sub metering",xlab="",type="l",)
lines(hpc07$datetime, hpc07$Sub_metering_2,col="red", type="l")
lines(hpc07$datetime, hpc07$Sub_metering_3,col="blue", type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=1, col=c("black","red","blue"), bty="n")
#LR plot
plot(hpc07$datetime, hpc07$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
dev.off()

par(mfrow=c(1,1))
