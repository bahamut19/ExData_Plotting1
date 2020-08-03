plot2 <- function(){
  
  ##Load required packages  
  library(dplyr)
  library(lubridate)
  
  ## Create the data table, filtered by date
  tbl2 <- tibble(read.csv("household_power_consumption.txt", sep = ";"))
  tbl2 <- filter(tbl2, Date == "1/2/2007" | Date == "2/2/2007")
  
  ## Change required data classes to numeric and date-time  
  tbl2[3:9] <- sapply(tbl2[3:9], as.numeric)
  datetime <- dmy_hms(paste(tbl2$Date, tbl2$Time))
  tbl2 <- cbind(datetime, tbl2[3:9])
  tbl2
  
  ## Create a time-series linegraph and saves to file  
  png("plot2.png", width = 480, height = 480)
  with(tbl2,
       plot(datetime, Global_active_power,
            type = "l",
            ylab = "Global Active Power (kilowatts)",
            xlab = ""))
  dev.off()
}
