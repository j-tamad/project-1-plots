plot4.R

str(hhpower.feb)

par(mfrow = c(2,2))
with(hhpower.feb, {
        plot(x=hhpower.feb$datetime, y=hhpower.feb$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
        plot(x=hhpower.feb$datetime, y=hhpower.feb$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
        plot(x=hhpower.feb$datetime, y=hhpower.feb$Sub_metering_1, type="l", xlab = "", ylab = "Energy submetering")
        lines(hhpower.feb$datetime, hhpower.feb$Sub_metering_2, col= "red")
        lines(hhpower.feb$datetime, hhpower.feb$Sub_metering_3, col= "blue")
        legend ("topright", lty=1, col=c('black', 'red', 'blue'), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(x=hhpower.feb$datetime, y=hhpower.feb$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
})



