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
hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col="red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


