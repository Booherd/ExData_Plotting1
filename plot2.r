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

##plot 2
png("plot2.png")
plot(data3$datetime,data3$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()