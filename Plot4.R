

elec_data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")


elec_data$Date <- as.Date(elec_data$Date, format = "%d/%m/%Y")


##Subset Data to date ranges provided
elec_data_subset <-subset(elec_data, elec_data$Date >= "2007-02-01" & elec_data$Date <= "2007-02-02")



elec_data_subset$TS <- as.POSIXct(paste(elec_data_subset$Date, elec_data_subset$Time, seperator = " "))



png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))
with(elec_data_subset, {
  plot(elec_data_subset$Global_active_power~elec_data_subset$TS, type = "l", ylab = "Global Active Power", xlab = "")
  plot(elec_data_subset$Voltage~elec_data_subset$TS, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(elec_data_subset$Sub_metering_1~elec_data_subset$TS, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(elec_data_subset$TS, elec_data_subset$Sub_metering_2, col = "red")
  lines(elec_data_subset$TS, elec_data_subset$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"), bty="n")
  plot(elec_data_subset$Global_reactive_power~elec_data_subset$TS, type = "l", ylab = "Global_reactive_power", xlab = "datetime")  
  
})

dev.off()
