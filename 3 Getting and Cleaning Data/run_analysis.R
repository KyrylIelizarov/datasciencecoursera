#Read 'Activity' labels
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("ActivityNum","ActivityName")

#Read 'features' names
features <- read.table("./UCI HAR Dataset/features.txt")
colnames(features) <- c("VarNum","VarName")

#Reading 'test' data
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")

#Setting column names
colnames(testY)<-c("Activity")
colnames(subject_test)<-c("Subject")
colnames(testX)<-features$VarName

#Binding 'test' data
test <- cbind(testY,subject_test,testX)

#Reading 'train' data
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

#Setting column names
colnames(trainY)<-c("Activity")
colnames(subject_train)<-c("Subject")
colnames(trainX)<-features$VarName

#Binding 'train' data
train <- cbind(trainY,subject_train,trainX)

#Appending 'train' and 'test' data into one dataset
allData <- rbind(train,test)

#Check for row numbers. Should be 10,299 records
nrow(allData)
#Check for column numbers. Should be 561 attributes + 1 'Subject' attribute + 1 'Activity' atrribute
ncol(allData)

#Select 'mean()' and 'std()' measures from features using Regular Expression
extractedData<-allData[,c(rep(TRUE,2),grepl("mean\\(\\)|std\\(\\)",features$VarName))]
head(extractedData)

#Merge with 'Activity' names
extractedData <- merge(extractedData,activity_labels,by.x="Activity",by.y="ActivityNum",all.x=TRUE)

#Remove '-','(',')' from features names
colnames(extractedData)<-gsub("-|\\(|\\)","",names(extractedData))

extractedData$Activity<-extractedData$ActivityName

library(dplyr)
tidy <-summarize(group_by(extractedData,Activity,Subject),
	tBodyAccmeanX=mean(tBodyAccmeanX),
	tBodyAccmeanY=mean(tBodyAccmeanY),
	tBodyAccmeanZ=mean(tBodyAccmeanZ),
	tBodyAccstdX=mean(tBodyAccstdX),
	tBodyAccstdY=mean(tBodyAccstdY),
	tBodyAccstdZ=mean(tBodyAccstdZ),
	tGravityAccmeanX=mean(tGravityAccmeanX),
	tGravityAccmeanY=mean(tGravityAccmeanY),
	tGravityAccmeanZ=mean(tGravityAccmeanZ),
	tGravityAccstdX=mean(tGravityAccstdX),
	tGravityAccstdY=mean(tGravityAccstdY),
	tGravityAccstdZ=mean(tGravityAccstdZ),
	tBodyAccJerkmeanX=mean(tBodyAccJerkmeanX),
	tBodyAccJerkmeanY=mean(tBodyAccJerkmeanY),
	tBodyAccJerkmeanZ=mean(tBodyAccJerkmeanZ),
	tBodyAccJerkstdX=mean(tBodyAccJerkstdX),
	tBodyAccJerkstdY=mean(tBodyAccJerkstdY),
	tBodyAccJerkstdZ=mean(tBodyAccJerkstdZ),
	tBodyGyromeanX=mean(tBodyGyromeanX),
	tBodyGyromeanY=mean(tBodyGyromeanY),
	tBodyGyromeanZ=mean(tBodyGyromeanZ),
	tBodyGyrostdX=mean(tBodyGyrostdX),
	tBodyGyrostdY=mean(tBodyGyrostdY),
	tBodyGyrostdZ=mean(tBodyGyrostdZ),
	tBodyGyroJerkmeanX=mean(tBodyGyroJerkmeanX),
	tBodyGyroJerkmeanY=mean(tBodyGyroJerkmeanY),
	tBodyGyroJerkmeanZ=mean(tBodyGyroJerkmeanZ),
	tBodyGyroJerkstdX=mean(tBodyGyroJerkstdX),
	tBodyGyroJerkstdY=mean(tBodyGyroJerkstdY),
	tBodyGyroJerkstdZ=mean(tBodyGyroJerkstdZ),
	tBodyAccMagmean=mean(tBodyAccMagmean),
	tBodyAccMagstd=mean(tBodyAccMagstd),
	tGravityAccMagmean=mean(tGravityAccMagmean),
	tGravityAccMagstd=mean(tGravityAccMagstd),
	tBodyAccJerkMagmean=mean(tBodyAccJerkMagmean),
	tBodyAccJerkMagstd=mean(tBodyAccJerkMagstd),
	tBodyGyroMagmean=mean(tBodyGyroMagmean),
	tBodyGyroMagstd=mean(tBodyGyroMagstd),
	tBodyGyroJerkMagmean=mean(tBodyGyroJerkMagmean),
	tBodyGyroJerkMagstd=mean(tBodyGyroJerkMagstd),
	fBodyAccmeanX=mean(fBodyAccmeanX),
	fBodyAccmeanY=mean(fBodyAccmeanY),
	fBodyAccmeanZ=mean(fBodyAccmeanZ),
	fBodyAccstdX=mean(fBodyAccstdX),
	fBodyAccstdY=mean(fBodyAccstdY),
	fBodyAccstdZ=mean(fBodyAccstdZ),
	fBodyAccJerkmeanX=mean(fBodyAccJerkmeanX),
	fBodyAccJerkmeanY=mean(fBodyAccJerkmeanY),
	fBodyAccJerkmeanZ=mean(fBodyAccJerkmeanZ),
	fBodyAccJerkstdX=mean(fBodyAccJerkstdX),
	fBodyAccJerkstdY=mean(fBodyAccJerkstdY),
	fBodyAccJerkstdZ=mean(fBodyAccJerkstdZ),
	fBodyGyromeanX=mean(fBodyGyromeanX),
	fBodyGyromeanY=mean(fBodyGyromeanY),
	fBodyGyromeanZ=mean(fBodyGyromeanZ),
	fBodyGyrostdX=mean(fBodyGyrostdX),
	fBodyGyrostdY=mean(fBodyGyrostdY),
	fBodyGyrostdZ=mean(fBodyGyrostdZ),
	fBodyAccMagmean=mean(fBodyAccMagmean),
	fBodyAccMagstd=mean(fBodyAccMagstd),
	fBodyBodyAccJerkMagmean=mean(fBodyBodyAccJerkMagmean),
	fBodyBodyAccJerkMagstd=mean(fBodyBodyAccJerkMagstd),
	fBodyBodyGyroMagmean=mean(fBodyBodyGyroMagmean),
	fBodyBodyGyroMagstd=mean(fBodyBodyGyroMagstd),
	fBodyBodyGyroJerkMagmean=mean(fBodyBodyGyroJerkMagmean),
	fBodyBodyGyroJerkMagstd=mean(fBodyBodyGyroJerkMagstd)
	)

write.table(tidy,"tidy_data.txt",row.names=FALSE)
