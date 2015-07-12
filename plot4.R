##Plot3 function creates a multiple plots in a png file
plot4<- function(){
  ##Start Date
  stDate=as.Date("01/02/2007",format="%d/%m/%Y")
  ##End Date
  enDate=as.Date("02/02/2007",format="%d/%m/%Y")

  ## read data
  allData <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE,na.strings = "?")
  ## form a new column DateTime of type POSIXlt created from two character columns containing Date and Time
  allData <- within(allData, DateTime<-strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

  ## select needed date range
  allData$Date <- as.Date(allData$Date,format="%d/%m/%Y")
  allData<- subset(allData,subset=(allData$Date >= stDate & allData$Date <= enDate))
  
  ## create a png file for graph
  png(filename="plot4.png",width = 480, height = 480)
  
  par(mfrow=c(2,2))
  par(mar=c(4,4,2,2))
  plot(allData$DateTime, allData$Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(allData$DateTime, allData$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(allData$DateTime,allData$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
  points(allData$DateTime,allData$Sub_metering_2,type="l",col="red")
  points(allData$DateTime,allData$Sub_metering_3,type="l",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=c(1,1,1),bty = "n")
  plot(allData$DateTime, allData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  dev.off()
}