
---
title: "Code book"
author: "Sven Boekhoven"
date: "Monday, October 20, 2014"
output: html_document
---

### Original dataset

The <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Human Activity Recognition Using Smartphones Data Set</a> consists of a test and training set.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Citation

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Universit√ degli Studi di Genova, Genoa I-16145, Italy.


### Features in original dataset

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

* mean(): Mean value
* std(): Standard deviation             
* mad(): Median absolute deviation            
* max(): Largest value in array           
* min(): Smallest value in array           
* sma(): Signal magnitude area            
* energy(): Energy measure. Sum of the squares divided by the number of values.   
* iqr(): Interquartile range             
* entropy(): Signal entropy             
* arCoeff(): Autorregresion coefficients with Burg order equal to 4       
* correlation(): correlation coefficient between two signals          
* maxInds(): index of the frequency component with largest magnitude       
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency    
* skewness(): skewness of the frequency domain signal         
* kurtosis(): kurtosis of the frequency domain signal         
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.           


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

## Tidy dataset
The tidy dataset consists of the mean for each subject and activity for all variables in the dataset. The variables are the mean and standard deviation of all sensor data in the original dataset.

## Variables

As required in the project description only features concerning the mean and standard deviation should be part of the dataset. Therefor I only selected  variables with mean and std in it. The variable names are al in lower case, where the first characters were t and f they were replaced with time and freq. Also () were removed.

Units:
* subject_code and act_code are numerical values identifying subjects and activities.
* Act_description is a character value describing the activity.
* All other variables are numerical values for the calculated mean of each subject and activity.

Complete list of variables:

* subject_code
* act_code
* act_description
* timebodyacc-mean-x
* timebodyacc-mean-y
* timebodyacc-mean-z
* timebodyacc-std-x
* timebodyacc-std-y
* timebodyacc-std-z
* timegravityacc-mean-x
* timegravityacc-mean-y
* timegravityacc-mean-z
* timegravityacc-std-x
* timegravityacc-std-y
* timegravityacc-std-z
* timebodyaccjerk-mean-x
* timebodyaccjerk-mean-y
* timebodyaccjerk-mean-z
* timebodyaccjerk-std-x
* timebodyaccjerk-std-y
* timebodyaccjerk-std-z
* timebodygyro-mean-x
* timebodygyro-mean-y
* timebodygyro-mean-z
* timebodygyro-std-x
* timebodygyro-std-y
* timebodygyro-std-z
* timebodygyrojerk-mean-x
* timebodygyrojerk-mean-y
* timebodygyrojerk-mean-z
* timebodygyrojerk-std-x
* timebodygyrojerk-std-y
* timebodygyrojerk-std-z
* timebodyaccmag-mean
* timebodyaccmag-std
* timegravityaccmag-mean
* timegravityaccmag-std
* timebodyaccjerkmag-mean
* timebodyaccjerkmag-std
* timebodygyromag-mean
* timebodygyromag-std
* timebodygyrojerkmag-mean
* timebodygyrojerkmag-std
* freqbodyacc-mean-x
* freqbodyacc-mean-y
* freqbodyacc-mean-z
* freqbodyacc-std-x
* freqbodyacc-std-y
* freqbodyacc-std-z
* freqbodyacc-meanfreq-x
* freqbodyacc-meanfreq-y
* freqbodyacc-meanfreq-z
* freqbodyaccjerk-mean-x
* freqbodyaccjerk-mean-y
* freqbodyaccjerk-mean-z
* freqbodyaccjerk-std-x
* freqbodyaccjerk-std-y
* freqbodyaccjerk-std-z
* freqbodyaccjerk-meanfreq-x
* freqbodyaccjerk-meanfreq-y
* freqbodyaccjerk-meanfreq-z
* freqbodygyro-mean-x
* freqbodygyro-mean-y
* freqbodygyro-mean-z
* freqbodygyro-std-x
* freqbodygyro-std-y
* freqbodygyro-std-z
* freqbodygyro-meanfreq-x
* freqbodygyro-meanfreq-y
* freqbodygyro-meanfreq-z
* freqbodyaccmag-mean
* freqbodyaccmag-std
* freqbodyaccmag-meanfreq
* freqbodybodyaccjerkmag-mean
* freqbodybodyaccjerkmag-std
* freqbodybodyaccjerkmag-meanfreq
* freqbodybodygyromag-mean
* freqbodybodygyromag-std
* freqbodybodygyromag-meanfreq
* freqbodybodygyrojerkmag-mean
* freqbodybodygyrojerkmag-std
* freqbodybodygyrojerkmag-meanfreq
