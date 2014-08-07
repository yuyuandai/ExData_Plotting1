setwd("P:/datasciencecoursera/Exploratory Data Analysis")
install.packages("sqldf")
library(sqldf)
fn<-"household_power_consumption.txt"
useddata <- read.csv.sql(fn, sep=";",
                         sql = 'select * from file where Date = "1/2/2007" 
                                                      or Date="2/2/2007"')
testdata<-data.frame(useddata)
testdata$Date<-strptime(paste(testdata$Date,testdata$Time), "%d/%m/%Y %H:%M:%S")

png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
par(mfrow=c(1,1),bg=NA)
hist(testdata$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power(kilowatts)")
dev.off()