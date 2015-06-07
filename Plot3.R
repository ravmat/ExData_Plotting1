#Include Date manipulation library
library(lubridate)

#Read in the data 
powerTable <- read.csv(file="household_power_consumption.txt", header = TRUE, sep=";")

## Need only 2007-02-01 and 2007-02-02
powerTable_Sub <- powerTable[(powerTable$Date) == "1/2/2007" | powerTable$Date == "2/2/2007",]

#set margin
par(mar = rep(8, 8))
par(mfrow=c(1,1))

#Draw the plots

plot3DataFr <- data.frame(daytime=dmy(powerTable_Sub$Date) + hms(powerTable_Sub$Time), 
                          Submeter1=as.numeric(as.character(powerTable_Sub$Sub_metering_1)), 
                          Submeter2=as.numeric(as.character(powerTable_Sub$Sub_metering_2)), 
                          Submeter3=as.numeric(as.character(powerTable_Sub$Sub_metering_3))) 
plot(plot3DataFr$daytime, plot3DataFr$Submeter1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(plot3DataFr$daytime, plot3DataFr$Submeter2, type="l", xlab="", ylab="Energy sub metering", col="red")
lines(plot3DataFr$daytime, plot3DataFr$Submeter3, type="l", xlab="", ylab="Energy sub metering", col="blue")
legend("topright", lty="solid", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Generate plot as the PNG file
dev.copy(png, "plot3.png", width=480, height=480, units="px")
dev.off()

