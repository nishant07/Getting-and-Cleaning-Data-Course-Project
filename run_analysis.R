#Reading Datasets into R Dataframes
x_train <- read.table("UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
x_test <- read.table("UCI HAR Dataset\\test\\X_test.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt", header = FALSE)
sub_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
sub_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)

#Merging related dataframes
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subj <- rbind(sub_train, sub_test)

#Adding appropriate Column names by fetching from respected files.
heads.dat <- read.table("UCI HAR Dataset\\features.txt", header = FALSE)
heads <- as.character(heads.dat[,2])
names(x) <- heads
names(y) <- c("Activity")
names(subj) <- c("Subject")

#Merging all 3 data sets to create single dataset
merge.dat <- cbind(x, y, subj)

#Removing separate data frames to free up memory
rm(x, y, subj, x_train, y_train, sub_train, x_test, y_test, sub_test)
#Fetching activity names
act.dat <- read.table("UCI HAR Dataset\\activity_labels.txt", header = FALSE)
names(act.dat) <- c("V1","Activity_Name")

#Replacing Activity IDs with appropriate activity names
tidy <- merge(merge.dat, act.dat, by.x = "Activity", by.y = "V1")
#Droping Activity ID column which has become unnecessary 
tidy$Activity <- NULL
#Removing non usable dataframes
rm(merge.dat, act.dat)

#Searching measurements on the mean and standard deviation
mean_std_names <- names(tidy[,grep("mean|std", names(tidy))])

#Extracting only measurements on the mean and standard deviation for each measurement. 
mean_std_measures <- tidy[,mean_std_names]

#Creating tidy dataset with average of each variable for each activity and each subject

req_tidy_dat <- aggregate(mean_std_measures, by = list(tidy$Activity_Name,tidy$Subject),mean)

#Adding appropriate column names
names(req_tidy_dat) <- c("Activity_Name","Subject",names(mean_std_measures))

#Exporting tidy data to a comma separated TXT file
write.table(req_tidy_dat, file = "Tidy_Data.txt", sep = ",", row.names = FALSE)
#Exporting merged dataset to a file
write.csv(tidy, file = "Merged_Data.csv", row.names = FALSE)
