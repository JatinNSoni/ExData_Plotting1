getwd()
setwd("D:/RTraining/curseraEnel/RStudioGitRepo/datasciencecoursera/exploratory-data-analysis/exdata_data_household_power_consumption/")


dt <- read.table ("./household_power_consumption.txt", sep =";", header = TRUE, na.strings = "?" ,  colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

datetime <- paste( dt$Date, dt$Time)
datetime <- as.POSIXct(datetime)
dt<- cbind(dt, datetime)
# head(dt)

dt$Time <- strptime(dt$Time, format="%H:%M:%S")



# head(dt)
# summary(dt)
# names(dt)


dt2 <- dt[dt$Date >= as.Date("2007-02-01") & dt$Date <= as.Date("2007-02-02"),]
# dt2 <- subset(dt,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# head(dt2)
# summary(dt2)

#  plot 2
par(mfrow=c(1,1))
plot(dt2$Global_active_power~dt2$datetime, ylab="Global Active Power (kilowatts)", xlab="", col= 'black', type= "l", main = "Global Active Power Vs Time")

dev.copy(png,file="plot2.png")
dev.off()

