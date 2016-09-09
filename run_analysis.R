#1) Merges the training and the test sets to create one data set.
#2) Extracts only the measurements on the mean and standard deviation for each measurement.
#3) Uses descriptive activity names to name the activities in the data set
#4) Appropriately labels the data set with descriptive variable names.
#5) From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

library(plyr)
library(data.table)
# get the data
dir = "UCI HAR Dataset"
if(!file.exists(dir)){
  print("Downloading and unzipping  the data...")
  dir.create(dir)
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url,destfile="data.zip")
  unzip(zipfile="data.zip",exdir=dir)
}

features <- read.table(file.path(dir, "features.txt"))
activities <- read.table(file.path(dir, "activity_labels.txt"))

# load the data
train_actv <- read.table(file.path(dir,"train/y_train.txt"))
train_feat <- read.table(file.path(dir,"train/X_train.txt"))
train_subj <- read.table(file.path(dir,"/train/subject_train.txt"))
test_actv <- read.table(file.path(dir,"/test/y_test.txt"))
test_feat <- read.table(file.path(dir,"/test/X_test.txt"))
test_subj <- read.table(file.path(dir,"/test/subject_test.txt"))

# Step 1
# Merge train and test sets to create one data set
feat <- rbind(train_feat, test_feat) 
actv <- rbind(train_actv, test_actv) 
subj <- rbind(train_subj, test_subj) 


# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
names(feat) <- features$V2
mean_std_feat <- features$V2[grep("-(mean|std)\\(\\)", features$V2)]
#subset <- subset(data,select = as.character(mean_std_feat))
feat_subset <- subset(feat,select = as.character(mean_std_feat))

# Step 3
# Use descriptive activity names to name the activities in the data set
# set the column names
names(actv) <- "activity"  

# rename the enumerated ativities with real names
actv[,1] <- activites[actv[,1],2]

# Step 4
# Appropriately label the data set with descriptive variable names
names(subj) <- "subject" 
names(feat_subset)<-gsub("^t", "Time", names(feat_subset))
names(feat_subset)<-gsub("^f", "Frequency", names(feat_subset))
names(feat_subset)<-gsub("Mag", "Magnitude", names(feat_subset))
names(feat_subset)<-gsub("BodyBody", "Body", names(feat_subset))



data <- cbind(feat_subset,subj, actv)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

tidy_avg_data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidy_avg_data, file = "tidy_avg_data.txt", row.name=FALSE)
  
library(knitr)
knit2html("codebook.Rmd")
knit("example.Rmd")  # produces the md file


