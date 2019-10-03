##take same steps as in Plot1.R
elec_data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

elec_data$Date <- as.Date(elec_data$Date, format = "%d/%m/%Y")

elec_data_subset <-subset(elec_data, elec_data$Date >= "2007-02-01" & elec_data$Date <= "2007-02-02")

elec_data_subset$TS <- as.POSIXct(paste(elec_data_subset$Date, elec_data_subset$Time, seperator = " "))

png("plot2.png", height = 480, width = 480)
plot(elec_data_subset$Global_active_power~elec_data_subset$TS, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
