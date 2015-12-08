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

plot1 <- function(mainData = NULL)
{
     # check that "plotloader.R" exists and source it, otherwise error
     if (file.exists("plotLoader.R"))
          source("plotLoader.R")
     else
          stop("Could not find 'plotLoader.R' needed for plot1()")
     
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
     
     message("Opening 'plot1.png' file...")
     png("plot1.png")
     
     message("Rendering data...")
     hist(mainData$Global_active_power, 
          col = "red", 
          xlab = "Global Active Power (kilowatts)",
          main = "Global Active Power")
     
     message("Closing file 'plot1.png'...")
     dev.off()
     
     message("Operations complete!")
     
     return(1)
}

# ----------------------------------