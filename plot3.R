household_power_consumption <- read.csv("C:/Users/marti/Desktop/Curso R/Project 1/household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE)
HouseEsub <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]
##Set the values and plot 
Days <- strptime(paste(HouseEsub$Date, HouseEsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subM1 <- as.numeric(HouseEsub$Sub_metering_1)
subM2 <- as.numeric(HouseEsub$Sub_metering_2)
subM3 <- as.numeric(HouseEsub$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(Days, subM1, type="l", ylab="Energy Sub metering", xlab="")
lines(Days, subM2, type="l", col="red")
lines(Days, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
dev.off()
