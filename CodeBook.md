The Code Book for the ‘tidy\_data\_symmary’ data set
================

-   [Information on the ‘tidy\_data\_summary’ data
    set](#information-on-the-tidy_data_summary-data-set)
    -   [The process by which the ‘tidy\_data\_summary’ data set was
        created and
        tidied](#the-process-by-which-the-tidy_data_summary-data-set-was-created-and-tidied)
    -   [Missing Values](#missing-values)
    -   [Description of the ‘tidy\_data\_summary’
        contents](#description-of-the-tidy_data_summary-contents)
        -   [Table Layout](#table-layout)
        -   [Table Data Contents](#table-data-contents)
    -   [Description of the variables](#description-of-the-variables)
        -   [Table showing detailed description of
            variables](#table-showing-detailed-description-of-variables)
-   [Description of the features on which the average values were
    based](#description-of-the-features-on-which-the-average-values-were-based)

# Information on the ‘tidy\_data\_summary’ data set

The ‘tidy\_data\_summary’ is summary of the “Human Activity Recognition
Using Smartphones” data set.

It shows the calculated average values of the mean- and the standard
deviation measurements extracted from the “Human Activity Recognition
Using Smartphones” data set in a tabular representation.

## The process by which the ‘tidy\_data\_summary’ data set was created and tidied

The script
[run\_analysis.R](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/0130cb75eaec78da0db5594397b70982a3658690/run_analysis.R)
was used to create the ‘tidy\_data\_summary’ set. The process followed
is outlined below:

**1. The training and test sets were merged to create a singular data
set:**

        The following files form the test set were bound by column to each another:   
            /test/subject_test.txt
            /test/X_test.txt
            /test/y_test.txt
        creating a table comprised of the subject, activity, and feature values from the test set.
            
        The following files from the training set were bound by column to each other:
            /train/subject_train.txt
            /train/X_train.txt
            /train/y_train.txt
        creating a table comprised of the subject, activity, and feature values from the training set.
        
        The above two sets were then bound by row to each other, creating a singular data set.
        

**2. The measurements on the mean and standard deviation were
extracted:**

        The singular data set was then subset to only include those feature measurements on either the
        mean or the standard deviation.
        

**3. Descriptive activity names were used to name the activities in the
data set:**

        The data from the 'activity' variable, intially containing integers ranging from 1 to six were
        replaced by a factor based on the labels and levels contained in the 'activity_labels.txt' file.
        

**4. The data set was labelled with the appropriate descriptive names:**

        The appropriate names for the data extracted in step 2 were extracted from the 'features.txt' file and used as the names of the variables of the data set.
        

**5. From the data created in step 4, and independent data set was
created with the average of each variable for each activity and each
subject**

        The dataset created in step 4 for was grouped by activity, then by subject.
        The mean for each feature measurement was calculated per each group.
        A new data set was then created showing these mean values for each activity and subject.
        

The data is considered to be tidy at this stage, since, by the
definition of tidy data: <br> - Each variable forms a column.<br> - Each
observation forms a row.<br> - Each type of observational unit forms a
table.<br> (Wickham, Hadley, 2014. “Tidy Data,” Journal of Statistical
Software, Foundation for Open Access Statistics, vol. 59(i10)

## Missing Values

There were no missing values present in the data set

``` r
sum(is.na(tidy_data_summary))
```

    [1] 0

## Description of the ‘tidy\_data\_summary’ contents

### Table Layout

The ‘tidy\_data\_summary’ data set is a table of tidy data in a wide
form with 180 observations across 68 columns.

The first column of the table lists the activity performed. The activity
can be either one of six activities that made up the experiment.

The second column lists the subject who performed the activity. The
subject value ranges from 1 to 30, being the total number of
participants in the experiment.

The sixty-six columns following the the activity and subject columns are
the sixty-six extracted feature measurements that are either a either a
measure of the mean or the standard deviation, whose values have been
averaged.

### Table Data Contents

The table is populated with the observations of the average value for
each of the sixty-six feature measurements uniquely identified by each
combination of activity and subject.

The mean and standard deviation measurements were calculated on the body
acceleration signals, gravity acceleration signals, angular velocity
signals, and jerk signals on body acceleration and angular velocity
signals derived from the triaxial raw signals of the accelerometer and
gyroscope of the Samsung Galaxy S II sensor.

Each field in the table for each of the sixty-six measured variables is
the average of the normalised value of either the mean or standard
deviation calculation of either the body linear acceleration, angular
velocity, jerk signals on the body linear acceleration, or jerk signals
on the angular velocity in either the time or frequency domain on either
the x-, y-, or z-axis, for the activity performed by the subject.

Features are normalised and bounded within \[-1, 1\].

For a full description of the feature selection on which the averages
were based please refer to the section:<br> [Description of the features
on which the average values were
based](#description-of-the-features-on-which-the-average-values-were-based)

## Description of the variables

The sixty-six measurement variables have meaningful names. They are
named according to what signal they measure. The names are comprised in
the following way:

| domain                 | acceleration               | measure                          | jerk              | axis      |
|------------------------|----------------------------|----------------------------------|-------------------|-----------|
| t: indicates time      | Body: indicates body       | Acc: indicates acceleration      | jerk: jerk signal | X: X-axis |
| f: indicates frequency | Gravity: indicates gravity | Gyro: indicates angular velocity | –                 | Y: Y-axis |
| –                      | –                          | –                                | –                 | Z: Z-axis |

In the table that follows each variable is described in detail.

### Table showing detailed description of variables

<table>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
Variable Name
</th>
<th style="text-align:left;">
Variable Label
</th>
<th style="text-align:left;">
Type
</th>
<th style="text-align:left;">
Range
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
activity
</td>
<td style="text-align:left;">
Identifies the activity performed.<br>Value Labels:<br>1. WALKING<br>2.
WALKING_UPSTAIRS<br>3. WALKING_DOWNSTAIRS<br>4. SITTING<br>5.
STANDING<br>6. LAYING
</td>
<td style="text-align:left;">
factor
</td>
<td style="text-align:left;">
1 - 6
</td>
</tr>
<tr>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
subject
</td>
<td style="text-align:left;">
Identifies the subject who performed the activity
</td>
<td style="text-align:left;">
integer
</td>
<td style="text-align:left;">
1 - 30
</td>
</tr>
<tr>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
avg-tBodyAcc-mean()-X
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body accelaration signals on
the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
avg-tBodyAcc-mean()-Y
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body accelaration signals on
the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
avg-tBodyAcc-mean()-Z
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body accelaration signals on
the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
6
</td>
<td style="text-align:left;">
avg-tBodyAcc-std()-X
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body
accelaration signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
avg-tBodyAcc-std()-Y
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body
accelaration signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
avg-tBodyAcc-std()-Z
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body
accelaration signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
9
</td>
<td style="text-align:left;">
avg-tGravityAcc-mean()-X
</td>
<td style="text-align:left;">
Time domain, average of the mean values for gravity accelaration signals
on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
10
</td>
<td style="text-align:left;">
avg-tGravityAcc-mean()-Y
</td>
<td style="text-align:left;">
Time domain, average of the mean values for gravity accelaration signals
on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
11
</td>
<td style="text-align:left;">
avg-tGravityAcc-mean()-Z
</td>
<td style="text-align:left;">
Time domain, average of the mean values for gravity accelaration signals
on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
12
</td>
<td style="text-align:left;">
avg-tGravityAcc-std()-X
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for gravity
accelaration signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
avg-tGravityAcc-std()-Y
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for gravity
accelaration signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
14
</td>
<td style="text-align:left;">
avg-tGravityAcc-std()-Z
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for gravity
accelaration signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
15
</td>
<td style="text-align:left;">
avg-tBodyAccJerk-mean()-X
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body accelaration jerk
signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
16
</td>
<td style="text-align:left;">
avg-tBodyAccJerk-mean()-Y
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body accelaration jerk
signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
17
</td>
<td style="text-align:left;">
avg-tBodyAccJerk-mean()-Z
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body accelaration jerk
signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
avg-tBodyAccJerk-std()-X
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body
accelaration jerk signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
19
</td>
<td style="text-align:left;">
avg-tBodyAccJerk-std()-Y
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body
accelaration jerk signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
20
</td>
<td style="text-align:left;">
avg-tBodyAccJerk-std()-Z
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body
accelaration jerk signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
21
</td>
<td style="text-align:left;">
avg-tBodyGyro-mean()-X
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body angular velocity
signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
22
</td>
<td style="text-align:left;">
avg-tBodyGyro-mean()-Y
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body angular velocity
signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
23
</td>
<td style="text-align:left;">
avg-tBodyGyro-mean()-Z
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body angular velocity
signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
24
</td>
<td style="text-align:left;">
avg-tBodyGyro-std()-X
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body angular
velocity signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
25
</td>
<td style="text-align:left;">
avg-tBodyGyro-std()-Y
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body angular
velocity signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
26
</td>
<td style="text-align:left;">
avg-tBodyGyro-std()-Z
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body angular
velocity signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
27
</td>
<td style="text-align:left;">
avg-tBodyGyroJerk-mean()-X
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body angular velocity jerk
signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
28
</td>
<td style="text-align:left;">
avg-tBodyGyroJerk-mean()-Y
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body angular velocity jerk
signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
29
</td>
<td style="text-align:left;">
avg-tBodyGyroJerk-mean()-Z
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body angular velocity jerk
signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
30
</td>
<td style="text-align:left;">
avg-tBodyGyroJerk-std()-X
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body angular
velocity jerk signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
31
</td>
<td style="text-align:left;">
avg-tBodyGyroJerk-std()-Y
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body angular
velocity jerk signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
32
</td>
<td style="text-align:left;">
avg-tBodyGyroJerk-std()-Z
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body angular
velocity jerk signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
33
</td>
<td style="text-align:left;">
avg-tBodyAccMag-mean()
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body accelaration signals
magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
34
</td>
<td style="text-align:left;">
avg-tBodyAccMag-std()
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body
accelaration signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
35
</td>
<td style="text-align:left;">
avg-tGravityAccMag-mean()
</td>
<td style="text-align:left;">
Time domain, average of the mean values for gravity accelaration signals
magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
36
</td>
<td style="text-align:left;">
avg-tGravityAccMag-std()
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for gravity
accelaration signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
37
</td>
<td style="text-align:left;">
avg-tBodyAccJerkMag-mean()
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body accelaration jerk
signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
38
</td>
<td style="text-align:left;">
avg-tBodyAccJerkMag-std()
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body
accelaration jerk signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
39
</td>
<td style="text-align:left;">
avg-tBodyGyroMag-mean()
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body angular velocity
signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
40
</td>
<td style="text-align:left;">
avg-tBodyGyroMag-std()
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body angular
velocity signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
41
</td>
<td style="text-align:left;">
avg-tBodyGyroJerkMag-mean()
</td>
<td style="text-align:left;">
Time domain, average of the mean values for body angular velocity jerk
signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
42
</td>
<td style="text-align:left;">
avg-tBodyGyroJerkMag-std()
</td>
<td style="text-align:left;">
Time domain, average of the standard deviation values for body angular
velocity jerk signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
43
</td>
<td style="text-align:left;">
avg-fBodyAcc-mean()-X
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body accelaration
signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
44
</td>
<td style="text-align:left;">
avg-fBodyAcc-mean()-Y
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body accelaration
signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
45
</td>
<td style="text-align:left;">
avg-fBodyAcc-mean()-Z
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body accelaration
signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
46
</td>
<td style="text-align:left;">
avg-fBodyAcc-std()-X
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
accelaration signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
47
</td>
<td style="text-align:left;">
avg-fBodyAcc-std()-Y
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
accelaration signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
48
</td>
<td style="text-align:left;">
avg-fBodyAcc-std()-Z
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
accelaration signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
49
</td>
<td style="text-align:left;">
avg-fBodyAccJerk-mean()-X
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body accelaration jerk
signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
50
</td>
<td style="text-align:left;">
avg-fBodyAccJerk-mean()-Y
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body accelaration jerk
signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
51
</td>
<td style="text-align:left;">
avg-fBodyAccJerk-mean()-Z
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body accelaration jerk
signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
52
</td>
<td style="text-align:left;">
avg-fBodyAccJerk-std()-X
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
accelaration jerk signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
53
</td>
<td style="text-align:left;">
avg-fBodyAccJerk-std()-Y
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
accelaration jerk signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
54
</td>
<td style="text-align:left;">
avg-fBodyAccJerk-std()-Z
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
accelaration jerk signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
55
</td>
<td style="text-align:left;">
avg-fBodyGyro-mean()-X
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body angular velocity
signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
56
</td>
<td style="text-align:left;">
avg-fBodyGyro-mean()-Y
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body angular velocity
signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
57
</td>
<td style="text-align:left;">
avg-fBodyGyro-mean()-Z
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body angular velocity
signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
58
</td>
<td style="text-align:left;">
avg-fBodyGyro-std()-X
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
angular velocity signals on the X axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
59
</td>
<td style="text-align:left;">
avg-fBodyGyro-std()-Y
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
angular velocity signals on the Y axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
60
</td>
<td style="text-align:left;">
avg-fBodyGyro-std()-Z
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
angular velocity signals on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
61
</td>
<td style="text-align:left;">
avg-fBodyAccMag-mean()
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body accelaration
signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
62
</td>
<td style="text-align:left;">
avg-fBodyAccMag-std()
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
accelaration signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
63
</td>
<td style="text-align:left;">
avg-fBodyAccJerkMag-mean()
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body accelaration jerk
signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
64
</td>
<td style="text-align:left;">
avg-fBodyAccJerkMag-std()
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
accelaration jerk signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
65
</td>
<td style="text-align:left;">
avg-fBodyGyroMag-mean()
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body angular velocity
signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
66
</td>
<td style="text-align:left;">
avg-fBodyGyroMag-std()
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
angular velocity signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
67
</td>
<td style="text-align:left;">
avg-fBodyGyroJerkMag-mean()
</td>
<td style="text-align:left;">
Frequency domain, average of the mean values for body angular velocity
jerk signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
<tr>
<td style="text-align:left;">
68
</td>
<td style="text-align:left;">
avg-fBodyGyroJerkMag-std()
</td>
<td style="text-align:left;">
Frequency domain, average of the standard deviation values for body
angular velocity jerk signals magnitude on the Z axis.
</td>
<td style="text-align:left;">
numeric
</td>
<td style="text-align:left;">
[-1, 1]
</td>
</tr>
</tbody>
</table>

# Description of the features on which the average values were based

#### The selected features were produced as explained in the ‘features\_info.txt’ file found in the original data set:

    Feature Selection 

    =================


    The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 



    Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 



    Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 



    These signals were used to estimate variables of the feature vector for each pattern:  

    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


    tBodyAcc-XYZ

    tGravityAcc-XYZ

    tBodyAccJerk-XYZ

    tBodyGyro-XYZ

    tBodyGyroJerk-XYZ

    tBodyAccMag
    tGravityAccMag

    tBodyAccJerkMag

    tBodyGyroMag

    tBodyGyroJerkMag

    fBodyAcc-XYZ

    fBodyAccJerk-XYZ

    fBodyGyro-XYZ
    fBodyAccMag

    fBodyAccJerkMag

    fBodyGyroMag

    fBodyGyroJerkMag


    The set of variables that were estimated from these signals are: 


    mean(): Mean value

    std(): Standard deviation

    mad(): Median absolute deviation 

    max(): Largest value in array

    min(): Smallest value in array

    sma(): Signal magnitude area

    energy(): Energy measure. Sum of the squares divided by the number of values. 

    iqr(): Interquartile range 

    entropy(): Signal entropy

    arCoeff(): Autorregresion coefficients with Burg order equal to 4

    correlation(): correlation coefficient between two signals

    maxInds(): index of the frequency component with largest magnitude

    meanFreq(): Weighted average of the frequency components to obtain a mean frequency

    skewness(): skewness of the frequency domain signal 

    kurtosis(): kurtosis of the frequency domain signal 

    bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

    angle(): Angle between to vectors.



    Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:


    gravityMean
    tBodyAccMean

    tBodyAccJerkMean

    tBodyGyroMean

    tBodyGyroJerkMean


    The complete list of variables of each feature vector is available in 'features.txt'
