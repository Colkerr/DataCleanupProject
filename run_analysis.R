####Coursera Getting and Cleaning Data. Project

##Set variable names in actsLabels, find mean() and std(),extract them, remove -,),( 
acts <- read.delim("features.txt",header=F,sep=" ")
actsCols<-grep("mean\\(\\)|std\\(\\)",acts[,2])
actsLabels <- acts[actsCols,]
actsLabels<-gsub("[-)(]", "", actsLabels[,2])


##Get the test and train activity and person vectors
activityTest <- read.table("test/y_test.txt",header=F)
personTest <- read.table("test/subject_test.txt",header=F)
activityTrain <- read.table("train/y_train.txt",header=F)
personTrain <- read.table("train/subject_train.txt",header=F)

##Combine test and train activity and person
activity <- rbind(activityTest,activityTrain)
person <- rbind(personTest,personTrain)

##Get the test and train variables
varsTest <- read.table("test/X_test.txt",header=F)[,actsCols]
varsTrain <- read.table("train/X_train.txt",header=F)[,actsCols]

##Combine the test and train vars
vars <- rbind(varsTest,varsTrain)
colnames(vars) <- actsLabels

##>>>> Satisfy part 4 of the question <<<<
varsP4 <- cbind(activity,vars)

##Translate the activity numbers to descriptions
activityLabels <-  read.table("activity_labels.txt",header=F,as.is=T)[,2]
#activity <-  activityLabels[activity[,1]]
activityDesc<- data.frame(activityLabels[activity[,1]])
aggdata<-aggregate(varsP4[,-1], by=c(activityDesc,person), FUN=mean, na.rm=TRUE)
colnames(aggdata)[c(1,2)] <- c("activity","person")
write.table(aggdata,file="report.csv",sep=",",col.names = T, row.names = F)