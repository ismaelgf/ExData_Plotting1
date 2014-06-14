data<- fread("household_power_consumption.txt",
             sep=";", header=TRUE, 
             na.strings="?")[Date=="1/2/2007"|Date=="2/2/2007"]

data$Global_active_power<- as.numeric(data$Global_active_power)

data$Date<- as.Date(data$Date, format= "%d/%m/%Y")
data$DT<- paste(data$Date, data$Time)
data1 <- strptime(data$DT, format="%Y-%m-%d %H:%M:%S")

with(data, {
        plot(data1, Sub_metering_1, type="l",
        ylab="Energy sub metering",
        xlab=" ", col = "black")
        lines(data1, Sub_metering_2, type="l", col = "Red")
        lines(data1, Sub_metering_3, type="l", col= "Blue")
        legend("topright", pch= 16, col= c("Black", "Red", "Blue"),
                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.copy(png, file="plot3.png")
dev.off()