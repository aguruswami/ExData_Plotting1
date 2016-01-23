data <- read.csv("household_power_consumption.txt",colClasses=c("character","character",rep("double",7)),header=TRUE,stringsAsFactors=FALSE,sep=";",na.strings=c("?","NA"))
data$Date <- as.Date(data$Date,"%d/%m/%Y")
my_data <- subset(data,data$Date==as.Date("2007-02-01","%Y-%m-%d")|data$Date==as.Date("2007-02-02","%Y-%m-%d"))
my_data$DTTM <- strptime(paste(my_data$Date,my_data$Time),format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))
hist(my_data$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
