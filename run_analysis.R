library(plyr)
library(dplyr)

# 1-Merging the training and the test sets to create one dataset.

# Read the given data from the *.txt files

activityLabels <- read.table('activity_labels.txt', header = FALSE)
features <- read.table('features.txt', header = FALSE)

subjectTrain = read.table('subject_train.txt', header = FALSE)
xTrain <- read.table('X_train.txt', header = FALSE)
yTrain <- read.table('y_train.txt', header = FALSE)

subjectTest <- read.table('subject_test.txt', header = FALSE)
xTest <- read.table('X_test.txt', header = FALSE)
yTest <- read.table('y_test.txt', header = FALSE)

# Assign column names do the data

colnames(activityLabels) <- c("activityId", "activityName")

colnames(subjectTrain) <- "subjectId"
colnames(xTrain) <- features[,2]
colnames(yTrain) <- "activityId"

colnames(subjectTest) <- "subjectId"
colnames(xTest) <- features[,2]
colnames(yTest) <- "activityId"

# Merge the training and test data

trainingData <- cbind(subjectTrain, yTrain, xTrain)
testData <- cbind(subjectTest, yTest, xTest)

mergedData <- rbind(trainingData, testData)

# 2-Extract the measurements on the mean and standard deviation.

measurements <- mergedData[,grep("(-(mean|std)\\(\\))|subjectId|activityId", names(mergedData))]

# 3-Use descriptive activity names to name the activities.

finalData <- merge(measurements, activityLabels, by = "activityId")

# 4-Label the data set with descriptive label names.

names(finalData) <- gsub("^t","time", names(finalData))
names(finalData) <- gsub("^f","frequency", names(finalData))
names(finalData) <- gsub("Acc","Acceleration", names(finalData))
names(finalData) <- gsub("Gyro","Gyroscope", names(finalData))
names(finalData) <- gsub("Mag","Magnitude", names(finalData))
names(finalData) <- gsub("BodyBody","Body", names(finalData))

# 5-Create another data set with the average of each variable for each activity and each subject.

averagesData <- ddply(finalData, .(subjectId, activityId, activityName), function(x) colMeans(x[,3:68]))

write.table(averagesData, file = "averagesData.txt", row.name=FALSE)