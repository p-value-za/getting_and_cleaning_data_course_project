###############################################################################
## R script to 



## Prerequisite: this script assumes the data set has already been downloaded
## and unzipped in the working directory 
## If the data is still to be downloaded, please run the script 'get_data.R'
## found in the repository

## This script makes use of the 'dplyr' package
## Check to see whether the 'dplyr' package is installed
## If not, install
if("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("dplyr")
}

## Load the 'dplyr' package
library(dplyr)


###############################################################################
#       Pre-step: Extract the data from disk into data frames                 #
###############################################################################

## Create a vector of the data file names to be loaded 
## as a batch using read.table()
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

## Read in the data in list as a batch using read.table()
data_set <- lapply(file_list, read.table,
                   stringsAsFactors = FALSE)


###############################################################################
##      Step 1: Merge the training and test sets into one data set           ##
###############################################################################

## Bind the training data set by column and bind the test set by column
## then bind the two data frames created by rows
merged_data <- 
    rbind(
        cbind(data_set$subject_train, data_set$y_train, data_set$x_train),
        cbind(data_set$subject_test, data_set$y_test, data_set$x_test)
        )

###############################################################################
##      Step 2: Extract only the measurements on the mean                    ##
##              and standard deviation for each measurement                  ##
###############################################################################

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

###############################################################################
##      Step 3: Use descriptive activity names to name                       ##
##              the activities in the data set                               ##
###############################################################################

## Replace the activity values with a factor based on levels and labels
## contained in the 'acivity_labels" data frame
target_data[, 2] <- factor(target_data[, 2],
                           levels = data_set$activity_labels[, 1],
                           labels = data_set$activity_labels[, 2])

###############################################################################
##      Step 4: Appropriately label the data set with descriptive            ##
##              variable names                                               ##
###############################################################################

## Extract the variable names from the 'features' data frame matching
## the indices from step 2
desc_var_names <- data_set$features[features_index, 2]

## Fix a typo in the features data frame where the word body is repeated
## in some instances in the variable description
desc_var_names <- gsub("BodyBody", "Body", desc_var_names)

## Create a tidy data frame with the descriptive labels
tidy_data <- target_data
names(tidy_data) <- c("subject", "activity", desc_var_names)

###############################################################################
##  Step 5: From the data in step 4, create a second, independent tidy data  ##
##  set with the average of each variable for each activity and each subject ##
###############################################################################

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

###############################################################################
#                       Produce the Code Book                                 #
###############################################################################
source("CodeBook.Rmd")
knitr::knit("CodeBook.Rmd")