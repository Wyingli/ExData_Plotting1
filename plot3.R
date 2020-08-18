data1<-read.table("C:/Users/li/Documents/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")
data2<-data1[grepl("1/2/2007|2/2/2007",data1$Date),]
data22<-filter(data2,Date=="1/2/2007"|Date=="2/2/2007")
dates<-data22$Date
times<-data22$Time
x<-paste(dates,times)
a<-strptime(x, "%d/%m/%Y %H:%M:%S")
data5<-mutate(data22,date=a)
data<-select(data5,-(Date:Time))
data$Global_active_power<-as.numeric(unlist(data$Global_active_power))
Sys.setlocale("LC_TIME", "English")
with(data,{
  plot(date,Sub_metering_1, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(date,Sub_metering_2,col="red")
  lines(date,Sub_metering_3,col="blue")
  })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()