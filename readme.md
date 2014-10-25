Assignment for Coursera Getting and Cleaning Data class. 
=======================================================

This package contains files extracted from the UCI HAR Datasets.

For details on the raw datasets, visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

There is one script `run_analysis.R` which reads test and train files of variables, and files of metadata to provide row and column descriptions.
The test and train files are combined.
Each data point is for a variable (such as tBodyAcc-mean()-X), a person (of which there are 30), and an activity (of which there are 6).

Only those variables which contain mean() or std() are extracted to construct a table of person and activity versus variable. 

The data is aggregated by person/activity and the mean of each group calculated.

The code book describing the variables, data, and transformations is available [CodeBook.md](./CodeBook.md).




