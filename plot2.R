#Plot 2

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
notna <- which(!is.na(data_2days$Global_active_power))
plot2 <- data_2days[notna,]
png("plot2.png", width = 480, height = 480)
with(plot2, plot(Date_and_Time, Global_active_power,
                 ylab = "Global Active Power (killowats)",
                 xlab="",
                 type="n"))
lines(plot2$Date_and_Time, plot2$Global_active_power)
dev.off()