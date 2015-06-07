# Make sure the library for read.csv.sql is loaded
library(sqldf)

# Set working folder
setwd ("c:/R/ExploratoryA1")

# Load the two days that we are interested in
hpc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep =";",stringsAsFactors = FALSE)

# Add concatenated date + time as a DateTime field
hpc$DateTime <- as.POSIXct(strptime(paste(hpc[,1], hpc[,2]), "%d/%m/%Y %H:%M:%S"))

# Create the chart
with(hpc, plot(Global_active_power ~ DateTime, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))

# Save to PNG
dev.copy(png,filename="plot2.png");
dev.off()
