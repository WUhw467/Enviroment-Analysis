setwd("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/AirNow csv")

base <- "https://www.airnowapi.org/aq/observation/zipCode/historical/"

format<-"text/csv"
zipCode="22209"
date="2019-12-31"
API_KEY="79792E07-B001-47FC-B9C0-F2AC367FFFE5"
distance="100"

call1 <- paste(base,"?",
               "format", "=", format, "&",
               "zipCode", "=", zipCode, "&",
               "date", "=", date,
               "T00-0000", "&",
               "distance", "=", distance, "&",
               "API_KEY", "=", API_KEY,
               sep="")

(call1)

AirNowAPI_Call<-httr::GET(call1)
(AirNowAPI_Call)

(MYDF<-httr::content(AirNowAPI_Call))
## Print to a file
AirName = "AirNow.csv"
## Start the file
AirFile <- file(AirName)
## Write Tweets to file
write.csv(MYDF,AirFile, row.names = FALSE)