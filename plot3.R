library(dplyr)
library(lubridate)

# In this script I chose not to copy to the png device because if I did
# the legend would not print correctly. Instead I did it directly on the 
# png device and it worked as expected. 
png(file = "plot3.png")

subdata <- select(data, Sub_metering_1, Sub_metering_2, Sub_metering_3)
ts.plot(ts(subdata), ylab="Energy sub metering", xlab="", 
        col = c("black", "red", "blue"), gpars = list(xaxt = "n"))

xticks <- c(seq(1, nrow(data), by = nrow(data)/2),nrow(data))
xlabels <- wday(data$Date[xticks], label = TRUE)
axis(1, at=xticks, labels = xlabels)
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = names(subdata))

#dev.copy(png, file = "plot3.png")
dev.off()