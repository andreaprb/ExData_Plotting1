plot1<-function()
{
    
    # Manually downloaded and copied the dataset in the working directory
    
    # Load (or uncomment the line below) the library before running the code below 
    #library(sqldf)
    
    # Load the dataset into R.
    powerfile <- read.csv.sql("household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';') 
    # Another option to read the file using hardcoded values.
    # powerfile<-read.table("./household_power_consumption.txt",header= TRUE ,sep=";",skip=66636,nrow=2880)
    # names(powerfile) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    
    #Open PNG device; create 'plot1.png' in my working directory
    png("./plot1.png") 
    
    # Create plot and send to a file 
    hist(powerfile$Global_active_power, main = "Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
    
    # close the PNG device
    dev.off() ## close the PNG device!
    
}

