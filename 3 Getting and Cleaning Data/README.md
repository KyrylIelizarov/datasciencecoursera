##Getting and Cleaning Data Course Project

Course Project repository includes folowing file:

###Files
* 'run_analysis.R' : Perfoms all required work to produce tidy data set
* 'codebook.md' : Contains descrption on build datasetd, variable descrtions and name codings

###Runing of analysis
The code has a file 'run_analysis.R' in the work directory. The Samsung data should be unzipped in the same working directory.
To perform the analysis file 'run_analysis.R' should be run. 

###Required packages
* dplyr

###Analysis process
  1. Reading 'Activity' labels and 'features' names data
  2. Reading 'test' data and merging it
  3. Reading 'train' data and merging it
  4. Appending 'train' and 'test' data into one dataset
  5. Selecting 'mean()' and 'std()' measures from all features using Regular Expression
  6. Merge with 'Activity' names to dataset.
  7. Removing '-', '(' and ')' from features names
  8. Creating independent tidy data set with the average of each variable for each activity and each subject
  9. Writing result dataset into working directiry in file 'tidy_data.txt'

###Result of analysis
Result of running the script will be dataset saved in working directory with name 'tidy_data.txt'

