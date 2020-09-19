#Plot 3

#Reading the file
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
#Applying as.Date() to the column Date of the database
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#Subseting for the dates 2007-02-01 and 2007-02-02
data_2days <- data[which(data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))),]

#Adjusting the data for the plot and plotting
#Creating a new variable
Date_and_Time <- paste(data_2days$Date,data_2days$Time)
#Adding the new variable to the dataset
data_2days$Date_and_Time <- as.POSIXlt(Date_and_Time)
#Changing the language of the LC_TIME
Sys.setlocale("LC_TIME", locale="English")
#checking for NA value
any(is.na(data_2days$Sub_metering_1) | is.na(data_2days$Sub_metering_2) | is.na(data_2days$Sub_metering_3))
plot3 <- data_2days
png("plot3.png", width = 480, height = 480)
with(plot3, plot(x=(rep((Date_and_Time), 3)), 
                 y=c(Sub_metering_1, Sub_metering_2, Sub_metering_3),
                 xlab="",
                 ylab = "Energy Sub metering",
                 type="n"
                ))
lines(plot3$Date_and_Time, plot3$Sub_metering_1)
lines(plot3$Date_and_Time, plot3$Sub_metering_2, col="red")
lines(plot3$Date_and_Time, plot3$Sub_metering_3, col="blue")
legend("topright", lty = rep((1),3), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()
