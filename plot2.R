plot(ts(data$Global_active_power), xaxt="n", ylab="Global Active Power (kilowatts)", xlab="")

xticks <- c(seq(1, nrow(data), by = nrow(data)/2),nrow(data))
xlabels <- wday(data$Date[xticks], label = TRUE)
axis(1, at=xticks, labels = xlabels)

dev.copy(png, file = "plot2.png")
dev.off()