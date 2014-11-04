data <- read.csv('household_power_consumption.txt',header=T,na.strings="?",sep=";",nrow=5)
classes <- sapply(data,class)
data <- read.csv('household_power_consumption.txt',header=T,na.strings="?",sep=";",colClasses=classes)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data$Time <- strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
summary(data$Time)

png("plot1.png",width=480,height=480)
hist(data$Global_active_power,col="orangered",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
