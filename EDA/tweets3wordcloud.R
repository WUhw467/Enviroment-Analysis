library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

text <- readLines("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/tweets/bestenvironment.txt")
docs <- Corpus(VectorSource(text))
docs <- tm_map(docs, removeWords, stopwords("english"))
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))