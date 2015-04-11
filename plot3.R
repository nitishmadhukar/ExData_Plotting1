# Read data from file
power_consumption <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', quote="", stringsAsFactors = F)

# converting date to Date object
power_consumption$Date <- as.Date(dat$Date, "%d/%m/%Y")

# subsetting for days 2007-02-01 to 2007-02-02
required_pc <- subset(power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

# converting date and time to datetime variable
required_pc$Datetime <- paste(required_pc$Date, required_pc$Time)

# converting datetime variable to Datetime object
required_pc$Datetime <- strptime(required_pc$Datetime, "%Y-%m-%d %H:%M:%S")

str(required_pc)

# generating a png file
png(file = 'plot3.png', width = 480, height = 480, bg = 'white')

# plot 3: Energy sub metering 1,2,3 as a function of Datetime over the two days
with(required_pc, plot(Datetime, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '', col = 'Black'))
with(required_pc, lines(Datetime, Sub_metering_2, col = 'Red'))
with(required_pc, lines(Datetime, Sub_metering_3, col = 'Blue'))
legend("topright", pch = '-----', col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
