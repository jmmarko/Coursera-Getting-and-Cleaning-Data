# Load data
# train data
trainData <- read.table("data/train/X_train.txt")
trainActivity <- read.table("data/train/y_train.txt")
trainSubjects <- read.table("data/train/subject_train.txt")

# test data
testData <- read.table("data/test/X_test.txt")
testActivity <- read.table("data/test/y_test.txt")
testSubjects <- read.table("data/test/subject_test.txt")

# 1. Merges the training and the test sets to create one data set.
train <- cbind(trainData, trainActivity, trainSubjects)
test <- cbind(testData, testActivity, testSubjects)
data <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("data/features.txt")
meanStdCols <- grep("mean\\(\\)|std\\(\\)", features[, 2])
data <- data[, c(meanStdCols, 562, 563)]

# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("./data/activity_labels.txt")
activities[, 2] <- tolower(gsub("_", "", activities[, 2]))
data$V1.1 <- activities[data$V1.1, 2]
 
# 4. Appropriately labels the data set with descriptive variable names. 
colnames(data) <- c(as.vector(features[meanStdCols, 2]), "Activity", "Subject")
names(data) <- gsub("\\(\\)", "", names(data))
names(data) <- tolower(names(data))

write.table(data, "tidy_data.txt") # write out the 1st dataset

# 5. From the data set in step 4, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.

aggregatedData <- aggregate(data[, 1:66], by=list(activity = data$activity, subject = data$subject), mean)
write.table(data, "tidy_data_var_means.txt")


