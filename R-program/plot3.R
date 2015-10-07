data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
str(data)
data1<-data[as.character(data$Date) %in% c("1/2/2007","2/2/2007"),]
data1$datetime<-paste(as.character(data1$Date),as.character(data1$Time),sep=" ")
data1$datetime<-strptime(data1$datetime, "%d/%m/%Y %H:%M:%S")
data1$Sub_metering_1<-as.numeric(as.character(data1$Sub_metering_1)) 
data1$Sub_metering_2<-as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3<-as.numeric(as.character(data1$Sub_metering_3))



png("plot3.png",width=480,height=480)
plot(data1$datetime,data1$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(data1$datetime,data1$Sub_metering_2,col="red")
lines(data1$datetime,data1$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()