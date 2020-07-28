fulldata<-read.table("./household_power_consumption.txt",header = T)

library(tidyr)
library(dplyr)
data_col<-separate(fulldata,1,c( "Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep = ";")
working_data <- working_data[complete.cases(working_data),]
SetTime <-strptime(paste(working_data$Date, working_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data<-cbind(working_data,SetTime)


par(mfrow=c(2,2))

plot(data$SetTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data$SetTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$SetTime,data$Sub_metering_1,type = "l", xlab="", ylab = "Energy sub metering")
lines(data$SetTime,data$Sub_metering_2,col = "red")
lines(data$SetTime,data$Sub_metering_3,col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty="solid")

plot(data$SetTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")