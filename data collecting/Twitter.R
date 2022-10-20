##-------------------------------------------------------------
#############################################################
### The Twitter API   ########################################
############################################################
## You MUST first apply for and get a Twitter Dev Account
## Create a new App on the account AND
## get the access codes
## !!!!!!!!!!!!!!!!! YOU will need your own passcodes
## https://developer.twitter.com/en/apply-for-access.html
##############################################################

#install.packages("twitteR")
#install.packages("ROAuth")
#install.packages("rtweet")
library(rtweet)
library(twitteR)
library(ROAuth)
library(jsonlite)

setwd("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering")
## The above is where my Twitter Dev passcodes are located.
## This will NOT BE THE SAME FOR YOU

#filename="C:/Users/profa/Documents/RStudioFolder_1/DCR2019Networks/TwitterConKey_ConSec_AccTok_AccSec.txt"
#(tokens<-read.csv(filename, header=TRUE, sep=","))


(consumerKey=("QjSwXJqX5p988tb79fk8uWwsb"))
consumerSecret=("2Yj9V5pT8zE8Xm5WOBsbE1GIfakDqOqb5WFhSV0mUpq6m1Wh9J")
access_Token=("1435320567301824521-rOUkxa7UP2DUW4VweJOwZQAFf4x3Ok")
access_Secret=("l3jGrFfB9UE5sT8kZ4y2ICppkbamV69nrva2z6tSt9Nec")


requestURL='https://api.twitter.com/oauth/request_token'
accessURL='https://api.twitter.com/oauth/access_token'
authURL='https://api.twitter.com/oauth/authorize'

setup_twitter_oauth(consumerKey,consumerSecret,access_Token,access_Secret)
Search1<-twitteR::searchTwitter("#environment",n=200, since="2019-12-30")
Search2<-twitteR::searchTwitter("environment + America", n=500, since="2019-12-30",resultType = "recent")
Search3<-twitteR::searchTwitter("best+environment+country", n=126, since=NULL,resultType = "recent")
Search4<-twitteR::searchTwitter("worst+environment+country", n=24, resultType = "recent")
Search_DF2 <- twListToDF(Search1)
Search_DF3 <- twListToDF(Search2)
Search_DF4 <- twListToDF(Search3)
Search_DF5 <- twListToDF(Search4)

Search_DF2$text[1]


########## Place Tweets in a new file ###################
FName = "twitter.txt"
F2Name = "AmericaEnvironment.txt"
F3Name = "BestEnvironmentCountry.txt"
F4Name = "WorstEnvironmentCountry.txt"
## Start the file
MyFile <- file(FName)
MyFile2 <- file(F2Name)
MyFile3 <- file(F3Name)
MyFile4 <- file(F4Name)
## Write Tweets to file
cat(unlist(Search_DF2), " ", file=MyFile, sep="\n")
close(MyFile)
cat(unlist(Search_DF3), " ", file=MyFile2, sep="\n")
close(MyFile2)
cat(unlist(Search_DF4), " ", file=MyFile3, sep="\n")
close(MyFile3)
cat(unlist(Search_DF5), " ", file=MyFile4, sep="\n")
close(MyFile4)
########## Place Tweets in a new cvs file ################
write.csv(Search_DF2,"/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets1.csv", row.names = FALSE)
write.csv(Search_DF3,"/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets2.csv", row.names = FALSE)
write.csv(Search_DF4,"/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets3.csv", row.names = FALSE)
write.csv(Search_DF5,"/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets4.csv", row.names = FALSE)


