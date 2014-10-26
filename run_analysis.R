####Coursera Getting and Cleaning Data. Project

##Set variable names in actsLabels, find mean() and std(),extract them, remove -,),( 
feats <- read.delim("features.txt",header=F,sep=" ")
featsCols<-grep("mean\\(\\)|std\\(\\)",feats[,2])
featsLabels <- feats[featsCols,]
featsLabels<-gsub("[-)(]", "", featsLabels[,2])


##Get the test and train activity and person vectors
activityTest <- read.table("test/y_test.txt",header=F)
personTest <- read.table("test/subject_test.txt",header=F)
activityTrain <- read.table("train/y_train.txt",header=F)
personTrain <- read.table("train/subject_train.txt",header=F)

##Combine test and train activity and person
activity <- rbind(activityTest,activityTrain)
person <- rbind(personTest,personTrain)

##Get the test and train variables
varsTest <- read.table("test/X_test.txt",header=F)[,featsCols]
varsTrain <- read.table("train/X_train.txt",header=F)[,featsCols]

##Combine the test and train vars
vars <- rbind(varsTest,varsTrain)
colnames(vars) <- featsLabels

##For part 4 of the question translate activity get activity descriptions
activityLabels <-  read.table("activity_labels.txt",header=F,as.is=T)[,2]
activityDesc<- data.frame(activityLabels[activity[,1]])
varsP4 <- cbind(activityDesc,vars)
colnames(varsP4)[1]<-"activity"

##For part 5 aggegate the data and find mean of each group then write to file using row.names=F
aggdata<-aggregate(varsP4[,-1], by=c(activityDesc,person), FUN=mean, na.rm=TRUE)
colnames(aggdata)[c(1,2)] <- c("activity","person")
write.table(aggdata,file="report.txt",sep=" ",col.names = T, row.names = F)
