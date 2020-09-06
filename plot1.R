## Read and subset usable data. 
household_power_consumption <- read.csv("C:/Users/marti/Desktop/Curso R/Project 1/household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE)
HouseEsub<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]
##Set the values
Days <- strptime(paste(HouseEsub$Date, HouseEsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower <- as.numeric(HouseEsub$Global_active_power)
#Set plot panel to show 
png("plot1.png", width=480, height=480)
hist(ActivePower,main= "Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")
dev.off()
