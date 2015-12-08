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

plot3 <- function(mainData = NULL)
{
     # check that "plotloader.R" exists and source it, otherwise error
     if (file.exists("plotLoader.R"))
          source("plotLoader.R")
     else
          stop("Could not find 'plotLoader.R' needed for plot3()")
     
     # if data wasn't passed in, then call the loader function
     if (is.null(mainData))
     {
          message("Data was not passed as a parameter, will use loading function...");
          mainData <- loadPlotsData();
     }
     else
     {
          message("Data was passed as a parameter, will use that...");
     }
     
     message("Opening 'plot3.png' file...");
     png("plot3.png");
     
     message("Rendering data...");
     plot(mainData$newDateTime, 
          mainData$Sub_metering_1,
          col = "black",
          ylab = "Energy sub metering",
          xlab = "",
          type = "l");
     lines(mainData$newDateTime,
           mainData$Sub_metering_2,
           col = "red");
     lines(mainData$newDateTime,
           mainData$Sub_metering_3,
           col = "blue");
     legend("topright", 
            legend = c("Sub_metering_1",
                       "Sub_metering_2",
                       "Sub_metering_3"),
            lty = "solid",
            col = c("black",
                    "red", 
                    "blue"));
     
     message("Closing file 'plot3.png'...");
     dev.off();
     
     message("Operations complete!");
     
     return(1);
}

# ----------------------------------