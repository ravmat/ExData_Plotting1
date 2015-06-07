#Include Date manipulation library
library(lubridate)

#Read in the data 
powerTable <- read.csv(file="household_power_consumption.txt", header = TRUE, sep=";")

## Need only 2007-02-01 and 2007-02-02
powerTable_Sub <- powerTable[(powerTable$Date) == "1/2/2007" | powerTable$Date == "2/2/2007",]

#set margin
par(mar=c(2,4,2,4))

#Draw the plots
plot4DataFr <- data.frame(daytime=dmy(powerTable_Sub$Date) + hms(powerTable_Sub$Time), 
                      Power=as.numeric(as.character(powerTable_Sub$Global_active_power)), 
                      Voltage=as.numeric(as.character(powerTable_Sub$Voltage)), 
                      Submeter1=as.numeric(as.character(powerTable_Sub$Sub_metering_1)), 
                      Submeter2=as.numeric(as.character(powerTable_Sub$Sub_metering_2)), 
                      Submeter3=as.numeric(as.character(powerTable_Sub$Sub_metering_3)), 
                      Global_reactive_power=as.numeric(as.character(powerTable_Sub$Global_reactive_power)))
attach(plot4DataFr)
par(mfrow=c(2,2))
plot(daytime, Power, type="l", xlab="", ylab="Global Active Power (kilowatts)", 
     cex.lab=0.50, cex.axis=0.50)
plot(daytime, Voltage, type="l", cex.lab=0.50, cex.axis=0.50)
plot(daytime, Submeter1, type="l", xlab="", ylab="Energy sub metering", col="black", 
     cex.lab=0.50, cex.axis=0.50)
lines(daytime, Submeter2, type="l", xlab="", ylab="Energy sub metering", col="red", 
      cex.lab=0.50, cex.axis=0.50)
lines(daytime, Submeter3, type="l", xlab="", ylab="Energy sub metering", col="blue", 
      cex.lab=0.50, cex.axis=0.50)
legend("topright", lty="solid", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex=0.30)
plot(daytime, Global_reactive_power, type="l", cex.lab=0.5, cex.axis=0.50)

#Generate plot as the PNG file
dev.copy(png, "plot4.png", width=480, height=480, units="px")
dev.off()

