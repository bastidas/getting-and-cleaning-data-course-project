
#The Data

In the training folder "X_train.txt" is the training set data and "y_train.txt" are the labels for this data.

*test/subject_test.txt
*test/X_test.txt
*test/y_test.txt
*train/subject_train.txt
*train/X_train.txt
*train/y_train.txt

.*Detailed names of the variables come from "UCI HAR Dataset/features.txt" and have names for variables such as "tBodyAcc-mean" and dozens more. In the tidying names have been expanded for clairity for example the above name becoms "tBodyAcc-mean".

.*Levels of Varible Activity come from "UCI HAR Dataset/activity_labels.txt" and include: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) which correspond to an enumeration [1,2,3,4...]

# The Process
The script run_analysis.R does the following actions:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.













