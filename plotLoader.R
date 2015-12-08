# ----------------------------------
# Adam Moses
# Exploratory Data Analysis - coursera
# Project 1
# ----------------------------------
# Please see associated readme.MD for further explanation
# on project specifications; that file was forked from the original github
# repository
# ----------------------------------


# ----------------------------------
# This function will load the data from the .txt file and return a dataset
# useful to the specifications of this project. This script file is sourced
# by all the plot script files involved in this project. This function assumes
# the needed .txt file is in the working directory.
# ----------------------------------
loadPlotsData <- function()
{
     message("Reading data from 'household_power_consumption.txt'...");
     fileData <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?");
     
     message("Making a copy...");
     workingData <- fileData;
     
     message("Converting date variable to a proper date type...");
     workingData$Date <- as.Date(workingData$Date, "%d/%m/%Y");
     
     message("Converting time variable to a character type...");
     workingData$Time <- as.character(workingData$Time);
     
     message("Combining date and time variables to produce proper DateTime type...");
     newDateTime <- strptime(paste(workingData$Date, workingData$Time), "%Y-%m-%d %H:%M:%S");
     
     message("Add DateTime as new variable...");
     workingData <- cbind(newDateTime, workingData);
     
     message("Remove all 'NA' rows...");
     workingData <- na.omit(workingData);
     
     message("Subset for dates inclusive of '2007-02-01' and '2007-02-02'...")
     usefulData <- subset(workingData, 
                          (workingData$Date >= "2007-02-01" 
                           & workingData$Date <= "2007-02-02"));
     
     message("Useful dataset succesfully produced!");
     return(usefulData);
}

# ----------------------------------

# ----------------------------------
# This function will run all four of the plot operations, producing four
# .png files in the working directory. This function assumes all the 
# plot script files are in the working directory.
# ----------------------------------
runAllPlots <- function(mainData = NULL)
{
     message("This operation will run all the plot operations...");
     
     # check that all the needed plot script files exist
     # error if one does not
     # otherwise source them all
     
     # load plot1()
     if (file.exists("plot1.R"))
          source("plot1.R")
     else
          stop("Could not find 'plot1.R' needed for runAllPlots()")

     # load plot2()          
     if (file.exists("plot2.R"))
          source("plot2.R")
     else
          stop("Could not find 'plot2.R' needed for runAllPlots()")

     # load plot3()          
     if (file.exists("plot3.R"))
          source("plot3.R")
     else
          stop("Could not find 'plot3.R' needed for runAllPlots()")
          
     # load plot4()          
     if (file.exists("plot4.R"))
          source("plot4.R")
     else
          stop("Could not find 'plot4.R' needed for runAllPlots()")
     
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

     # run each of the plot operation sequentially
     
     message("** Running plot1() **")     
     plot1(mainData)
     
     message("** Running plot2() **")
     plot2(mainData)
     
     message("** Running plot3() **")
     plot3(mainData)
     
     message("** Running plot4() **")
     plot4(mainData);
     
     return(1);
}

# ----------------------------------
