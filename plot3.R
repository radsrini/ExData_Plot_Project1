##Plot3 function creates a line graph with three different sun metering against the date time in the needed date range
plot3<- function(){
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
  png(filename="plot3.png",width = 480, height = 480)
  
  plot(allData$DateTime,allData$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
  points(allData$DateTime,allData$Sub_metering_2,type="l",col="red")
  points(allData$DateTime,allData$Sub_metering_3,type="l",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lty=c(1,1,1))
  
  dev.off()
}