# ----------------------------------
# Adam Moses
# Exploratory Data Analysis - coursera
# Project 1
# ----------------------------------
# Please see associated readme.MD for further explanation
# on project specifications; that file was forked from the original github
# repository
# ----------------------------------

# NOTE: THE SCRIPT "PLOTLOADER.R" IS USED BY THIS SCRIPT AND MUST BE IN THE SAME
# WORKING DIRECTORY IN ORDER TO OPERATE

# ----------------------------------

plot4 <- function(mainData = NULL)
{
     # check that "plotloader.R" exists and source it, otherwise error
     if (file.exists("plotLoader.R"))
          source("plotLoader.R")
     else
          stop("Could not find 'plotLoader.R' needed for plot4()")
     
     # if data wasn't passed in, then call the loader function
     if (is.null(mainData))
     {
          message("Data was not passed as a parameter, will use loading function...")
          mainData <- loadPlotsData()
     }
     else
     {
          message("Data was passed as a parameter, will use that...")
     }
     
     message("Opening 'plot4.png' file...")
     png("plot4.png")
     
     message("Rendering data...")
     
     # setup to have a 2x2 grid of plots
     par(mfrow = c(2, 2))
     
     # plot 1
     plot(mainData$newDateTime, 
          mainData$Global_active_power, 
          type = "l", 
          ylab = "Global Active Power",
          xlab = "")
     
     # plot 2
     plot(mainData$newDateTime,
          mainData$Voltage, 
          type = "l", 
          ylab = "Voltage", 
          xlab = "datetime")
     
     # plot 3
     plot(mainData$newDateTime, 
          mainData$Sub_metering_1,
          col = "black",
          ylab = "Energy sub metering",
          xlab = "",
          type = "l")
     lines(mainData$newDateTime,
           mainData$Sub_metering_2,
           col = "red")
     lines(mainData$newDateTime,
           mainData$Sub_metering_3,
           col = "blue")
     legend("topright", 
            legend = c("Sub_metering_1",
                       "Sub_metering_2",
                       "Sub_metering_3"),
            lty = "solid",
            col = c("black",
                    "red", 
                    "blue"),
            bty = "n")
     
     # plot 4
     plot(mainData$newDateTime,
          mainData$Global_reactive_power, 
          type = "l", 
          ylab = "Global_reactive_power", 
          xlab = "datetime")
     
     message("Closing file 'plot4.png'...")
     dev.off()
     
     message("Operations complete!")
     
     return(1)
}

# ----------------------------------