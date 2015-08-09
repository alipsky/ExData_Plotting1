dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot3from the subsetted data
combdatetime <- strptime(paste(Subset$Date, Subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Subset$Global_active_power)
subMetering1 <- as.numeric(Subset$Sub_metering_1)
subMetering2 <- as.numeric(Subset$Sub_metering_2)
subMetering3 <- as.numeric(Subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(combdatetime, subMetering1, type="l", ylab="Energy sub metering", xlab="") #scatterplot using invisitble dots
lines(combdatetime, subMetering2, type="l", col="red")
lines(combdatetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()