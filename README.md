# Getting_Cleaning_Data
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  Here are the data for the project:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Getting and Cleaning Data Course Project
This repository is a Nunno Nugroho submission for Getting and Cleaning Data course project. It has the instructions on how to run analysis on Human Activity recognition dataset.

Dataset
Human Activity Recognition Using Smartphones

Files
CodeBook.md a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

run_analysis.R performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:
Merges the training and the test sets to create one data set.
I extracted only the measurements on the mean and standard deviation for each measurement.
Implemented descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
FinalData.txt is the exported final data after going through all the sequences described above.
