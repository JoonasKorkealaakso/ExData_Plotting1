## read household power consumption data into R, set header as "True", use
## semicolon to separate, and specify "?" as NAs
data <- read.table("~/exdata_data_household_power_consumption/household_power_consumption.txt",header = T, sep = ";",na.strings = "?")

## subset the data with the 1-2-2007 and 2-2-2007 dates
plotdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## convert Date and Time factor variables into POSIXlt date format with 'strptime'
plot_time <- strptime(paste(plotdata$Date, plotdata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

## Add the created plot_time variable to the data frame
plotdata <- cbind(plot_time, plotdata)

## Output the histrogram in red with the desired titles and measurements
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(plotdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Close the PNG graphics device
dev.off()