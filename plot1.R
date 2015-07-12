plot1.R

hhpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
str(hhpower)


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
View(hhpower.feb)

hhpower.feb$Global_active_power <- as.numeric(hhpower.feb$Global_active_power)
hist(hhpower.feb$Global_active_power, col="red", xlab= "Global Active Power (kilowatts)", main = "Global Active Power")

