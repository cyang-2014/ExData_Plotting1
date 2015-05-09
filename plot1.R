## loading the data
energyUsage2007_Feb1AND2 <- read.table(text = grep("^[1,2]/2/2007", readLines(file("data/explore_data/household_power_consumption.txt")), 
                                                   value = TRUE), 
                                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                                     "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                                                     "Sub_metering_3"), sep = ";", header = TRUE, na.strings = "?")
## Plot 1
png(filename = "figs/exploratoryData_courseProj/project1/plot1.png", width = 480, height = 480, units = "px")
hist(energyUsage2007_Feb1AND2$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

x <- dev.off()
