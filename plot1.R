data<- fread("household_power_consumption.txt",
             sep=";", header=TRUE, 
             na.strings="?")[Date=="1/2/2007"|Date=="2/2/2007"]

data$Global_active_power<- as.numeric(data$Global_active_power)

hist(data$Global_active_power, 
     col="red", main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylim=c(0,1200))

dev.copy(png, file="plot1.png")
dev.off()


