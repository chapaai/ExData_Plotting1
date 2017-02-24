elektrik <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

deneme <- unite(elektrik, Date_and_Time, Date:Time, sep=" ")

deneme$Date_and_Time <- strptime(deneme$Date_and_Time, "%d/%m/%Y %H:%M:%S")

deneme$Date_and_Time <- as.POSIXct(deneme$Date_and_Time)

deneme2 <- filter(deneme, date(Date_and_Time) == "2007-02-01" | date(Date_and_Time) =="2007-02-02") 

deneme2$Global_active_power <- as.numeric(as.character(deneme2$Global_active_power))


png(file = "plot1.png", width = 480, height = 480)

hist(deneme2$Global_active_power, xlab = "Global Active Power(kilowatts)",main="Global Active Power", col= "red")

dev.off()