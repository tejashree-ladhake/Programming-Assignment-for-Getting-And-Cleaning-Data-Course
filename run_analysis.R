# 1.  Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#create data set
X_test<- read.table(file = "./UCI HAR Dataset/test/X_test.txt")
subject_test<- read.table(file = "./UCI HAR Dataset/test/subject_test.txt")
subject_test<- rename(subject_test, c("V1"="subject"))
y_test<- read.table(file = "./UCI HAR Dataset/test/y_test.txt")
y_test<- rename(y_test, c("V1"="y"))
testdata<- cbind(subject_test,y_test,X_test)

X_train<- read.table(file = "./UCI HAR Dataset/train/X_train.txt")
subject_train<- read.table(file = "./UCI HAR Dataset/train/subject_train.txt")
subject_train<- rename(subject_train,c("V1"="subject"))
y_train<- read.table(file = "./UCI HAR Dataset/train/y_train.txt")
y_train<- rename(y_train, c("V1"="y"))

traindata<- cbind(subject_train, y_train, X_train)
 
data<- rbind(testdata,traindata)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
features<- read.table(file = "./UCI HAR Dataset/features.txt")
variables<- grep(pattern = "mean\\(\\)|std\\(\\)",x = features$V2)
tidydata<-select(data,c(1,2,variables+2))

# 3. Uses descriptive activity names to name the activities in the data set
tidydata$y<- as.character(tidydata$y)
tidydata$y<-revalue(tidydata$y, c("1"="WALKING","2"="WALKING_UPSTAIRS","3"="WALKING_DOWNSTAIRS","4"="SITTING","5"="STANDING","6"="LAYING")) 



# 4. Appropriately labels the data set with descriptive variable names.
variablesnames<- grep(pattern = "mean\\(\\)|std\\(\\)",x = features$V2,value = TRUE)
varnames<- c("subject","y",variablesnames)
tidydata<- `colnames<-`(tidydata, varnames)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata1<- group_by(tidydata, subject,y)
summarise_each(tidydata1,funs(mean))






