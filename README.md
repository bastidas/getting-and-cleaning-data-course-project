#Getting and Cleaning Data - Week 5 Course Project

This is the Week 5 Course Project that reduces and tidys data from smart phone accelerometers. 

#The Data

The data is [available here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) with a full [description of the data here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


#A Note About Subjectivy

The project is open ended in that it does explicity state exactly what it means at each step. In fact I found the whole project vague. For example it asks for columns that are mean and standard deviation; then we may ask does this include all columns that have "mean" and "std" in any part of their name, only the start of the name, or only the end?

An example of my discretion is that the folder labeled internal has not been included. It contains raw data which is not tidy and regardless it will be exlucded when we cut on variables that are not to do with mean or standard deviation.

#Files 
The files in this repository are:
 .*README.md
 .*CodeBook.md
 .*run_analysis.R 
 .*tidy_avg_data.txt
 