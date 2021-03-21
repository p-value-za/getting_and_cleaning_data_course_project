Getting and Cleaning Data Course Project
================

-   [Purpose of this repository](#purpose-of-this-repository)
    -   [Files contained in this
        repository](#files-contained-in-this-repository)
-   [Source of the data used to create the ‘tidy\_data\_summary’
    set](#source-of-the-data-used-to-create-the-tidy_data_summary-set)
-   [Reading the tidy data set into
    R](#reading-the-tidy-data-set-into-r)
-   [Detailed description of the scripts and the process they use to
    clean the data and produce the tidy data
    set](#detailed-description-of-the-scripts-and-the-process-they-use-to-clean-the-data-and-produce-the-tidy-data-set)
    -   [1. get\_data.R](#1-get_datar)
    -   [2. run\_analysis.R](#2-run_analysisr)
-   [Information on how the raw data was
    collected](#information-on-how-the-raw-data-was-collected)
-   [Reproducing the
    ’tidy\_data\_summary](#reproducing-the-tidy_data_summary)
    -   [Libraries used by the script](#libraries-used-by-the-script)
-   [Data source licence](#data-source-licence)

# Purpose of this repository

The aim of this project is to collect and clean a data set, and produce
a tidy data set that can be used for later analysis.

This repository contains the scripts used to get and extract the data
from the “Human Activity Recognition Using Smartphones Dataset” and
generate a tidy data text file that meets the principles of tidy data.

## Files contained in this repository

-   [CodeBook.md](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/master/CodeBook.md)
    : contains the specific description of the tidy data file contents.
-   [tidy\_data\_summary.txt](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/master/tidy_data_summary.txt)
    : the tidy data set produced by the ‘run\_analysis.r’ script
-   [run\_analysis.R](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/master/run_analysis.R)
    : the script that extracts and processes the data, and produces the
    tidy data text file that meets the principles of tidy data
-   [get\_data.R](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/master/get_data.R)
    : downloads and extracts the data into the working directory
-   [download\_log.txt](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/master/tidy_data_summary.txt)
    : log file produced by ‘get\_data.R’ script

# Source of the data used to create the ‘tidy\_data\_summary’ set

The ‘tidy\_data\_summary’ data set was created from the following data
set:

    ==================================================================
    Human Activity Recognition Using Smartphones Dataset
    Version 1.0
    ==================================================================
    Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
    Smartlab - Non Linear Complex Systems Laboratory
    DITEN - Universit? degli Studi di Genova.
    Via Opera Pia 11A, I-16145, Genoa, Italy.
    activityrecognition@smartlab.ws
    www.smartlab.ws
    ==================================================================

The data can be accessed from the url:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

A full description is available at the site where the data was obtained:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

# Reading the tidy data set into R

To read the tidy data set into R, please copy the following in to the R
console:

``` r
address <- "https://coursera-assessments.s3.amazonaws.com/assessments/1616335849931/982c86ea-01be-42d4-b493-65e1a5a69faa/tidy_data_summary.txt"
data <- read.table(url(address), header = TRUE)
View(data)
```

# Detailed description of the scripts and the process they use to clean the data and produce the tidy data set

## 1. [get\_data.R](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/master/get_data.R)

This script is used to download the data and unzip the folder ‘UCI HAR
Dataset’ into the working directory.

It begins by checking whether the ‘UCI HAR Dataset’ exists in the
working directory. If not, it proceeds to download the ‘Dataset.zip’ zip
file into the working directory. It then unzips the ‘Dataset.zip’ zip
file and produces the ‘UCI HAR Dataset’ in the working directory.

It also produces a [download log text
file](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/master/download_log.txt)
that contains the url downloaded from as well as a time and date stamp.

The ‘UCI DAR Dataset’ folder contains the following files and folders:

    activity_labels.txt
    features_info.txt
    features.txt
    README.txt
    test
    train

    Contents of the 'train' folder:
    Inertial Signals
    subject_train.txt
    X_train.txt
    y_train.txt

    Contents of the 'test' folder:
    Inertial Signals
    subject_test.txt
    X_test.txt
    y_test.txt

## 2. [run\_analysis.R](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/master/run_analysis.R)

This script assumes the data is already downloaded and available in the
working directory.

The script makes use of the ‘dply’ package. It begins by checking
whether the ‘dplyr’ package is installed. If not, it proceeds to install
the package. Then continues to load the package into the library.

**The data is extracted from each text file containing the required data
to a list of data frames.**

``` r
file_list <- c(
        activity_labels = "UCI HAR Dataset/activity_labels.txt",
        features = "UCI HAR Dataset/features.txt",
        subject_test = "UCI HAR Dataset/test/subject_test.txt",
        x_test = "UCI HAR Dataset/test/X_test.txt",
        y_test = "UCI HAR Dataset/test/y_test.txt",
        subject_train = "UCI HAR Dataset/train/subject_train.txt",
        x_train = "UCI HAR Dataset/train/X_train.txt",
        y_train = "UCI HAR Dataset/train/y_train.txt"
)
data_set <- lapply(file_list, read.table,
                   stringsAsFactors = FALSE)
```

**The training and test sets are merged into one data set**

``` r
## Bind the training data set by column and bind the test set by column
## then bind the two data frames created by rows
merged_data <- 
    rbind(
        cbind(data_set$subject_train, data_set$y_train, data_set$x_train),
        cbind(data_set$subject_test, data_set$y_test, data_set$x_test)
        )
```

**The measurements on the mean standard deviation are extracted**

``` r
## Find the indices from the feature data frame matching the mean 
## and standard deviation measurements
features_index <- grep("mean\\(\\)|std\\(\\)", data_set$features[, 2])
## grep applied to the second column which contains the names of the
## measurements

## Create a vector of variables/columns corresponding to 'features_index' 
## from the merged_data data frame adjusting for the first two columns, 
## subject and activity, added when the data frames were bound
merged_data_variables <- c(1, 2, features_index + 2)

## Extract the target data and create the target data frame
target_data <- merged_data[, merged_data_variables]
```

**Descriptive names from the ‘activity\_labels’ data frame are used to
name the activities**

``` r
## Replace the activity values with a factor based on levels and labels
## contained in the 'acivity_labels" data frame
target_data[, 2] <- factor(target_data[, 2],
                           levels = data_set$activity_labels[, 1],
                           labels = data_set$activity_labels[, 2])
```

**The data set is labelled with descriptive variable names**

``` r
## Extract the variable names from the 'features' data frame matching
## the indices from step 2
desc_var_names <- data_set$features[features_index, 2]

## Fix a typo in the features data frame where the word body is repeated
## in some instances in the variable description
desc_var_names <- gsub("BodyBody", "Body", desc_var_names)

## Create a tidy data frame with the descriptive labels
tidy_data <- target_data
names(tidy_data) <- c("subject", "activity", desc_var_names)
```

**From the data in step 4, a second, independent tidy data set with the
average of each variable for each activity and subject is created**

``` r
## Group the data by activity and subject and find the mean for each group
tidy_data_summary <- 
    tidy_data %>% 
    group_by(activity, subject) %>% 
    summarise(across(.cols = everything(), .fns = mean)) %>% 
    ungroup()

# Rename the variables of the new data frame with new descriptive names
# A prefix "avg-" will be added to each variable name, except activity and subject
tidy_data_summary_names <- 
    c(names(tidy_data_summary[c(1, 2)]),
      paste0("avg-", names(tidy_data_summary[- c(1, 2)])))
names(tidy_data_summary) <- tidy_data_summary_names

# Create a text file with the data set
write.table(tidy_data_summary, "tidy_data_summary.txt", row.names = FALSE)
```

This produces the ‘tidy\_data-summary.txt’ that meets the principles of
tidy data: Each variable forms a column. - Each observation forms a row.
- Each type of observational unit forms a table. (Wickham, Hadley, 2014.
“Tidy Data,” Journal of Statistical Software, Foundation for Open Access
Statistics, vol. 59(i10)

This script also produces and updates the code book for this data set.

``` r
source("CodeBook.Rmd")
knitr::knit("CodeBook.Rmd")
```

# Information on how the raw data was collected

#### The data was produced as explained in the ‘README.txt’ file found in the original data set:

    The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

    The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

    For each record it is provided:
    ======================================

    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    - Triaxial Angular velocity from the gyroscope. 
    - A 561-feature vector with time and frequency domain variables. 
    - Its activity label. 
    - An identifier of the subject who carried out the experiment.

    Notes: 
    ======
    - Features are normalized and bounded within [-1,1].
    - Each feature vector is a row on the text file.

# Reproducing the ’tidy\_data\_summary

All scripts required to reproduce the ‘tidy\_data\_summary’ data set are
available at the following GitHub repository:
<https://github.com/p-value-za/getting_and_cleaning_data_course_project>

-   the data set used to create the ‘tidy\_data\_summary’ was downloaded
    using the
    [get\_data.r](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/0130cb75eaec78da0db5594397b70982a3658690/get_data.R)
    script from:
    <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>,
    Sat Mar 13 11:40:21 2021
-   the data was then processed using the
    [run\_analysis.R](https://github.com/p-value-za/getting_and_cleaning_data_course_project/blob/0130cb75eaec78da0db5594397b70982a3658690/run_analysis.R)
    script
-   the following system and package versions were used:

<!-- -->

                   _                           
    platform       x86_64-apple-darwin17.0     
    arch           x86_64                      
    os             darwin17.0                  
    system         x86_64, darwin17.0          
    status                                     
    major          4                           
    minor          0.4                         
    year           2021                        
    month          02                          
    day            15                          
    svn rev        80002                       
    language       R                           
    version.string R version 4.0.4 (2021-02-15)
    nickname       Lost Library Book           

    RStudio Version 1.4.1103 © 2009-2021 RStudio, PBC

### Libraries used by the script

    dplyr A Grammar of Data Manipulation 1.0.5 MIT + file LICENSE https://dplyr.tidyverse.org, https://github.com/tidyverse/dplyr

# Data source licence

    [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



    This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.



    Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
