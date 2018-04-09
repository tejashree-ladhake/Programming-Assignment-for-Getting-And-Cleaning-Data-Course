run_analysis.R that does the following.

1.  Merges the training and the test sets to create one data        set.
2.  Extracts only the measurements on the mean and standard          deviation for each measurement.
3.  Uses descriptive activity names to name the activities in       the data set
4.  Appropriately labels the data set with descriptive variable      names.
5.  From the data set in step 4, creates a second, independent       tidy data set with the average of each variable for each         activity and each subject.

All the data files are included in UCI HAR Dataset. 

all the y and subject tables are renamed for first column since merging all the files together creates duplicate column name(V1)for 3 columns

# 2. Extracts only the measurements on the mean and standard deviation for each measurement

features.txt is extracted into table and its values are matched with "mean()"or"std()" using grep function.
variables stores the value of variables having mean() or std() in their names.
tidydata is created using select function. select extracts the data from "data" tables according to the index specified by "variables"i.e the indexes having mean()or std() in their values.
 
# 3. Uses descriptive activity names to name the activities in the data set
since the class of y variable is "numeric" so convert it into character class and then pass the values for renaming the y column values using revalue function. the values are taken from activity_labels.txt
 
# 4. Appropriately labels the data set with descriptive variable names.
to label the variable names use grep function with vlaue=TRUE parameter, and the names from feature.txt(with mean() or std())is matched with them
upend the fie=rst two column names as it is since we do not want them to be ignored.

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
grouping is done by subject and y both columns of tidydata and store the data in new table called tidydata1
then summarize the data over mean 
to get the 
A tibble: 180 x 68
# Groups:   subject [?]
   subject y                `tBodyAcc-mean()-… `tBodyAcc-mean()-…
     <int> <chr>                         <dbl>              <dbl>
 1       1 LAYING                        0.222           -0.0405 
 2       1 SITTING                       0.261           -0.00131
 3       1 STANDING                      0.279           -0.0161 
 4       1 WALKING                       0.277           -0.0174 
 5       1 WALKING_DOWNSTA…              0.289           -0.00992
 6       1 WALKING_UPSTAIRS              0.255           -0.0240 
 7       2 LAYING                        0.281           -0.0182 
 8       2 SITTING                       0.277           -0.0157 
 9       2 STANDING                      0.278           -0.0184 
10       2 WALKING                       0.276           -0.0186 
# ... with 170 more rows, and 64 more variables:
#   `tBodyAcc-mean()-Z` <dbl>, `tBodyAcc-std()-X` <dbl>,
#   `tBodyAcc-std()-Y` <dbl>, `tBodyAcc-std()-Z` <dbl>,
#   `tGravityAcc-m----------
