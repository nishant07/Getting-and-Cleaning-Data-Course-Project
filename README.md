Getting-and-Cleaning-Data-Course-Project
========================================

The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Here are the data for the project:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unzip the file in current working directory of R.

Repository contains one R script called run_analysis.R that does the following.       
- 1 Merges the training and the test sets to create one data set.
- 2 Extracts only the measurements on the mean and standard deviation for each measurement.
- 3 Uses descriptive activity names to name the activities in the data set.
- 4 Appropriately labels the data set with descriptive variable names.
- 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This script assumes the Samsung data is extracted in your working directory (so there's a folder called UCI HAR Dataset).

To Run the script, type:
source("run_analysis.R")

You will get below 2 files in your working directory:
- Merged_Data.csv - A CSV file having merged dataset.
- Tidy_Data.txt - A text file having tidy dataset asked as 5th requirement of script.


