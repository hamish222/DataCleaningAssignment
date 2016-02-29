---
title: "CodeBook for Assignment: Getting and Cleaning Data Course Project"
author: "Derek P"
date: "February 24, 2016"
output: html_document
---

# Variables

The tidy dataset (tidyset.txt) contains the following 50 variables: 

 [1] "Subject"                  
 [2] "Activity"                 
 [3] "1.t.BodyAcc.mean.X"       
 [4] "2.t.BodyAcc.mean.Y"       
 [5] "3.t.BodyAcc.mean.Z"       
 [6] "4.t.BodyAcc.std.X"        
 [7] "5.t.BodyAcc.std.Y"        
 [8] "6.t.BodyAcc.std.Z"        
 [9] "41.t.GravityAcc.mean.X"   
[10] "42.t.GravityAcc.mean.Y"   
[11] "43.t.GravityAcc.mean.Z"   
[12] "44.t.GravityAcc.std.X"    
[13] "45.t.GravityAcc.std.Y"    
[14] "46.t.GravityAcc.std.Z"    
[15] "81.t.BodyAccJerk.mean.X"  
[16] "82.t.BodyAccJerk.mean.Y"  
[17] "83.t.BodyAccJerk.mean.Z"  
[18] "84.t.BodyAccJerk.std.X"   
[19] "85.t.BodyAccJerk.std.Y"   
[20] "86.t.BodyAccJerk.std.Z"   
[21] "121.t.BodyGyro.mean.X"    
[22] "122.t.BodyGyro.mean.Y"    
[23] "123.t.BodyGyro.mean.Z"    
[24] "124.t.BodyGyro.std.X"     
[25] "125.t.BodyGyro.std.Y"     
[26] "126.t.BodyGyro.std.Z"     
[27] "161.t.BodyGyroJerk.mean.X"
[28] "162.t.BodyGyroJerk.mean.Y"
[29] "163.t.BodyGyroJerk.mean.Z"
[30] "164.t.BodyGyroJerk.std.X" 
[31] "165.t.BodyGyroJerk.std.Y" 
[32] "166.t.BodyGyroJerk.std.Z" 
[33] "266.f.BodyAcc.mean.X"     
[34] "267.f.BodyAcc.mean.Y"     
[35] "268.f.BodyAcc.mean.Z"     
[36] "269.f.BodyAcc.std.X"      
[37] "270.f.BodyAcc.std.Y"      
[38] "271.f.BodyAcc.std.Z"      
[39] "345.f.BodyAccJerk.mean.X" 
[40] "346.f.BodyAccJerk.mean.Y" 
[41] "347.f.BodyAccJerk.mean.Z" 
[42] "348.f.BodyAccJerk.std.X"  
[43] "349.f.BodyAccJerk.std.Y"  
[44] "350.f.BodyAccJerk.std.Z"  
[45] "424.f.BodyGyro.mean.X"    
[46] "425.f.BodyGyro.mean.Y"    
[47] "426.f.BodyGyro.mean.Z"    
[48] "427.f.BodyGyro.std.X"     
[49] "428.f.BodyGyro.std.Y"     
[50] "429.f.BodyGyro.std.Z"

Following is a description of the content of the variables.

1. **Subject** - The code of the subject (integers 1:30)
2. **Activity** - Factor containing the activity (factors 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING )
3. **All other variables** are the averages by subject-activity pair of the average or standard deviation measurements from the original dataset (see below for details). These variables are described by the following schema:

"[column index in the original dataset]-[t or f]-[abbreviated movement name]-[mean or standard deviation]-[X, Y, or Z axis]"

These schema broadly follows the recommendations of the Google R coding standards. [3]

* The column index of the data features in the original dataset is retained as a prefix to the column name in the tidy dataset, for easy reference to the original data if needed. 
* "t" indicates time domain signals and "f" indicates frequency domain signals. 
* Abbreviated movements include:
* BodyAcc - Bodily acceleration in a given direction
* GravityAcc - Gravitational acceleration toward the earth
* BodyAccJerk - Bodily acceleration jerk, or abruptness of bodily acceleration
* BodyGyro - Bodily gyration
* BodyGyroJerk - Bodily gyration jerk, or abruptness of bodily acceleration


See information on the original dataset below for detailed explanations of the measurement variables.

# Original Dataset

The following is an extract of the feature descriptions from the original dataset.

## Variables

```{r}
names(full.set)
```

## Feature Selection 

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

* **mean(): Mean value**
* **std(): Standard deviation**
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

The complete list of variables of each feature vector is available in 'features.txt'

Data source:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Scripting references:
[2] David Hood. Getting and Cleaning Data, the Assignment. https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

[3] https://google.github.io/styleguide/Rguide.xml
