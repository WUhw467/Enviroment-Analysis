# set the path
setwd("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets")

path1 <- "/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets/environment.txt"
path2 <- "/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets/AmericaEnvironment.txt"
path3 <- "/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets/bestenvironment.txt"
path4 <- "/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets/worstenvironment.txt"

tweets1 <- as.character(read.delim(file = path1, quote = ""))
tweets2 <- as.character(read.delim(file = path2, quote = ""))
tweets3 <- as.character(read.delim(file = path3, quote = ""))
tweets4 <- as.character(read.delim(file = path4, quote = ""))

content <- c(tweets1, tweets2, tweets3, tweets4)

cfv <- CountVectorizer$new(remove_stopwords = FALSE)

tweetscfv <- cfv$fit_transform(content)

MYDF1 <- data.frame(tweetscfv)
df <- data.frame(label = c("tweets1", "tweets2", "tweets3", "tweets4"))
MYDF2 <- cbind(df, MYDF1)


write.csv(MYDF2,"CleanedTweets 2.csv", row.names = FALSE)
