## read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

##convert dates
Date.form <- as.Date(data[,1],format="%d/%m/%Y")
data2 <- cbind(data,Date.form)

##select sample dates
feb1 <- data2[data2$Date.form == "2007-02-01",]
feb2 <- data2[data2$Date.form == "2007-02-02",]
sample <- rbind(feb1, feb2)

##set datetime
datetime <- as.POSIXct(paste(sample$Date, sample$Time), format="%d/%m/%Y %H:%M:%S")
data3<-cbind(sample,datetime)

##plot 4
png("plot4.png")
par(mfrow=c(2,2),mar = c(2,2,2,2))
par(xpd = NA)
par(oma=c(2,2,0,0))
plot(data3$datetime,data3$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(data3$datetime,data3$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data3$datetime,data3$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data3$datetime,data3$Sub_metering_2,type="l",xlab="",ylab="", col="red")
lines(data3$datetime,data3$Sub_metering_3,type="l",xlab="",ylab="", col= "blue")
legend("topright",legend=c("Sub-Metering 1","Sub-Metering 2","Sub-Metering 3"),col=c("black","red","blue"),lty = 1,bty="n",cex=.6)
plot(data3$datetime,data3$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power")
dev.off()