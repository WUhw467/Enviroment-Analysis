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
Search_DF1 <- twListToDF(Search1)

tags <- Search_DF1$text
tags <- str_extract_all(Search_DF1$text,pattern = "(?<=\\B\\#)[^\\s]+")

len <- c()
for (i in 1:length(tags)){
  len[i] <- length(tags[[i]])
}
maximum <- max(len)

for (i in 1:length(tags)){
  tags[i]<-paste(tags[[i]], collapse = ' ')
}
tags <- unlist(tags)

dtweets <- tags[1:length(tags)]
n <- length(tags)
for (i in 1:n){
  dtweets[i] <- NA
  if (tags[i] %in% dtweets) {
    tags[i] <- NA}
}
tags <- gsub("[^\x01-\x7F]", "", tags)
tags <- tags[-c(110)]
tags <- na.omit(tags)
df <- data.frame(tags)

setwd("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/ARM/arm")
MyFile <- file("environment2.csv")
Tokens<-tokenizers::tokenize_words(
  df$tags[1],stopwords = stopwords::stopwords("en"), 
  lowercase = T,  strip_punct = T, strip_numeric = T,
  simplify = T)
cat(unlist(Tokens), "\n", file=MyFile, sep=",")

close(MyFile)

MyFile <- file("environment2.csv", open="a")
for(i in 2:nrow(df)){
  Tokens<-tokenize_words(df$tags[i],
                         stopwords = stopwords::stopwords("en"), 
                         lowercase = T,  
                         strip_punct = T, 
                         simplify = T)
  
  cat(unlist(Tokens), "\n", file=MyFile, sep=",")
  cat(unlist(Tokens))
}

close(MyFile)
