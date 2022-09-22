library(dplyr)
filename <- "Coursera_project_final.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method = "curl")
}
# if folder exists
if (!file.exists("UCI HAR DATASET")){
  unzip(filename)
}

#Assigning all data frames
features <- read.table("UCI HAR DATASET/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#STEP1: Merges the training and the test sets to create one data set.
x <- rbind(x_train, x_test)
y <- rbind(Y_train, y_test)
subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(subject, y, x)
View(Merged_Data)

#STEP 2 : Extracts only the measurements on the mean and standard deviation for each measurements.
data_Tdy <- Merged_Data %>% select(
                              subject,
                              code,
                              contains("mean"),
                              contains("std"))

View(data_Tdy)


#STEP 3: Uses descriptive activity names to name the activities in the data set

data_Tdy$code <- activities[data_Tdy$code, 2]
View(data_Tdy$code)

#STEP 4: Appropriately labels the data set with descriptive variable names

names(data_Tdy)[2] = "activity"
names(data_Tdy) <- gsub("Acc", "Accelerometer", names(data_Tdy))
names(data_Tdy) <- gsub("Gyro", "Gyroscope", names(data_Tdy))
names(data_Tdy) <- gsub("BodyBody", "Body", names(data_Tdy))
names(data_Tdy) <- gsub("Mag", "Magnitude", names(data_Tdy))
names(data_Tdy) <- gsub("^t", "Time", names(data_Tdy))
names(data_Tdy) <- gsub("^f", "Frequency", names(data_Tdy))
names(data_Tdy) <- gsub("tBody", "TimeBody", names(data_Tdy))
names(data_Tdy) <- gsub("-mean()", "Mean", names(data_Tdy), ignore.case = TRUE)
names(data_Tdy) <- gsub("-std()", "STD", names(data_Tdy), ignore.case = TRUE)
names(data_Tdy) <- gsub("-freq()", "Frequency", names(data_Tdy), ignore.case = TRUE)
names(data_Tdy) <- gsub("angle", "Angle", names(data_Tdy))
names(data_Tdy) <- gsub("gravity", "Gravity", names(data_Tdy))

#STEP 5: From the data ser in STEP 4, creates asecond, independent tidy data set with the average of each variable for each activity and each subject.

Data_final <- data_Tdy %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(Data_final, "FinalData.txt", row.names = FALSE)
