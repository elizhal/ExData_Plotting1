setwd("/Users/elizabeth/Coursera/ExData_Plotting1")

#upload data from folder into R
totalpower <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE, na.strings = "?")

#make new Datetime variable
totalpower$Datetime <- paste(totalpower$Date, totalpower$Time)
totalpower$Datetime <- strptime(totalpower$Datetime, format = "%d/%m/%Y %H:%M:%S")

#We will only be analyzing data from the dates 2007-02-01 and 2007-02-02.  
#Therefore we need to subset the data.
feb07 <- subset(totalpower, 
                Datetime >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S") & 
                    Datetime < strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %H:%M:%S"))


#Plot linegraph of sub-metering 1,2, and 3
png("plot3.png", width=480, height=480)
plot(feb07$Datetime, feb07$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(feb07$Datetime, feb07$Sub_metering_2, type="l", col="red")
lines(feb07$Datetime, feb07$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()