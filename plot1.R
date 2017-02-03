#Course: Exploratory Data Analysis
#Project : 1, Plot1
#############################################################
## load the dataset
datafile <- "./data/household_power_consumption.txt"
dataset1 <- read.table(datafile, header = T, sep = ";", na.strings = "?")

# convert the date variable to Date class
dataset1$Date <- as.Date(dataset1$Date, format = "%d/%m/%Y")

# Subset the data
dataset1 <- subset(dataset1, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
dataset1$datetime <- strptime(paste(dataset1$Date, dataset1$Time), "%Y-%m-%d %H:%M:%S")


# Plot 1
attach(dataset1)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(dataset1)