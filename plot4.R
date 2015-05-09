library(dplyr)
library(lubridate)

png(file = "plot4.png")

par(mfcol = c(2,2))

# First plot
plot(ts(data$Global_active_power), xaxt="n", 
     ylab="Global Active Power", xlab="")
xticks <- c(seq(1, nrow(data), by = nrow(data)/2),nrow(data))
xlabels <- wday(data$Date[xticks], label = TRUE)
axis(1, at=xticks, labels = xlabels)

# Second plot
subdata <- select(data, Sub_metering_1, Sub_metering_2, Sub_metering_3)
ts.plot(ts(subdata), ylab="Energy sub metering", xlab="", 
        col = c("black", "red", "blue"), gpars = list(xaxt = "n"))
xticks <- c(seq(1, nrow(data), by = nrow(data)/2),nrow(data))
xlabels <- wday(data$Date[xticks], label = TRUE)
axis(1, at=xticks, labels = xlabels)
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = names(subdata), bty = "n")

# Third plot
plot(ts(data$Voltage), xaxt="n", ylab="Voltage", xlab="datetime")
xticks <- c(seq(1, nrow(data), by = nrow(data)/2),nrow(data))
xlabels <- wday(data$Date[xticks], label = TRUE)
axis(1, at=xticks, labels = xlabels)

# Forth plot
plot(ts(data$Global_reactive_power), xaxt="n", ylab="Global_reactive_power", 
     xlab="datetime")
xticks <- c(seq(1, nrow(data), by = nrow(data)/2),nrow(data))
xlabels <- wday(data$Date[xticks], label = TRUE)
axis(1, at=xticks, labels = xlabels)


#dev.copy(png, file = "plot4.png")
dev.off()