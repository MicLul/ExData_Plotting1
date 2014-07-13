# reading from text file into dataframe
df1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# subsetting to include only dates 2007-02-01 and 2007-02-02
df2 <- df1[(df1$Date=="1/2/2007")|(df1$Date=="2/2/2007") ,]

# concatenating Data and Time to datetime
df2$datetime <- paste(df2$Date, df2$Time)
df2$datetime <- strptime(df2$datetime, "%d/%m/%Y %H:%M:%S")

# opening png device; create "plot4.png" in working directory
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(df2, {

# creating plot (1,1)
plot(datetime, as.numeric(as.character(Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")

# creating plot (1,2)
plot(df2$datetime, as.numeric(as.character(df2$Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")

# creating plot (2,1)
plot(datetime, as.numeric(as.character(Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(as.character(Sub_metering_2)), type = "l", col = "red")
lines(datetime, as.numeric(as.character(Sub_metering_3)), type = "l", col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# creating plot (2,2)
plot(df2$datetime, as.numeric(as.character(df2$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# close png device
dev.off()