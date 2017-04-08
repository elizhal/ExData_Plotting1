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

#set up a 2x2 matrix for 4 unique graphs in one png
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#Plot line graph of Global Active Power for [1,1]
plot(feb07$Datetime,feb07$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#Plot line graph of Voltage for [1,2]
plot(feb07$Datetime,feb07$Voltage, type="l",
     ylab="Voltage", xlab="")

#Plot energy submetering for [2,1]
plot(feb07$Datetime, feb07$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(feb07$Datetime, feb07$Sub_metering_2, type="l", col="red")
lines(feb07$Datetime, feb07$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot Global reactive power for [2,2]
plot(feb07$Datetime,feb07$Global_reactive_power, type="l",
     ylab="Voltage", xlab="")

dev.off()
