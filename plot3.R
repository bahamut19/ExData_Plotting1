plot3 <- function(){
  
  ##Load required packages  
  library(dplyr)
  library(lubridate)
  
  ## Create the data table, filtered by date
  tbl3 <- tibble(read.csv("household_power_consumption.txt", sep = ";"))
  tbl3 <- filter(tbl3, Date == "1/2/2007" | Date == "2/2/2007")
  
  ## Change required data classes to numeric and date-time  
  tbl3[3:9] <- sapply(tbl3[3:9], as.numeric)
  datetime <- dmy_hms(paste(tbl3$Date, tbl3$Time))
  tbl3 <- cbind(datetime, tbl3[3:9])
  
  ## Create a time-series linegraph with 3 lines and save to file  
  png("plot3.png", width = 480, height = 480)
  with(tbl3,
       plot(datetime, Sub_metering_1,
            type = "l",
            ylab = "Energy sub metering",
            xlab = "",
            col = "darkgray"))
  lines(tbl3$datetime, tbl3$Sub_metering_2,
             type = "l",
             col = "red")
  lines(tbl3$datetime, tbl3$Sub_metering_3,
             type = "l",
             col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("darkgray", "red", "blue"),
         lty = c(1, 1, 1),
         cex = 1)
  dev.off()
}
