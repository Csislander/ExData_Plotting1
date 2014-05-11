#plot1
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

#Make the graph and save it as a png
png(file = "plot1.png",
    height = 480,
    width = 480,
    bg = "transparent")
hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()