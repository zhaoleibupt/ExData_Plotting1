data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
str(data)
data1<-data[as.character(data$Date) %in% c("1/2/2007","2/2/2007"),]
data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))


png("plot1.png",width=480,height=480)
hist(data1$Global_active_power,col="red",main="Global active power",xlab="Global active power(kilowatts)")
dev.off()