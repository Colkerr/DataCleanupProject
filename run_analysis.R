####Coursera Getting and Cleaning Data. Project

##get the variable names, find mean() and std(),extract them, remove -,),( 
acts <- read.delim("features.txt",header=F,sep=" ")
##actsCols<-grep("mean\\(\\)|std\\(\\)",acts[,2])
actsLabels <- acts[grep("mean\\(\\)|std\\(\\)",acts[,2]),]
actsLabels<-gsub("[-)(]", "", acts2[,2])
##actsLabels are the variable names

##get the test and train activity and person vectors
activityTest <- read.table("test/y_test.txt",header=F)
personTest <- read.table("test/subject_test.txt",header=F)
activityTrain <- read.table("train/y_train.txt",header=F)
personTrain <- read.table("train/subject_train.txt",header=F)

#combine test and train
activity <- rbind(activityTest,activityTrain)
person <- rbind(personTest,personTrain)

##get the test and train variables
varsTest <- read.table("test/X_test.txt",header=F)[,actsCols]
varsTrain <- read.table("train/X_train.txt",header=F)[,actsCols]

vars <- rbind(varsTest,varsTrain)
colnames(vars) <- actsLabels
aggdata<-aggregate(vars, by=c(activity,person), FUN=mean, na.rm=TRUE)
colnames(aggdata)[c(1,2)] <- c("person","activity")
write.table(aggdata,file="report.csv",sep=",",col.names = T, row.names = F)