setwd("P:/datasciencecoursera/Exploratory Data Analysis")
install.packages("sqldf")
library(sqldf)
fn<-"household_power_consumption.txt"
useddata <- read.csv.sql(fn, sep=";",
                         sql = 'select * from file where Date = "1/2/2007" 
                                                      or Date="2/2/2007"')
testdata<-data.frame(useddata)
testdata$Date<-strptime(paste(testdata$Date,testdata$Time), "%d/%m/%Y %H:%M:%S")

png(filename = 'Plot4.png', width = 480, height = 480, units = 'px')
par(mfrow=c(2,2),mar =c(4,2,1,1),bg=NA)

with(testdata,{
        plot(testdata$Date, testdata$Global_active_power, xlab="",
             ylab="Global Active Power",type="l")
        
        plot(testdata$Date, testdata$Voltage, xlab="datetime",
             ylab="Voltage",type="l")
        
        plot(testdata$Date,testdata$Sub_metering_1, xlab="", ylab="Energy sub metering",type="n")
        points(testdata$Date,testdata$Sub_metering_1, col = "black",type="l")
        points(testdata$Date,testdata$Sub_metering_2, col = "red",type="l")
        points(testdata$Date,testdata$Sub_metering_3, col = "blue",type="l")
        legend("topright",lty=1,bty = "n",xjust=0, cex=0.75,seg.len=0.5,col=c("black","blue","red"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),)
        
        plot(testdata$Date, testdata$Global_reactive_power, xlab="datetime",
             ylab="Global_reactive__power",type="l")
})
dev.off()