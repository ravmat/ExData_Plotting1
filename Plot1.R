
#Read in the data 
powerTable <- read.csv(file="household_power_consumption.txt", header = TRUE, sep=";")

## Need only 2007-02-01 and 2007-02-02
plot1Table <- powerTable[(powerTable$Date) == "1/2/2007" | powerTable$Date == "2/2/2007",]

#set margin
par(mar=c(2,4,2,4))
par(mfrow=c(1,1))

#Draw a histogram
hist(as.numeric(as.character(plot1Table$Global_active_power)), col="red", breaks=20, 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Generate plot as the PNG file
dev.copy(png, "plot1.png", width=480, height=480, units="px")
dev.off()

