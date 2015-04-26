## General Information

Human Activity Recognition Using Smartphones Dataset
Version 1.0

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we 
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into 
two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition 
on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or 
their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012. 


## Preparing the tidy data set


### Merging the training and the test sets to create one dataset:

The **subject_train.txt, X_train.txt, y_train.txt** files were merged to create one data set called **traininData**.

The **subject_test.txt, X_test.txt, y_test.txt** files were merged to create onde data set called **testData**.

The two data sets were merged in the **mergedData** file.

The columns in the data sets weres labelled using the information in **activity_labels.txt** file.


### Extracting the measurements on the mean and standard deviation

The mean and standard deviation measurements are obtained using the **mergedData** data set by identifying the 
columns with the *mean* and *std* strings.


### Using descriptive activity names to name the activities and label the data set with descriptive label names

Descriptive names were included in the data set using the values in the **activity_labels.txt** file.
The data set was labeled with more descriptive names using the information given in the **README.txt** 
and **features_info.txt** files.


### Creating another data set with the average of each variable for each activity and each subject

Finnally an **averagesData** data set was created with the average for each variable.

The dplyr and plyr libraries were used for some of the steps.

