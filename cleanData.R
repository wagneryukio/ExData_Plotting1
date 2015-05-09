# This scripts cleans the data. It must be executed before the other plot* scripts
# The data file "household_power_consumption.txt" must be on the current working 
# directory together with the scripts. I didn't upload the data to the repo 
# because it is too big and everyone has it
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
data$datetime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Append one more record to make the day axis label look good
rbind(data, data[nrow(data),])
data$Date[nrow(data)] <- data$Date[nrow(data)] + 1
