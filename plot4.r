# Make sure the library for read.csv.sql is loaded
library(sqldf)

# Set working folder
setwd ("c:/R/ExploratoryA1")

# Load the two days that we are interested in
hpc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep =";",stringsAsFactors = FALSE)

# Add concatenated date + time as a DateTime field
hpc$DateTime <- as.POSIXct(strptime(paste(hpc[,1], hpc[,2]), "%d/%m/%Y %H:%M:%S"))

# set the 2x2 chart panel
par(mfrow = c(2,2))

# First chart
with(hpc, plot(Global_active_power ~ DateTime, type = "l", xlab="datetime", ylab="Global Active Power"))

# Second chart
with(hpc, plot(Voltage ~ DateTime, type = "l", xlab="", ylab="Voltage"))

# Third chart. Note the legend with smaller font.
with(hpc, plot(Sub_metering_1 ~ DateTime, type = "l", xlab="", ylab="Energy sub metering"))
with(hpc, points(Sub_metering_2 ~ DateTime, type = "l", xlab="", col="Red"))
with(hpc, points(Sub_metering_3 ~ DateTime, type = "l", xlab="", col="Blue"))
legend("topright", lty=1, cex=0.4, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth chart
with(hpc, plot(Global_reactive_power ~ DateTime, type = "l", xlab="datetime", ylab="Global_reactive_power"))

# Save to PNG
dev.copy(png,filename="plot4.png");
dev.off()
