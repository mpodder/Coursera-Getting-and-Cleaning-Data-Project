Coursera-Getting-and-Cleaning-Data-Project
==========================================
Raw-data description belongs to the following website: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Required raw-data belongs to the following website: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 R script called run_analysis.R has been created to address the following task. 
 
Task-1: Merges the training and the test sets to create one data set.
Redaing both X-data from respective training and test folders and followed by combining training and test data (X-values only) for 'Human Activity Recognition Using Smartphones Data Set' . Resultant data set is called HAR_Sdt with 10299 rows and 562 columns
sub-step1: Y-dt (RE: activity-labels) for both training and test has been extracted and combined to be used in Task 3-4
sub-step2: Sub_id (RE: subject) for both training and test has been extracted and combined to be used in Task 4

Task-2: Extracts only the measurements on the mean and standard deviation for each measurement. 
Extracting features from features.txt file and followed by selecting required feature-labels and adding that to the previous joined X-data. The resultant data set in called Featured_dt with 66 selective columns 

Task-3: Uses descriptive activity names to name the activities in the data set
Extracting activity labels from activity_labels.txt and merged with combined Y-data (created in Task-1)

Task-4: Appropriately labels the data set with descriptive variable names. 
All three data sets are combined: Featured_dt, Y_dt, sub_id with appropriate column names. Reultant data set is called Cleaned_dt with 68 columns

Task-5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
ddply function (library(plyr)) has been applied to achieve the targetted data frame with means by activity (6-labels) and each subject (30-subjects). Resultant data file is called tidy_dt with 180 rows and 68 columns

Final file is uploaded in the server
