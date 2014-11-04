data <- read.csv('household_power_consumption.txt',header=T,na.strings="?",sep=";",nrow=5)
classes <- sapply(data,class)
data <- read.csv('household_power_consumption.txt',header=T,na.strings="?",sep=";",colClasses=classes)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data$Time <- strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
summary(data$Time)

png("plot3.png",width=480,height=480)
plot(data$Sub_metering_1 ~ as.POSIXct(data$Time), type="l", ylab="Energy sub metering",xlab="")
lines(data$Sub_metering_2 ~ as.POSIXct(data$Time), col="red")
lines(data$Sub_metering_3 ~ as.POSIXct(data$Time), col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()
