library(lubridate)

## Downloading and importing data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./Electric_Power_Consumption.zip", method="curl" )
unzip("./Electric_Power_Consumption.zip")

power_consumption <- read.csv(file="./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", 
                              colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
power_consumption$Datum<- strptime(paste(power_consumption$Date, power_consumption$Time), "%d/%m/%Y %H:%M:%S")
power_consumption2 <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")

## Plot 3
Sys.setenv("LANGUAGE"="En")
Sys.setlocale(locale = "en_US.UTF-8")
with(power_consumption2, plot(Datum,Sub_metering_1, type="n", ylab="Energy Sub Metering", xlab="" ))
lines(power_consumption2$Datum, power_consumption2$Sub_metering_1, col="black")
lines(power_consumption2$Datum, power_consumption2$Sub_metering_2, col="red")
lines(power_consumption2$Datum, power_consumption2$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=c(1,1,1))

dev.copy(png, file="plot3.png")
dev.off()