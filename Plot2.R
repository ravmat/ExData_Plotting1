library(lubridate)

#Read in the data 
powerTable <- read.csv(file="household_power_consumption.txt", header = TRUE, sep=";")

## Need only 2007-02-01 and 2007-02-02
plot2Table <- powerTable[(powerTable$Date) == "1/2/2007" | powerTable$Date == "2/2/2007",]

#set margin
par(mar=c(2,4,2,4))
par(mfrow=c(1,1))

#Draw the 2D plot
powerTable_DF <- data.frame(daytime=dmy(plot2Table$Date) + hms(plot2Table$Time), 
                                                Power=as.numeric(as.character(plot2Table$Global_active_power)))
plot(powerTable_DF, type="l", xlab="", ylab="Global Active Power (KiloWatts)")
   
#Generate plot as the PNG file
dev.copy(png, "plot2.png", width=480, height=480, units="px")
dev.off()

