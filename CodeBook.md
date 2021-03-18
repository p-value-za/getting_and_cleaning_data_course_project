---
title: "Codebook for 'tidy_data_summary'"
output:
  pdf_document: default
  html_document: default
---


```r
knitr::kable(metadata_xl)
```



|Variable Name               |Variable Label                                                                                                                         |Type    |Range   |
|:---------------------------|:--------------------------------------------------------------------------------------------------------------------------------------|:-------|:-------|
|activity                    |Identifies the activity performed.
Value Labels:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING |factor  |1 - 6   |
|subject                     |Identifies the subject who performed the activity                                                                                      |integer |1 - 30  |
|avg-tBodyAcc-mean()-X       |Time domain, average of the mean values for body accelaration signals on the X axis.                                                   |numeric |[-1, 1] |
|avg-tBodyAcc-mean()-Y       |Time domain, average of the mean values for body accelaration signals on the Y axis.                                                   |numeric |[-1, 1] |
|avg-tBodyAcc-mean()-Z       |Time domain, average of the mean values for body accelaration signals on the Z axis.                                                   |numeric |[-1, 1] |
|avg-tBodyAcc-std()-X        |Time domain, average of the standard deviation values for body accelaration signals on the X axis.                                     |numeric |[-1, 1] |
|avg-tBodyAcc-std()-Y        |Time domain, average of the standard deviation values for body accelaration signals on the Y axis.                                     |numeric |[-1, 1] |
|avg-tBodyAcc-std()-Z        |Time domain, average of the standard deviation values for body accelaration signals on the Z axis.                                     |numeric |[-1, 1] |
|avg-tGravityAcc-mean()-X    |Time domain, average of the mean values for gravity accelaration signals on the X axis.                                                |numeric |[-1, 1] |
|avg-tGravityAcc-mean()-Y    |Time domain, average of the mean values for gravity accelaration signals on the Y axis.                                                |numeric |[-1, 1] |
|avg-tGravityAcc-mean()-Z    |Time domain, average of the mean values for gravity accelaration signals on the Z axis.                                                |numeric |[-1, 1] |
|avg-tGravityAcc-std()-X     |Time domain, average of the standard deviation values for gravity accelaration signals on the X axis.                                  |numeric |[-1, 1] |
|avg-tGravityAcc-std()-Y     |Time domain, average of the standard deviation values for gravity accelaration signals on the Y axis.                                  |numeric |[-1, 1] |
|avg-tGravityAcc-std()-Z     |Time domain, average of the standard deviation values for gravity accelaration signals on the Z axis.                                  |numeric |[-1, 1] |
|avg-tBodyAccJerk-mean()-X   |Time domain, average of the mean values for body accelaration jerk signals on the X axis.                                              |numeric |[-1, 1] |
|avg-tBodyAccJerk-mean()-Y   |Time domain, average of the mean values for body accelaration jerk signals on the Y axis.                                              |numeric |[-1, 1] |
|avg-tBodyAccJerk-mean()-Z   |Time domain, average of the mean values for body accelaration jerk signals on the Z axis.                                              |numeric |[-1, 1] |
|avg-tBodyAccJerk-std()-X    |Time domain, average of the standard deviation values for body accelaration jerk signals on the X axis.                                |numeric |[-1, 1] |
|avg-tBodyAccJerk-std()-Y    |Time domain, average of the standard deviation values for body accelaration jerk signals on the Y axis.                                |numeric |[-1, 1] |
|avg-tBodyAccJerk-std()-Z    |Time domain, average of the standard deviation values for body accelaration jerk signals on the Z axis.                                |numeric |[-1, 1] |
|avg-tBodyGyro-mean()-X      |Time domain, average of the mean values for body angular velocity signals on the X axis.                                               |numeric |[-1, 1] |
|avg-tBodyGyro-mean()-Y      |Time domain, average of the mean values for body angular velocity signals on the Y axis.                                               |numeric |[-1, 1] |
|avg-tBodyGyro-mean()-Z      |Time domain, average of the mean values for body angular velocity signals on the Z axis.                                               |numeric |[-1, 1] |
|avg-tBodyGyro-std()-X       |Time domain, average of the standard deviation values for body angular velocity signals on the X axis.                                 |numeric |[-1, 1] |
|avg-tBodyGyro-std()-Y       |Time domain, average of the standard deviation values for body angular velocity signals on the Y axis.                                 |numeric |[-1, 1] |
|avg-tBodyGyro-std()-Z       |Time domain, average of the standard deviation values for body angular velocity signals on the Z axis.                                 |numeric |[-1, 1] |
|avg-tBodyGyroJerk-mean()-X  |Time domain, average of the mean values for body angular velocity jerk signals on the X axis.                                          |numeric |[-1, 1] |
|avg-tBodyGyroJerk-mean()-Y  |Time domain, average of the mean values for body angular velocity jerk signals on the Y axis.                                          |numeric |[-1, 1] |
|avg-tBodyGyroJerk-mean()-Z  |Time domain, average of the mean values for body angular velocity jerk signals on the Z axis.                                          |numeric |[-1, 1] |
|avg-tBodyGyroJerk-std()-X   |Time domain, average of the standard deviation values for body angular velocity jerk signals on the X axis.                            |numeric |[-1, 1] |
|avg-tBodyGyroJerk-std()-Y   |Time domain, average of the standard deviation values for body angular velocity jerk signals on the Y axis.                            |numeric |[-1, 1] |
|avg-tBodyGyroJerk-std()-Z   |Time domain, average of the standard deviation values for body angular velocity jerk signals on the Z axis.                            |numeric |[-1, 1] |
|avg-tBodyAccMag-mean()      |Time domain, average of the mean values for body accelaration signals magnitude on the Z axis.                                         |numeric |[-1, 1] |
|avg-tBodyAccMag-std()       |Time domain, average of the standard deviation values for body accelaration signals magnitude on the Z axis.                           |numeric |[-1, 1] |
|avg-tGravityAccMag-mean()   |Time domain, average of the mean values for gravity accelaration signals magnitude on the Z axis.                                      |numeric |[-1, 1] |
|avg-tGravityAccMag-std()    |Time domain, average of the standard deviation values for gravity accelaration signals magnitude on the Z axis.                        |numeric |[-1, 1] |
|avg-tBodyAccJerkMag-mean()  |Time domain, average of the mean values for body accelaration jerk signals magnitude on the Z axis.                                    |numeric |[-1, 1] |
|avg-tBodyAccJerkMag-std()   |Time domain, average of the standard deviation values for body accelaration jerk signals magnitude on the Z axis.                      |numeric |[-1, 1] |
|avg-tBodyGyroMag-mean()     |Time domain, average of the mean values for body angular velocity signals magnitude on the Z axis.                                     |numeric |[-1, 1] |
|avg-tBodyGyroMag-std()      |Time domain, average of the standard deviation values for body angular velocity signals magnitude on the Z axis.                       |numeric |[-1, 1] |
|avg-tBodyGyroJerkMag-mean() |Time domain, average of the mean values for body angular velocity jerk signals magnitude on the Z axis.                                |numeric |[-1, 1] |
|avg-tBodyGyroJerkMag-std()  |Time domain, average of the standard deviation values for body angular velocity jerk signals magnitude on the Z axis.                  |numeric |[-1, 1] |
|avg-fBodyAcc-mean()-X       |Frequency domain, average of the mean values for body accelaration signals on the X axis.                                              |numeric |[-1, 1] |
|avg-fBodyAcc-mean()-Y       |Frequency domain, average of the mean values for body accelaration signals on the Y axis.                                              |numeric |[-1, 1] |
|avg-fBodyAcc-mean()-Z       |Frequency domain, average of the mean values for body accelaration signals on the Z axis.                                              |numeric |[-1, 1] |
|avg-fBodyAcc-std()-X        |Frequency domain, average of the standard deviation values for body accelaration signals on the X axis.                                |numeric |[-1, 1] |
|avg-fBodyAcc-std()-Y        |Frequency domain, average of the standard deviation values for body accelaration signals on the Y axis.                                |numeric |[-1, 1] |
|avg-fBodyAcc-std()-Z        |Frequency domain, average of the standard deviation values for body accelaration signals on the Z axis.                                |numeric |[-1, 1] |
|avg-fBodyAccJerk-mean()-X   |Frequency domain, average of the mean values for body accelaration jerk signals on the X axis.                                         |numeric |[-1, 1] |
|avg-fBodyAccJerk-mean()-Y   |Frequency domain, average of the mean values for body accelaration jerk signals on the Y axis.                                         |numeric |[-1, 1] |
|avg-fBodyAccJerk-mean()-Z   |Frequency domain, average of the mean values for body accelaration jerk signals on the Z axis.                                         |numeric |[-1, 1] |
|avg-fBodyAccJerk-std()-X    |Frequency domain, average of the standard deviation values for body accelaration jerk signals on the X axis.                           |numeric |[-1, 1] |
|avg-fBodyAccJerk-std()-Y    |Frequency domain, average of the standard deviation values for body accelaration jerk signals on the Y axis.                           |numeric |[-1, 1] |
|avg-fBodyAccJerk-std()-Z    |Frequency domain, average of the standard deviation values for body accelaration jerk signals on the Z axis.                           |numeric |[-1, 1] |
|avg-fBodyGyro-mean()-X      |Frequency domain, average of the mean values for body angular velocity signals on the X axis.                                          |numeric |[-1, 1] |
|avg-fBodyGyro-mean()-Y      |Frequency domain, average of the mean values for body angular velocity signals on the Y axis.                                          |numeric |[-1, 1] |
|avg-fBodyGyro-mean()-Z      |Frequency domain, average of the mean values for body angular velocity signals on the Z axis.                                          |numeric |[-1, 1] |
|avg-fBodyGyro-std()-X       |Frequency domain, average of the standard deviation values for body angular velocity signals on the X axis.                            |numeric |[-1, 1] |
|avg-fBodyGyro-std()-Y       |Frequency domain, average of the standard deviation values for body angular velocity signals on the Y axis.                            |numeric |[-1, 1] |
|avg-fBodyGyro-std()-Z       |Frequency domain, average of the standard deviation values for body angular velocity signals on the Z axis.                            |numeric |[-1, 1] |
|avg-fBodyAccMag-mean()      |Frequency domain, average of the mean values for body accelaration signals magnitude on the Z axis.                                    |numeric |[-1, 1] |
|avg-fBodyAccMag-std()       |Frequency domain, average of the standard deviation values for body accelaration signals magnitude on the Z axis.                      |numeric |[-1, 1] |
|avg-fBodyAccJerkMag-mean()  |Frequency domain, average of the mean values for body accelaration jerk signals magnitude on the Z axis.                               |numeric |[-1, 1] |
|avg-fBodyAccJerkMag-std()   |Frequency domain, average of the standard deviation values for body accelaration jerk signals magnitude on the Z axis.                 |numeric |[-1, 1] |
|avg-fBodyGyroMag-mean()     |Frequency domain, average of the mean values for body angular velocity signals magnitude on the Z axis.                                |numeric |[-1, 1] |
|avg-fBodyGyroMag-std()      |Frequency domain, average of the standard deviation values for body angular velocity signals magnitude on the Z axis.                  |numeric |[-1, 1] |
|avg-fBodyGyroJerkMag-mean() |Frequency domain, average of the mean values for body angular velocity jerk signals magnitude on the Z axis.                           |numeric |[-1, 1] |
|avg-fBodyGyroJerkMag-std()  |Frequency domain, average of the standard deviation values for body angular velocity jerk signals magnitude on the Z axis.             |numeric |[-1, 1] |

