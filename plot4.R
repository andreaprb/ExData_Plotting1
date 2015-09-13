plot4<-function()
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
    
    # Open PNG device; create 'plot4.png' in my working directory
    png("./plot4.png")
    
    # create multiple base plots
    par(mfrow = c(2, 2) )
    
    # Create multiple plots and send to a file 
    
    # plot1
    plot(powerfile$DateTime,powerfile$Global_active_power,type = "l",ylab ="Global Active Power", xlab="")
    # plot2
    plot(powerfile$DateTime,powerfile$Voltage,type = "l",ylab ="Voltage", xlab="datetime")
    # plot3
    plot(powerfile$DateTime,powerfile$Sub_metering_1,type = "l",ylab ="Energy sub metering", xlab="")
    lines(powerfile$DateTime,powerfile$Sub_metering_2, col= "red")
    lines(powerfile$DateTime,powerfile$Sub_metering_3,col = "blue")
    legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty='n')
    # plot4
    plot(powerfile$DateTime,powerfile$Global_reactive_power,type = "l",ylab ="Global_reactive_power", xlab="datetime")
    
    # close the PNG device
    dev.off()
}