# Make sure the library for read.csv.sql is loaded
library(sqldf)

# Set working folder
setwd ("c:/R/ExploratoryA1")

# Load the two days that we are interested in
hpc <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep =";",stringsAsFactors = FALSE)

# Create the histogram
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Save to PNG
dev.copy(png,filename="plot1.png");
dev.off()
