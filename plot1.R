# reading from text file into dataframe
df1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# subsetting to include only dates 2007-02-01 and 2007-02-02
df2 <- df1[(df1$Date=="1/2/2007")|(df1$Date=="2/2/2007") ,]

# opening png device; create "plot1.png" in working directory
png(filename="plot1.png", width = 480, height = 480)

# create histogram and send to png device
hist(as.numeric(as.character(df2$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# close png device
dev.off()