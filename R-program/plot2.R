data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
str(data)
data1<-data[as.character(data$Date) %in% c("1/2/2007","2/2/2007"),]
data1$datetime<-paste(as.character(data1$Date),as.character(data1$Time),sep=" ")
data1$datetime<-strptime(data1$datetime, "%d/%m/%Y %H:%M:%S")
data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))

png("plot2.png",width=480,height=480)
plot(data1$datetime,data1$Global_active_power,type="l",xlab="",ylab="Global active power(kilowatts)")
dev.off()