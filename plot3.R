plot3.R

install.packages("readr")
library(readr)
hhpower <- read_delim("household_power_consumption.txt", delim = ";")
str(hhpower)

library(lubridate)
library(dplyr)

hhpower.f1 <- filter(hhpower, Date == "1/2/2007")
str(hhpower.f1)
hhpower.f2 <- filter(hhpower, Date == "2/2/2007")
str(hhpower.f2)
hhpower.feb <- bind_rows(hhpower.f1, hhpower.f2)
str(hhpower.feb)
hhpower.feb$Date <- dmy(hhpower.feb$Date)#crucial - next step creates NA for Date and datetime otherwise
hhpower.feb$datetime <- as.POSIXct(paste(hhpower.feb$Date, hhpower.feb$Time), format="%Y-%m-%d %H:%M:%S")
str(hhpower.feb)
str(hhpower.feb)
head(hhpower.feb)
tail(hhpower.feb)


plot(x=hhpower.feb$datetime, y=hhpower.feb$Sub_metering_1, type="l", xlab = "", ylab = "Energy submetering")
lines(hhpower.feb$datetime, hhpower.feb$Sub_metering_2, col= "red")
lines(hhpower.feb$datetime, hhpower.feb$Sub_metering_3, col= "blue")
legend ("topright", lty=1, col=c('black', 'red', 'blue'), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
