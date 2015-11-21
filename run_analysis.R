#-----------------------------------------
# Galen129
# 11/16/15
# Getting and Cleaning Data
# Class Project
# Week 3
# 
# Package dependencies
#    data.table, dplyr, reshape2   
#-----------------------------------------

rm(list=ls())

library(data.table)
library(dplyr)
library(reshape2)

# Reading in the test and train data, along with their activity and subject labels
X_test = fread("./UCI HAR Dataset/test/X_test.txt", data.table=FALSE)
Y_test = fread("./UCI HAR Dataset/test/Y_test.txt", data.table=FALSE)
Subject_test = fread("./UCI HAR Dataset/test/subject_test.txt", data.table=FALSE)
X_train = fread("./UCI HAR Dataset/train/X_train.txt", data.table=FALSE)
Y_train = fread("./UCI HAR Dataset/train/Y_train.txt", data.table=FALSE)
Subject_train = fread("./UCI HAR Dataset/train/subject_train.txt", data.table=FALSE)
Activities = fread("./UCI HAR Dataset/activity_labels.txt", data.table=FALSE)
ColNames = fread("./UCI HAR Dataset/features.txt", data.table=FALSE)

# Combinded dataset
HARdata = rbind(cbind(Y_test, Subject_test, X_test), cbind(Y_train, Subject_train, X_train))
colnames(HARdata) = c("Activity", "Subject", ColNames[ ,2])
HARdata[,1] = Activities[HARdata[,1],2]

# Extracting only the mean and std columns
HARdata = HARdata[,c(1,2, grep("mean()", colnames(HARdata), fixed=TRUE), +
                grep("std()", colnames(HARdata), fixed=TRUE))]

# Modifying the column names to remove hyphens and parentheses
colnames(HARdata) = gsub("-mean()-", "Mean", colnames(HARdata), fixed=TRUE)
colnames(HARdata) = gsub("-mean()", "Mean", colnames(HARdata), fixed=TRUE)
colnames(HARdata) = gsub("-std()-", "Std", colnames(HARdata), fixed=TRUE)
colnames(HARdata) = gsub("-std()", "Std", colnames(HARdata), fixed=TRUE)

# Creating a new data set containing the mean for each measurement grouped by activity and subject
HARdataMean = as.data.frame(summarize_each(group_by(HARdata, Activity, Subject), funs(mean)))

# Writting the two datasets back to the working directory
write.table(HARdata, file="./HARdata.txt", row.names = FALSE)
write.table(HARdataMean, file="./HARdataMean.txt", row.names = FALSE)