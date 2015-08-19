# ReadMe

# Dataset download:

Before we can start you have to download the dataset (ZIP) from the [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
Once you download the data you unzip the data and rename the folder to *data*. This folder should be in the same directory as run_analysis.R script.

## Running the script:

Once we have dataset ready you can run the *run_analysis.R* script. This will clean data and will perform the following steps:

1. First we import the train and test data that are stored in several files (data, activity, subject)
2. Then we group all the data by columns separately for train and test data (e.g. X_train, y_train, subject_train). Once we have this done we can group both data sets, train and test by rows.
3. Now that we have all data ready, we can extract only the measurements on the mean and standard deviation for each measurement. Here we use feature.txt file.
4. In the next step we use activity_labels.txt file to change labels (activites) from the integer value to a more descriptive activity name.
5. In the next step we use descriptive variable names stored in the features.txt to replace artificial variable names.
6. We create a cleaned data set and store it to the file: tidy_data.txt.
7. We use the dataset from the step 6 to create a second, independent tidy data set with the average of each variable for each activity and each subject. Its is stored in the file: tidy_data_var_means.txt

With this the data are ready to be used for further analyses. For explanation of all the variables please look at the CodeBook.