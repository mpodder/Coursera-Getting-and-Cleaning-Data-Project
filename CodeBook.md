CodeBook for the tidy dataset

Raw data or Data source:

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data description (as appeared in the above website)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person 
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we 
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been 
video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% 
of the volunteers was selected for generating the training data and 30% the test data.


The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which 
has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration 
and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time 
and frequency domain.


The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Transformation details

There are 5 parts in the project:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

R script called run_analysis.R has been created to address the above 5 tasks.

Task-1: Merges the training and the test sets to create one data set.

Redaing both X-data from respective training and test folders and followed by combining training and test data (X-values only) for 'Human Activity Recognition Using Smartphones Data Set' . Resultant data set is called HAR_Sdt with 10299 rows and 562 columns

sub-step1: Y-dt (RE: activity-labels) for both training and test has been extracted and combined to be used in Task 3-4

sub-step2: Sub_id (RE: subject) for both training and test has been extracted and combined to be used in Task 4

Task-2: Extracts only the measurements on the mean and standard deviation for each measurement.

Extracting features from features.txt file and followed by selecting required feature-labels and adding that to the previous joined X-data. The resultant data set in called Featured_dt with 66 selective columns (Names: specific Mean and STD measures)

Task-3: Uses descriptive activity names to name the activities in the data set

Extracting activity labels from activity_labels.txt and merged with combined Y-data (created in Task-1)

Task-4: Appropriately labels the data set with descriptive variable names.

All three data sets are combined: Featured_dt, Y_dt (Activility label), sub_id (Subject or volunteers enrolled in this study) with appropriate column names. Reultant data set is called Cleaned_dt with 68 columns

Task-5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

ddply function (library(plyr)) has been applied to achieve the targetted data frame with means by activity (6-labels) and each subject (30-subjects). Resultant data file is called tidy_dt with 180 rows and 68 columns

Final file is uploaded in the server
