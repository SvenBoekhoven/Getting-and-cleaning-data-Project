---
title: "README"
author: "Sven Boekhoven"
date: "Monday, October 20, 2014"
output: html_document
---

## Introduction

This repo contains information from an assignement of the Coursera Data Science signature track. Specificaly Unit Getting an cleaning data. The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Repo content

This repo consists of the following files:

* <b>README.md</b>: This readme file.
* <b>codebook.md</b>: A codebook explaining the content of the tidy dataset and the proces of cleaning the data.
* <b>run_analysis.R</b>: The R script which, when executed, produces the tide dataset.
* <b>tidy_dataset.txt</b>: The tidy dataset produced by the R script.

## R Script


### Purpose

The purpose of the script is to perform these 5 steps:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set 
   with the average of each variable for each activity and each subject.
   
### How it works

The script first opens the required libraries and sets the correct directory references.
It opens the featues and activities files for later use. Then the three test data files are opened and merged. Followed by the three train files, which are opened and merged. Then the variables for the standard deviation and mean are searched using grep. The dataset is subset using these variables. The variable names are made tidy by removing (), changing t to time and f to freq and making all names lower case. Finally the tidy dataset is created by calculating the mean for all variables using the dplyr summarise_each function. The resulting dataset is writen to a file called tidy_data.txt.

