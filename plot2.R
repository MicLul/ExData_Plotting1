# reading from text file into dataframe
df1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# subsetting to include only dates 2007-02-01 and 2007-02-02
df2 <- df1[(df1$Date=="1/2/2007")|(df1$Date=="2/2/2007") ,]

# concatenating Data and Time to datetime
df2$datetime <- paste(df2$Date, df2$Time)
df2$datetime <- strptime(df2$datetime, "%d/%m/%Y %H:%M:%S")

# opening png device; create "plot2.png" in working directory
png(filename="plot2.png", width = 480, height = 480)

# create plot and send to png device
plot(df2$datetime, as.numeric(as.character(df2$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# close png device
dev.off()