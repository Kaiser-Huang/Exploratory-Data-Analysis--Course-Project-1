library(tidyverse)
dat <- read_delim("household_power_consumption.txt",col_names =TRUE,delim =";",na ="?")
dat
library(lubridate)
dat$Date <-  dmy(dat$Date)
dat
dat1 <- dat %>% 
        filter(Date =="2007-02-01" | Date =="2007-02-02")
dat1

dat2 <- dat1 %>% 
        mutate(Date_time=paste(Date,Time))
dat2$Date_time <- ymd_hms(dat2$Date_time)
dat2

par(mfrow=c(2,2))
with(dat2, {
        plot(Global_active_power~Date_time, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Date_time, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Date_time, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Date_time,col='Red')
        lines(Sub_metering_3~Date_time,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Date_time, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
