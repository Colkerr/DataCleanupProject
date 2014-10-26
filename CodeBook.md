Code Book: Tidy UCI HAR Dataset

This reads the following files:
"features.txt" 		- contains the variable names describing the measurement type

"test/X_test.txt"	- the measurements from the test period, columns names as in features.txt
"train/X_train.txt",	- the measurements from the train period, columns names as in features.txt

"test/y_test.txt"	- the activity identifiers, one for each row in X_test and X_train
"test/subject_test.txt"	- the person identifiers,, one for each row in X_test and X_train
"train/y_train.txt"	- same applies as for test
"train/subject_train.txt"

The following variables are loaded from the CI HAR Dataset

Only the variable names (features) containing mean() and std(0 are required.
Use grep to find these and tidy up the resulting labels by removing - , ) and (
The tidy lables are held in featsLabels.

The activity and person identifiers are read into vectors to be inserted as first two columns of final table. 
These are first extracted to activity*, person*, where * = test or train and then combined into
activity and person

Similarly the measurements are read into vars* and then combined into vars
The activity column names on vars are then set using featsLabels. 

For part 4 of the assignment:-
activity identifiers are converted to description in activityDesc and varsP4 is created as required.


For part 5 of the assignment:-
vars is aggregated into aggdata by activityDesc and person using FUN=mean
Column names activity and person are set and the data writtne to file with row.names =F

