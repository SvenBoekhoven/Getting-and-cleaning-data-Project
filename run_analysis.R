# You should create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

library(reshape2)
library(plyr)
library(reshape2)

setwd("C:/Users/Sven/Google Drive/Coursera/GCD/Project 1")
datadir <- "./UCI HAR Dataset"
testdir <- paste(datadir, "/test/", sep="")
traindir <- paste(datadir, "/train/", sep="")

## Read features
features <- read.table(paste(datadir, "features.txt", sep="/"), header=FALSE)

## Read activities
activities <- read.table(paste(datadir, "activity_labels.txt", sep="/"), header=FALSE)

## Read data files
subject_test <- read.table(paste(testdir, "subject_test.txt", sep=""), header=FALSE)
X_test <- read.table(paste(testdir, "X_test.txt", sep=""), header=FALSE)
y_test <- read.table(paste(testdir, "y_test.txt", sep=""), header=FALSE)

## Add activity description (step 3)
y_test <- merge(y_test, activities, by="V1")

## Apply names to attributes (step 4)
names(subject_test) <- c("subject_code")
names(y_test) <- c("act_code", "act_description")
names(X_test) <- as.vector(features$V2)

## Merge testset into one
subject_test <- cbind(subject_test, y_test)
subject_test <- cbind(subject_test, X_test)

## Read training data files
subject_train <- read.table(paste(traindir, "subject_train.txt", sep=""), header=FALSE)
X_train <- read.table(paste(traindir, "X_train.txt", sep=""), header=FALSE)
y_train <- read.table(paste(traindir, "y_train.txt", sep=""), header=FALSE)

## Add activity description (step 3)
y_train <- merge(y_train, activities, by="V1")

## Apply names to attributes (step 4)
names(subject_train) <- c("subject_code")
names(y_train) <- c("act_code", "act_description")
names(X_train) <- as.vector(features$V2)

## Merge trainset into one
subject_train <- cbind(subject_train, y_train)
subject_train <- cbind(subject_train, X_train)

## Merge train and testset (step 1)
complete_set <- rbind(subject_test, subject_train)

## select std and mean features (step 2)
meanrows <- grep("mean",features$V2)
stdrows <- grep("std",features$V2)
rows <- sort(c(1,2,3, meanrows+3, stdrows+3))

complete_subset <- subset(complete_set[, rows])

## Change variable names
names <- names(complete_subset)
names <- tolower(names) # lower case
names <- gsub("[()]", "", names) # Remove ()
firstElement <- function(x){substr(x,1,1)}
fe <- sapply(names, firstElement)
fe <- sub("t", "time", fe) # Replace t with time
fe <- sub("f", "freq", fe) # Replace f with freq
names <- paste(as.vector(fe), substring(names, 2), sep="")
names(complete_subset) <- names

## Calculate mean for all variables for each subject and activity (step 5)
tidy_dataset <- complete_subset %>% 
                  group_by(subject_code, act_code, act_description) %>% 
                  summarise_each(funs(mean))

## Save the tidy dataset
write.table(tidy_dataset, paste(datadir, "tidy_dataset.txt", sep="/"), row.names=FALSE)
