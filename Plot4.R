## Read and subset usable data. 
household_power_consumption <- read.csv("C:/Users/marti/Desktop/Curso R/Project 1/household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE)
HouseEsub<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

##Set the values
Days <- strptime(paste(HouseEsub$Date, HouseEsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ActivePower <- as.numeric(HouseEsub$Global_active_power)
ReactivePower <- as.numeric(HouseEsub$Global_reactive_power)
Voltage <- as.numeric(HouseEsub$Voltage)
subM1 <- as.numeric(HouseEsub$Sub_metering_1)
subM2 <- as.numeric(HouseEsub$Sub_metering_2)
subM3 <- as.numeric(HouseEsub$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(Days, ActivePower, type="l",xlab="", ylab="Global Active Power")

plot(Days,Voltage,ylab="Voltage",type="l")

plot(Days, subM1, type="l", ylab="Energy Sub metering", xlab="")
lines(Days, subM2, type="l", col="red")
lines(Days, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Days, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
