plot1 <- function(){

##Load required packages  
  library(dplyr)
  
## Create the data table, filtered by date
  tbl1 <- tibble(read.csv("household_power_consumption.txt", sep = ";"))
  tbl1 <- filter(tbl1, Date == "1/2/2007" | Date == "2/2/2007")

## Change required data classes to numeric  
  tbl1[3:9] <- sapply(tbl1[3:9], as.numeric)
  
## Create a histogram and saves to file  
  png("plot1.png", width = 480, height = 480)
  hist(tbl1$Global_active_power, 
       col = "red", 
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  dev.off()
}
