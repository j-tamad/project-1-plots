install.packages("readr")
library(readr)
hhpower <- read_delim("household_power_consumption.txt", delim = ";")
str(hhpower)

library(lubridate)

library(dplyr)
hhpower.f1 <- filter(hhpower, Date == "1/2/2007")
tail(hhpower.f1)
hhpower.f2 <- filter(hhpower, Date == "2/2/2007")
head(hhpower.f2)
str(hhpower.f2)
hhpower.feb <- bind_rows(hhpower.f1, hhpower.f2)
str(hhpower.feb)
head(hhpower.feb)
tail(hhpower.feb)

library(lubridate)

hhpower.feb$Date <- dmy(hhpower.feb$Date)
str(hhpower.feb)
#hhpower.feb$Date <- weekdays(strptime(hhpower.feb$Date, "%Y-%m-%d"))#Date changes to NA
hhpower.feb$datetime <- as.POSIXct(paste(hhpower.feb$Date, hhpower.feb$Time), format="%Y-%m-%d %H:%M:%S")
str(hhpower.feb)
hhpower.feb$Date <- weekdays(strptime(hhpower.feb$Date, "%Y-%m-%d"))
str(hhpower.feb)

plot(x=hhpower.feb$datetime, y=hhpower.feb$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
