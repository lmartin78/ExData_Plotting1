data <- read.csv('household_power_consumption.txt',header=T,na.strings="?",sep=";",nrow=5)
classes <- sapply(data,class)
data <- read.csv('household_power_consumption.txt',header=T,na.strings="?",sep=";",colClasses=classes)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data$Time <- strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
summary(data$Time)

png("plot2.png",width=480,height=480)
plot(data$Global_active_power ~ as.POSIXct(data$Time), type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
