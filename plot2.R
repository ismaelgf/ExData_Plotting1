data<- fread("household_power_consumption.txt",
             sep=";", header=TRUE, 
             na.strings="?")[Date=="1/2/2007"|Date=="2/2/2007"]

data$Global_active_power<- as.numeric(data$Global_active_power)


data$Date<- as.Date(data$Date, format= "%d/%m/%Y")
data$DT<- paste(data$Date, data$Time)
data1 <- strptime(data$DT, format="%Y-%m-%d %H:%M:%S")

plot(data1, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",
     xlab=" ")

dev.copy(png, file="plot2.png")
dev.off()
