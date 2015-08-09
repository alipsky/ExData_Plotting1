dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot2from the subsetted data
combdatetime <- strptime(paste(Subset$Date, Subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(combdatetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()