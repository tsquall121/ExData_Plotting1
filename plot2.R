# Plot 2
# Read and clean data
epc_data <- read.table("C:/Users/tsqua/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", 
                       header = TRUE,
                       sep = ";",)
str(epc_data)
epc_data$date_time <- paste(epc_data$Date, epc_data$Time)
epc_data$date_time <- strptime(epc_data$date_time, "%d/%m/%Y %H:%M:%S")
epc_data$Date <- as.Date(epc_data$Date, "%d/%m/%Y")
epc_data$Global_active_power <- as.numeric(epc_data$Global_active_power)
epc_data$Global_reactive_power <- as.numeric(epc_data$Global_reactive_power)
epc_data$Voltage <- as.numeric(epc_data$Voltage)
epc_data$Global_intensity <- as.numeric(epc_data$Global_intensity)
epc_data$Sub_metering_1 <- as.numeric(epc_data$Sub_metering_1)
epc_data$Sub_metering_2 <- as.numeric(epc_data$Sub_metering_2)
epc_data$Sub_metering_3 <- as.numeric(epc_data$Sub_metering_3)

data1 <- epc_data[epc_data$Date == "2007-02-01", ]
data2 <- epc_data[epc_data$Date == "2007-02-02", ]
data <- rbind(data1, data2)

# Making the plot
plot(data$date_time, 
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Saving plot 2 to png file
dev.copy(png, file = "plot2.png")
dev.off()