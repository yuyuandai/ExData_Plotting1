setwd("P:/datasciencecoursera/Exploratory Data Analysis")
install.packages("sqldf")
library(sqldf)
fn<-"household_power_consumption.txt"
useddata <- read.csv.sql(fn, sep=";",
                         sql = 'select * from file where Date = "1/2/2007" 
                                                      or Date="2/2/2007"')
testdata<-data.frame(useddata)
testdata$Date<-strptime(paste(testdata$Date,testdata$Time), "%d/%m/%Y %H:%M:%S")

png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
par(mfrow=c(1,1),bg=NA)
plot(testdata$Date,testdata$Sub_metering_1, xlab="", ylab="Energy sub metering",
     type="n")
points(testdata$Date,testdata$Sub_metering_1, col = "black",type="l")
points(testdata$Date,testdata$Sub_metering_2, col = "red",type="l")
points(testdata$Date,testdata$Sub_metering_3, col = "blue",type="l")
legend("topright",lty=1, cex=1,
       col=c("black","blue","red"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()