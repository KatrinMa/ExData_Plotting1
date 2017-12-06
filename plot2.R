library(lubridate)

## Downloading and importing data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./Electric_Power_Consumption.zip", method="curl" )
unzip("./Electric_Power_Consumption.zip")

power_consumption <- read.csv(file="./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", 
                              colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
power_consumption$Datum<- strptime(paste(power_consumption$Date, power_consumption$Time), "%d/%m/%Y %H:%M:%S")
power_consumption2 <- subset(power_consumption, Date=="1/2/2007" | Date=="2/2/2007")

## Plot 2
Sys.setenv("LANGUAGE"="En")
Sys.setlocale(locale = "en_US.UTF-8")
with(power_consumption2, plot(Datum,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
     
dev.copy(png, file="plot2.png")
dev.off()