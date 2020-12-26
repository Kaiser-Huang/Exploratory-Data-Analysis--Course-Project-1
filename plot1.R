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

dat2 %>% 
        pull(Global_active_power) %>% 
        hist(main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
