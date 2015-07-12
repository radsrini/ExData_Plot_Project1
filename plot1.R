##Plot1 function creates a histogram with Active power in Kilowatts in the needed date range
plot1<- function(){
  ##start Date
  stDate=as.Date("01/02/2007",format="%d/%m/%Y")
  ##End Date
  enDate=as.Date("02/02/2007",format="%d/%m/%Y")

  ## read data
  allData <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE,na.strings = "?")

  ## select needed date range
  allData$Date <- as.Date(allData$Date,format="%d/%m/%Y")
  allData<- subset(allData,subset=(allData$Date >= stDate & allData$Date <= enDate))

  ## create a png file for graph
  png(filename="plot1.png",width = 480, height = 480)
  
  hist(allData$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",main="Global Active Power")
  
  dev.off()
}