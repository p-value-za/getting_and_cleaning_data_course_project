
# Checks whether the folder "UCI HAR Dataset" exists in the working directory
message("Checking working directory for folder 'UCI HAR Dataset'")

if (!dir.exits("UCI HAR Dataset")) {
        # download file from the web if directory does not exist
        data_url <- paste0("https://d396qusza40orc.cloudfront.net/",
                   "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
        download.file(data_url, "data.zip", method = "curl")
        
        # Creates a download log (download_log.txt) 
        # storing the url and date that the data was downloaded
        log_con <- file("download_log.txt")
        writeLines(c("Data downloaded from: ", data_url,
                     "Date: ", date()), log_con)
        close(log_con)
        
        # Extracts the files from the downloaded zipped folder
        unzip("data.zip")
} else {
        message("Data files already downloaded to folder 'UCI HAR Dataset'")
}

