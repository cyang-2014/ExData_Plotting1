## loading the data
energyUsage2007_Feb1AND2 <- read.table(text = grep("^[1,2]/2/2007", readLines(file("data/explore_data/household_power_consumption.txt")), 
                                                   value = TRUE), 
                                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                                     "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                                                     "Sub_metering_3"), sep = ";", header = TRUE, na.strings = "?")
## Plot 2
## change format of Date and Time before plot time as X-axis
energyUsage2007_Feb1AND2$Date <- as.Date(energyUsage2007_Feb1AND2$Date, format = "%d/%m/%Y")

date_and_time <- paste(as.Date(energyUsage2007_Feb1AND2$Date), energyUsage2007_Feb1AND2$Time)
energyUsage2007_Feb1AND2$DateTime <- as.POSIXct(date_and_time)

png(filename = "figs/exploratoryData_courseProj/project1/plot2.png", width = 480, height = 480, units = "px")
plot(energyUsage2007_Feb1AND2$DateTime, energyUsage2007_Feb1AND2$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
x <- dev.off()


