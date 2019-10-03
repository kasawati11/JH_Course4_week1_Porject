

elec_data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

##change date and time to correct formats
elec_data$Date <- as.Date(elec_data$Date, format = "%d/%m/%Y")
##elec_data$Time <- as.POSIXct(elec_data$Time, format = "%H:%M:%s")

##Subset elec_data to show 2.1.2007 & 2.2.2007
elec_data_subset <-subset(elec_data, elec_data$Date >= "2007-02-01" & elec_data$Date <= "2007-02-02")


##Combine Date + Time into new column
elec_data_subset$TS <- as.POSIXct(paste(elec_data_subset$Date, elec_data_subset$Time))


##Deliver a 480 x 480 PNG plot
png("plot1.png", height = 480, width = 480)
hist(elec_data_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
