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

#  3rd plot

par(mfrow=c(1,1))

plot(dt2$Time,dt2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(dt2,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(dt2,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(dt2,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png")
dev.off()

