plot3<-function()
{
    # Manually downloaded and copied the dataset in the working directory
    
    # Load (or uncomment the line below) the library before running the code below 
    #library(sqldf)
    
    # Load the dataset into R.
    powerfile <- read.csv.sql("household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';') 
    # Another option to read the file using hardcoded values.
    # powerfile<-read.table("./household_power_consumption.txt",header= TRUE ,sep=";",skip=66636,nrow=2880)
    # names(powerfile) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    powerfile$DateTime <- paste(powerfile$Date, powerfile$Time)
    powerfile$DateTime <- strptime(powerfile$DateTime, format = "%d/%m/%Y %H:%M:%S")
    
    # Open PNG device; create 'plot3.png' in my working directory
    png("./plot3.png")
    
    # Create plot and send to a file 
    plot(powerfile$DateTime,powerfile$Sub_metering_1,type = "l",ylab ="Energy sub metering", xlab="")
    lines(powerfile$DateTime,powerfile$Sub_metering_2, col= "red")
    lines(powerfile$DateTime,powerfile$Sub_metering_3,col = "blue")
    legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
    
    # close the PNG device
    dev.off()
    
}


