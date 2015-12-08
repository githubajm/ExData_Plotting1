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

plot2 <- function(mainData = NULL)
{
     # check that "plotloader.R" exists and source it, otherwise error
     if (file.exists("plotLoader.R"))
          source("plotLoader.R")
     else
          stop("Could not find 'plotLoader.R' needed for plot2()")
     
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
     
     message("Opening 'plot2.png' file...");
     png("plot2.png");
     
     message("Rendering data...");
     plot(mainData$newDateTime, 
          mainData$Global_active_power, 
          type = "l", 
          ylab = "Global Active Power (kilowatts)",
          xlab = "");

     message("Closing file 'plot2.png'...");
     dev.off();
     
     message("Operations complete!");
     
     return(1);
}

# ----------------------------------