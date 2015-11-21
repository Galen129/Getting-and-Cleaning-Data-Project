==========================================================================================
Galen129
11/20/15
HAR Dataset codebook
==========================================================================================

The steps outlined below use the HAR Dataset (Human Activity Recognition Using Smartphones Dataset) to produce two condensed and tidy datasets.


Input
=============================
RAW Dataset: UCI HAR Dataset 
Download Link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Output
=============================
HARdata.txt
	Contains the mean and std measurements for each of the features in the original 
	HAR UCI Dataset

HARmeanData.txt
	Contains the mean values of each feature grouped by the activity and subject 
	variables contained in HARdata.txt


Summary of the HAR Dataset
=============================
Further detail on the UCI HAR Dataset is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data was collected from a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Each record of the HAR Dataset includes
---------------------------------------
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Data Processing Steps
=============================
The R-script run_analysis.R extracts the mean and std feature vectors for each feature from the 561 total vectors and compiles this output into HARdata.txt. The subject identifiers and descriptive activity names are given in the first two columns for each observation.

HARdata.txt is further processed to produced HARdataMean.txt, which contains the mean value for each feature vector in HARdata.txt grouped by the subject and activity.


