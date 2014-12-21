## Course Project 1 for Getting and Cleaning Data

## 1. Merges the training and the test sets to create one data set.

# Redaing data
X_trdt1 <- as.data.frame(read.csv("train/X_train.txt", sep="", header=FALSE))
Y_trdt1 <- as.data.frame(read.csv("train/y_train.txt", sep="", header=FALSE))
subject_tr <- as.data.frame(read.csv("train/subject_train.txt", sep="", header=FALSE))

X_tsdt1 <- as.data.frame(read.csv("test/X_test.txt", sep="", header=FALSE))
Y_tsdt1 <- as.data.frame(read.csv("test/y_test.txt", sep="", header=FALSE))
subject_ts <- as.data.frame(read.csv("test/subject_test.txt", sep="", header=FALSE))

dim(X_trdt1)
dim(Y_trdt1)
dim(subject_tr)

dim(X_tsdt1)
dim(Y_tsdt1)
dim(subject_ts)

X_trdt1[1:4,]
Y_trdt1[1:4,]
subject_tr[1:4,]
X_tsdt1[1:4,]
Y_tsdt1[1:4,]
subject_ts[1:4,]


length(unique(subject_tr[,1]))
length(unique(subject_ts[,1]))

names(Y_trdt1[,1])<-"Label"
names(Y_tsdt1[,1])<-"Label"

# Combining Y-data from both training and test sources
Y_dt<-rbind(Y_trdt1, Y_tsdt1)

names(subject_tr[,1])<-"subject.id"
names(subject_ts[,1])<-"subject.id"

# Combining subject-data from both training and test sources
sub_id<-rbind(subject_tr, subject_ts)

# Creating training data
trdt1<-(X_trdt1)

# Creating test data
tsdt1<-(X_tsdt1)

# Combining training and test data (X-values only) for 'Human Activity Recognition Using Smartphones Data Set' 
HAR_Sdt<-rbind(trdt1, tsdt1)
dim(HAR_Sdt)
####################

## 2. Extracts only the measurements on the mean and standard deviation for each measurement

# Extracting features

feature_dt<-as.data.frame(read.csv("features.txt", sep="", header=FALSE))

dim(feature_dt)

feature_dt[1:4,]

meanStd_feature <- grep("mean\\(\\)|std\\(\\)", feature_dt[, 2])

length(meanStd_feature)

Featured_dt <- HAR_Sdt[, meanStdIndices]

dim(Featured_dt)

# remove "()"
names(Featured_dt) <- gsub("\\(\\)", "", feature_dt[meanStdIndices, 2])
# capitalize M
names(Featured_dt) <- gsub("mean", "Mean", names(Featured_dt)) 
# capitalize S
names(Featured_dt) <- gsub("std", "Std", names(Featured_dt)) 
# remove "-" in column names
names(Featured_dt) <- gsub("-", "", names(Featured_dt))  

####################

## 3. Uses descriptive activity names to name the activities in the data set

# Extracting activity labels
actlabels_dt<-as.data.frame(read.csv("activity_labels.txt", sep="", header=FALSE))

dim(actlabels_dt)

# update Y-labels with correct activity names
Y_dt[, 1] <- actlabels_dt[Y_dt[, 1], 2]
names(y_dt) <- "activity"

####################

## 4. Appropriately labels the data set with descriptive variable names

# Combining into a cleaned data set

Cleaned_dt<-cbind(Featured_dt, Y_dt, sub_id)

dim(Cleaned_dt)
colnames(Cleaned_dt)[67]<-"Activity.id"
colnames(Cleaned_dt)[68]<-"Subject.id"

####################

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

Cleaned_dt$Activity.id<-as.factor(Cleaned_dt$Activity.id)
Cleaned_dt$Subject.id<-as.factor(Cleaned_dt$Subject.id)

library(plyr)
library(ggplot2)

tidy_dt <- ddply(Cleaned_dt, .(Subject.id, Activity.id), function(x) colMeans(x[, 1:66]))
dim(tidy_dt)

write.table(tidy_dt, "Tidy_dt.txt", row.name=FALSE)


