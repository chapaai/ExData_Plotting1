elektrik <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

deneme <- unite(elektrik, Date_and_Time, Date:Time, sep=" ")

deneme$Date_and_Time <- strptime(deneme$Date_and_Time, "%d/%m/%Y %H:%M:%S")

deneme$Date_and_Time <- as.POSIXct(deneme$Date_and_Time)

deneme2 <- filter(deneme, date(Date_and_Time) == "2007-02-01" | date(Date_and_Time) =="2007-02-02") 

deneme2$Sub_metering_1 <- as.numeric(as.character(deneme2$Sub_metering_1))
deneme2$Sub_metering_2 <- as.numeric(as.character(deneme2$Sub_metering_2))
deneme2$Sub_metering_3 <- as.numeric(as.character(deneme2$Sub_metering_3))


png(file = "plot3.png", width = 480, height = 480)

plot(deneme2$Date_and_Time, deneme2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

with(deneme2, points(Date_and_Time, Sub_metering_2, col="red", type="l"))

with(deneme2, points(Date_and_Time, Sub_metering_3, col="blue", type="l"))

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(deneme2[6:8]), cex = 0.5)

dev.off()