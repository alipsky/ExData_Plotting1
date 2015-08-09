dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot4from the subsetted data
combdatetime <- strptime(paste(Subset$Date, Subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Subset$Global_active_power)
globalReactivePower <- as.numeric(Subset$Global_reactive_power)
voltage <- as.numeric(Subset$Voltage)
subMetering1 <- as.numeric(Subset$Sub_metering_1)
subMetering2 <- as.numeric(Subset$Sub_metering_2)
subMetering3 <- as.numeric(Subset$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(combdatetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(combdatetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(combdatetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(combdatetime, subMetering2, type="l", col="red")
lines(combdatetime, subMetering3, type="l", col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

plot(combdatetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()