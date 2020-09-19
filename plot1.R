#Plot 1

#Reading the file
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
#Applying as.Date() to the column Date of the database
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#Subseting for the dates 2007-02-01 and 2007-02-02
data_2days <- data[which(data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))),]

#Adjusting the data for the plot and plotting
notna <- which(!is.na(data_2days$Global_active_power))
plot1 <- data_2days[notna,]
png("plot1.png", width = 480, height = 480)
with(plot1, hist(Global_active_power, 
                  col="red", 
                  xlab = "Global Active Power (killowats)", 
                  main = "Global Active Power" 
                ))
dev.off()
