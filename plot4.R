#plot4
#Read in the data
data <- read.table(file = "household_power_consumption.txt", 
                   sep = ";", 
                   skip = 66637,
                   nrows = 2880)
temp <-read.table("household_power_consumption.txt",sep=";",header=T,nrows=1)
names(data) <- names(temp)
rm(temp)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time),format = "%Y-%m-%d %H:%M:%S")

#Make all the graphs, align them, then save as a png
png(file = "plot4.png",
    height = 480,
    width = 480,
    bg = "transparent")
par(mfrow=c(2,2))
plot(data$DateTime,
     data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
plot(data$DateTime,
     data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")
plot(data$DateTime,
     data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(data$DateTime,
      data$Sub_metering_2,
      col="red")
lines(data$DateTime,
      data$Sub_metering_3,
      col="blue")
legend(x = "topright", 
       col = c("black", "blue", "red"), 
       cex = 0.95, 
       lty=1,
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime,
     data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab ="Global_reactive_power")
dev.off()