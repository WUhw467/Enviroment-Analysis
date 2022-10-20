#import dataset
mydata <- read.csv("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/AirNow csv/OZONE.csv")

# Step 1, remove columns we don't use
(ColNames<-names(mydata))

for(name in 1:length(ColNames)){
  cat(ColNames[name], "\n")
}

(NumColumns <-ncol(mydata))
(NumRows <-nrow(mydata))

## Let's make tables of all the columns
lapply(mydata,table)  
lapply(mydata,summary) 

############################################
## Remove columns we do not want
################################################################
## WAY 1: One way is by index - we want to remove column 1 here....
mydata <- mydata[,-2]
mydata <- mydata[,-2]
mydata <- mydata[,-2]
mydata <- mydata[,-2]
mydata <- mydata[,-2]
mydata <- mydata[,-2]
mydata <- mydata[,-2]
mydata <- mydata[,-3]
mydata <- mydata[,-3]

############################################################
## MISSING VALUES
##
############################################################
## check the entire DF for missing values in total
is.na(mydata)  ## This method is logical 
## and can be useful for other logical operations
# There is no missing value

# check the variable
str(mydata)
# change the first column into factor
mydata$DateObserved <- as.factor(mydata$DateObserved)
# change the second column into numeric
mydata$AQI <- as.numeric(mydata$AQI)

setwd("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/AirNow csv")
write.csv(mydata, "CleanOZONE.csv", row.names = FALSE)

#find the mean and variance of the AQI
## mean, variance, etc.
summary(mydata$AQI)
sd(mydata$AQI)

# create a plot to see the change of the AQI in VA
plot (mydata$AQI, xaxt="n", type = "l", main = "OZONE")
axis(1, at=c(1,length(mydata$DateObserved)), lab=c(mydata$DateObserved[1], mydata$DateObserved[length(mydata$DateObserved)]))
