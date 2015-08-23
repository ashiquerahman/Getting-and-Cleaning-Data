library(plyr)

if (!file.exists("UCI HAR Dataset")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip", method = "curl")
  unzip("dataset.zip")
}

trainx <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

testx <- read.table("./UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

datax <- rbind(trainx, testx)
datay <- rbind(trainy, testy)
datasubject <- rbind(trainsubject, testsubject)

features <- read.table("./UCI HAR Dataset/features.txt")
meanstd <- grep("-(mean|std)\\(\\)", features[, 2])
names(datax) <- features[meanstd, 2]

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
datay[, 1] <- activities[datay[, 1], 2]
names(datay) <- "activity"

names(datasubject) <- "subject"
finaldata <- cbind(datax, datay, datasubject)
average <- ddply(finaldata, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(average, "average.txt", row.name = FALSE)


