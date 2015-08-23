## Introduction

#### - Firstly, run_analysis.R downloads the data that is supposed to be modified and cleaned to get the tidy data set.
#### - Then, merges the training and the test sets to create one data set.
#### - Extracts only the measurements on the mean and standard deviation for each measurement. 
#### - Uses descriptive activity names to name the activities in the data set.
#### - Appropriately labels the data set with descriptive variable names.
#### - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variable

#### - trainx, trainy, testx, testy, trainsubject and testsubject read data.
#### - datax, datay and datasubject merge the relevant datasets.
#### - features.txt has the names for datax set, these are applied to the column names stored in meanstd.
#### - activities variables are dealt the same way.
#### - finaldata merges datax, datay and datasubject.
#### - average.txt is the desired data set.
