plot4 <- function(){
  
  ##Load required packages  
  library(dplyr)
  library(lubridate)
  
  ## Create the data table, filtered by date
  tbl4 <- tibble(read.csv("household_power_consumption.txt", sep = ";"))
  tbl4 <- filter(tbl4, Date == "1/2/2007" | Date == "2/2/2007")
  
  ## Change required data classes to numeric and date-time  
  tbl4[3:9] <- sapply(tbl4[3:9], as.numeric)
  datetime <- dmy_hms(paste(tbl4$Date, tbl4$Time))
  tbl4 <- cbind(datetime, tbl4[3:9])
  
  ## Create 4 plots and save to file  
  png("plot4.png", width = 480, height = 480)
  ## Make a 2 x 2 grid for the 4 plots
  par(mfrow = c(2,2))
  
  ## Plot 1 in topleft grid
  with(tbl4,
       plot(datetime, Global_active_power,
            type = "l",
            ylab = "Global Active Power",
            xlab = ""))
  
  ## Plot 2 in topright grid
  with(tbl4,
       plot(datetime, Voltage,
            type = "l",
            ylab = "Voltage",
            xlab = "datetime"))
  
  ## Plot 3 in bottomleft grid
  with(tbl4,
       plot(datetime, Sub_metering_1,
            type = "l",
            ylab = "Energy sub metering",
            xlab = "",
            col = "darkgray"))
  lines(tbl4$datetime, tbl4$Sub_metering_2,
        type = "l",
        col = "red")
  lines(tbl4$datetime, tbl4$Sub_metering_3,
        type = "l",
        col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("darkgray", "red", "blue"),
         lty = c(1, 1, 1),
         cex = 1,
         bty = "n")
  
  ## Plot 4 in bottomright grid
  with(tbl4,
       plot(datetime, Global_reactive_power,
            type = "l",
            ylab = "Global_reactive_power",
            xlab = "datetime"))
    dev.off()
}
