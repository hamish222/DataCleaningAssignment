# Assignment: Getting and Cleaning Data Course Project
# By Derek P

install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

# Download and unzip the data

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")
unzip("data.zip")

# Store the user's working director for reference in file paths. 
x <- getwd()

# Get the feature names and indices
features <- read.table(file.path(x, "UCI HAR Dataset", "features.txt"))

# Get the training set
train.set <- read.table(file.path(x, "UCI HAR Dataset", "train", "X_train.txt"))

# Set the training set column names as the feature names with the feature index as a prefix
colnames(train.set) <- paste(features[,1], features[,2], sep=".")

# Get the training set subject and activity labels
train.sub <- read.table(file.path(x, "UCI HAR Dataset", "train", "subject_train.txt"))
train.sub <- rename(train.sub, Subject = V1)
train.act <- read.table(file.path(x, "UCI HAR Dataset", "train", "y_train.txt"))
train.act <- rename(train.act, Activity = V1)

# Get the test set
test.set <- read.table(file.path(x, "UCI HAR Dataset", "test", "X_test.txt"))

# Set the test set column names as the feature names with the feature index as a prefix
colnames(test.set) <- paste(features[,1], features[,2], sep=".")

# Get the test set subject and activity labels
test.sub <- read.table(file.path(x, "UCI HAR Dataset", "test", "subject_test.txt"))
test.sub <- rename(test.sub, Subject = V1)
test.act <- read.table(file.path(x, "UCI HAR Dataset", "test", "y_test.txt"))
test.act <- rename(test.act, Activity = V1)

# Combine the data set, subject, and labels into one data.frame each for training and test
train.full <- cbind(train.set, train.sub, train.act)
test.full <- cbind(test.set, test.sub, test.act)

# Merge the complete training and test sets into one data.frame
full.set <- rbind(train.full, test.full)

rm(train.set, train.sub, train.act, train.full,
   test.set, test.sub, test.act, test.full)

# Select only measurements on the mean and standard deviation of each measurement
lim.set <- select(full.set, Subject, Activity, matches(".+(mean\\(\\)|std\\(\\)).+"))

# Recode the activity labels as a factor with string descriptions
activities <- read.table(file.path(x, "UCI HAR Dataset", "activity_labels.txt"))
lim.set$Activity <- factor(lim.set$Activity)
levels(lim.set$Activity) <- activities[,2]

# Gives the variables descriptive names

colnames(lim.set) <- sub("-mean\\(\\)", "-mean", colnames(lim.set))
colnames(lim.set) <- sub("std\\(\\)", "std", colnames(lim.set))
colnames(lim.set) <- sub("\\.t", "-t-", colnames(lim.set))
colnames(lim.set) <- sub("\\.f", "-f-", colnames(lim.set))
colnames(lim.set) <- gsub("-", ".", colnames(lim.set))

rm(activities, features)

# Create a tidy data set with the average of each variable by activity and subject

install.packages("reshape2")
library(reshape2)

tidy.set <- melt(lim.set, id=c("Subject", "Activity"))
tidy.set <- dcast(tidy.set, Subject + Activity ~ variable, mean)

# Export the tidy dataset to a text file
write.table(tidy.set, "tidyset.txt")

## The End!

