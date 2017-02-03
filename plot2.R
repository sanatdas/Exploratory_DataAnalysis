#Course: Exploratory Data Analysis
#Project : 1, Plot2
################################################################################
## load the data
datafile <- "./data/household_power_consumption.txt"
dataset1 <- read.table(datafile, header = T, 
                       sep = ";", na.strings = "?")
# convert the date variable to Date class
dataset1$Date <- as.Date(dataset1$Date, format = "%d/%m/%Y")

# Subset the data
dataset1 <- subset(dataset1, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
dataset1$datetime <- strptime(paste(dataset1$Date, dataset1$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
dataset1$datetime <- as.POSIXct(dataset1$datetime)
attach(dataset1)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(dataset1)