data <- read.table("household_power_consumption.txt",header = TRUE, sep =";", na.strings ="?", stringsAsFactors=FALSE)
data$Date<-as.Date(data$Date,'%d/%m/%Y')
data <-subset(data, Date == "2007-02-01" | Date == "2007-02-02" )
time <-paste(data$Date, data$Time, sep=" ")
time <- strptime(time, "%Y-%m-%d %H:%M:%S")
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)
Voltage <- as.numeric(data$Voltage)
GAP <- as.numeric(data$Global_active_power)
par(mfrow = c(2, 2)) 

plot(time, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(time, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(time, Sub_metering_2, type="l", col="red")
lines(time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(time, GAP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
