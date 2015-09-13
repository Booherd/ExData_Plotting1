## read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

##convert dates
Date.form <- as.Date(data[,1],format="%d/%m/%Y")
data2 <- cbind(data,Date.form)

##select sample dates
feb1 <- data2[data2$Date.form == "2007-02-01",]
feb2 <- data2[data2$Date.form == "2007-02-02",]
sample <- rbind(feb1, feb2)

##plot 1
png("plot1.png")
hist(sample$Global_active_power, col="red", main =paste("Global Active Power"),xlab="Global Active Power (Kilowatts)")
dev.off()