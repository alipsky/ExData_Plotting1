dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot1from the subsetted data
globalactivepower <- as.numeric(Subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()