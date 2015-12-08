 a$Date2 <- as.Date(a$Date, "%d/%m/%Y")
> View(a)
> a$Date <- as.Date(a$Date, "%d/%m/%Y")
> k <- a$Time
> ?strptime
> k2 <- strptime(k, format="%H/%M/%S")
> head(h2)
Error in head(h2) : object 'h2' not found
> head(k2)
[1] NA NA NA NA NA NA
> k2 <- strptime(k, format="%H:%M:%S")
> head(h2)
Error in head(h2) : object 'h2' not found
> head(k2)
[1] "2015-12-07 17:24:00 EST" "2015-12-07 17:25:00 EST" "2015-12-07 17:26:00 EST"
[4] "2015-12-07 17:27:00 EST" "2015-12-07 17:28:00 EST" "2015-12-07 17:29:00 EST"
> k3 <- format(k2, "%H:%M")
> head(k3)
[1] "17:24" "17:25" "17:26" "17:27" "17:28" "17:29"
> ?strftime


> x <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
> x$Date <- as.Date(x$Date, "%d/%m/%Y")
> x2 <- subset(x, (x$Date >= "2007-02-01" & x$Date <= "2007-02-02"))
> summary(x2)
      Date                  Time      Global_active_power Global_reactive_power
 Min.   :2007-02-01   00:00:00:   2   Min.   :0.220       Min.   :0.0000       
 1st Qu.:2007-02-01   00:01:00:   2   1st Qu.:0.320       1st Qu.:0.0000       
 Median :2007-02-01   00:02:00:   2   Median :1.060       Median :0.1040       
 Mean   :2007-02-01   00:03:00:   2   Mean   :1.213       Mean   :0.1006       
 3rd Qu.:2007-02-02   00:04:00:   2   3rd Qu.:1.688       3rd Qu.:0.1440       
 Max.   :2007-02-02   00:05:00:   2   Max.   :7.482       Max.   :0.5000       
                      (Other) :2868                                            
    Voltage      Global_intensity Sub_metering_1    Sub_metering_2  
 Min.   :233.1   Min.   : 1.000   Min.   : 0.0000   Min.   :0.0000  
 1st Qu.:238.4   1st Qu.: 1.400   1st Qu.: 0.0000   1st Qu.:0.0000  
 Median :240.6   Median : 4.600   Median : 0.0000   Median :0.0000  
 Mean   :240.4   Mean   : 5.102   Mean   : 0.4062   Mean   :0.2576  
 3rd Qu.:242.4   3rd Qu.: 7.000   3rd Qu.: 0.0000   3rd Qu.:0.0000  
 Max.   :246.6   Max.   :32.000   Max.   :38.0000   Max.   :2.0000  
                                                                    
 Sub_metering_3  
 Min.   : 0.000  
 1st Qu.: 0.000  
 Median : 0.000  
 Mean   : 8.501  
 3rd Qu.:17.000  
 Max.   :19.000  
                 
> 


> x3 <- na.omit(x)


> png("test.png")
> hist(x2$Global_active_power, col = "red", ylim = c(0, 1200), ylab = "Global Active Power (kilowatts)")
> dev.off()


 k1 <- x2[1:10]
Error in `[.data.frame`(x2, 1:10) : undefined columns selected
> k1 <- x2[1:10,]
> View(k1)
> k2 <- paste(k1$Date, k1$Time)
> k2
 [1] "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" "2007-02-01 00:03:00"
 [5] "2007-02-01 00:04:00" "2007-02-01 00:05:00" "2007-02-01 00:06:00" "2007-02-01 00:07:00"
 [9] "2007-02-01 00:08:00" "2007-02-01 00:09:00"
> k3 <- as.Date(k2)
> k3
 [1] "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01"
 [8] "2007-02-01" "2007-02-01" "2007-02-01"
> k3 <- strptime(k2)
Error in strptime(k2) : argument "format" is missing, with no default
> k3 <- strptime(k2, "%Y-%m-%d %H:%M%S")
> k3
 [1] NA NA NA NA NA NA NA NA NA NA
> k3 <- strptime(k2, "%Y-%m-%d %H:%M:%S")
> k3
 [1] "2007-02-01 00:00:00 EST" "2007-02-01 00:01:00 EST" "2007-02-01 00:02:00 EST"
 [4] "2007-02-01 00:03:00 EST" "2007-02-01 00:04:00 EST" "2007-02-01 00:05:00 EST"
 [7] "2007-02-01 00:06:00 EST" "2007-02-01 00:07:00 EST" "2007-02-01 00:08:00 EST"
[10] "2007-02-01 00:09:00 EST"
> k2
 [1] "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" "2007-02-01 00:03:00"
 [5] "2007-02-01 00:04:00" "2007-02-01 00:05:00" "2007-02-01 00:06:00" "2007-02-01 00:07:00"
 [9] "2007-02-01 00:08:00" "2007-02-01 00:09:00"
> colbind(k3, k1)
Error: could not find function "colbind"
> cbind(k3, k1)
                       k3       Date     Time Global_active_power Global_reactive_power Voltage
66637 2007-02-01 00:00:00 2007-02-01 00:00:00               0.326                 0.128  243.15
66638 2007-02-01 00:01:00 2007-02-01 00:01:00               0.326                 0.130  243.32
66639 2007-02-01 00:02:00 2007-02-01 00:02:00               0.324                 0.132  243.51
66640 2007-02-01 00:03:00 2007-02-01 00:03:00               0.324                 0.134  243.90
66641 2007-02-01 00:04:00 2007-02-01 00:04:00               0.322                 0.130  243.16
66642 2007-02-01 00:05:00 2007-02-01 00:05:00               0.320                 0.126  242.29
66643 2007-02-01 00:06:00 2007-02-01 00:06:00               0.320                 0.126  242.46
66644 2007-02-01 00:07:00 2007-02-01 00:07:00               0.320                 0.126  242.63
66645 2007-02-01 00:08:00 2007-02-01 00:08:00               0.320                 0.128  242.70
66646 2007-02-01 00:09:00 2007-02-01 00:09:00               0.236                 0.000  242.89
      Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
66637              1.4              0              0              0
66638              1.4              0              0              0
66639              1.4              0              0              0
66640              1.4              0              0              0
66641              1.4              0              0              0
66642              1.4              0              0              0
66643              1.4              0              0              0
66644              1.4              0              0              0
66645              1.4              0              0              0
66646              1.0              0              0              0
> k4 <- cbind(k3, k1)
> view(k4)
Error: could not find function "view"
> View(k4)



     plot(k1$newDateTime, k1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "");
     
     plot(k1$newDateTime, k1$Voltage, type = "l", ylab = "Voltage", xlab = "");