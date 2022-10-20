setwd("/Users/hengxinwu/Desktop/DS Homework/501 Portfolio/data gathering/AirNow csv")

base <- "https://www.airnowapi.org/aq/observation/zipCode/historical/"

format<-"text/csv"
zipCode="22209"
API_KEY="79792E07-B001-47FC-B9C0-F2AC367FFFE5"
distance="100"

year <- "2020"
month <- 1
day <- 1

while (month <= 12 && day <= 28) {
  if(month < 10){
    month.1 <- paste("0", as.character(month), sep = "")
  }else{
    month.1 <- as.character(month)
  }
  if(day < 10){
    day.1 <- paste("0", as.character(day), sep = "")
  }else{
    day.1 <- as.character(day)
  }
  date <- paste(year, "-", month.1, "-",day.1, sep = "")
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
  ## Write Tweets to file
  write.table(MYDF, AirName,
              append = TRUE,
              sep = ",",
              col.names = FALSE,
              row.names = FALSE,
              quote = FALSE)
  
  if(day == 28) {
    month <- month + 1
    day <- 1
  }else{
    day <- day + 1
  }
}