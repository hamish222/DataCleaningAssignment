---
title: "README for Assignment: Getting and Cleaning Data Course Project"
author: "Derek P"
date: "February 24, 2016"
output: html_document
---

# Summary

This project creates a new tidy dataset based on a much larger dataset containing measurements from accelerometers from the Samsung Galaxy S smartphone for 30 different test subjects conducting one of six physical activities. The original data, divided into training and test sets, contained readings for 10,299 points in time. The tidy dataset created by this project contains the mean values by subject-activity pairing for each of 48 different mean or standard deviations of the original measurements. 

# Data Cleaning and Tidying Script

The R-script "run_analysis.R" performs the following transformations to arrive at the final tidy dataset. It makes use of the packages dplyr, tidyr, and reshape2.

1. Downloads and unzips the original dataset into a folder in the working directory. 
2. Obtains the list of features (variable names) for the core training and test data.
3. Opens the training and test data, and names the columns with the feature names from step 1. 
4. Opens subject codes and activity codes for the training and test data, renames them as "Subject" and "Activity" respectively, and binds them to the core data.
5. Merges the test and training data into one full dataset (full.set).
6. Selects only variables that represent means or standard deviations of the original, raw data (see original documentation for details [1]) and saves the result as a new limited dataset (lim.set). Weighted averages and other calculated variables are not included. 
7. Obtains the coding guide for activity labels and recodes the "Activity" variable as a factor. 
8. Renames the limited dataset variables with descriptive names. 
9. Melts and casts the limited dataset to create a new tidy dataset (tidy.set) that contains the average value of each measurement for each subject-activity pair. 
10. Exports the tidy dataset into a new file "tidyset.txt"

# Final Tidy Dataset

Use the following code to read the tidy dataset into your R console:

**tidy.set <- read.table("tidyset.txt", header=TRUE)**

The final tidy dataset contains 50 variables. The column index of the data features in the original dataset is retained as a prefix to the column name in the tidy dataset, for easy reference to the original data if needed. 

See the CodeBook for more detailed explanations of the variables, as well as extracts from the CodeBook for the original dataset that describes the features. 