## loading the data
energyUsage2007_Feb1AND2 <- read.table(text = grep("^[1,2]/2/2007", readLines(file("data/explore_data/household_power_consumption.txt")), 
                                                   value = TRUE), 
                                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                                     "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                                                     "Sub_metering_3"), sep = ";", header = TRUE, na.strings = "?")
## Plot 3
energyUsage2007_Feb1AND2$Date <- as.Date(energyUsage2007_Feb1AND2$Date, format = "%d/%m/%Y")

date_and_time <- paste(as.Date(energyUsage2007_Feb1AND2$Date), energyUsage2007_Feb1AND2$Time)
energyUsage2007_Feb1AND2$DateTime <- as.POSIXct(date_and_time)

png(filename = "figs/exploratoryData_courseProj/project1/plot3.png", width = 480, height = 480, units = "px")
plot(energyUsage2007_Feb1AND2$DateTime, energyUsage2007_Feb1AND2$Sub_metering_1,
     type = "l", xlab ="", ylab = "Energy sub metering")
lines(energyUsage2007_Feb1AND2$DateTime, energyUsage2007_Feb1AND2$Sub_metering_2, col = "red")
lines(energyUsage2007_Feb1AND2$DateTime, energyUsage2007_Feb1AND2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, 
       col = c("black", "red", "blue"))
x <- dev.off()