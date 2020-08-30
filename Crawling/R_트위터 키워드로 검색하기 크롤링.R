setwd("C:/Users/urse/Desktop/빅데이터, R, 자연어/R/크롤링")

install.packages(c("twitteR","ROAuth","base64enc"))
library("twitteR")
library("ROAuth")
library("base64enc")

# (API key)
consumerKey <- "kEKPujL4q8EEA7fFdW7Uyym9d"
# (API secret key)
consumerSecret <- "QqiDhOLXMb2K9HZxVN3Vt50vruEobFCUeWayuG4TXSUFHXs8Sj"
# (Access token)
AccessToken <- "1089515561044721665-6n4Dt369MbqNVJzIGv3AiUVZvxBRA9"
# (Access token secret)
accessTokenSecret <- "AjIi1u1CZ7RyLKKYmEHAVNw2veJlIRxoavePDxaGYZnU9"

# 트위터 oauth 인증 파일 저장.
setup_twitter_oauth(consumerKey,consumerSecret,AccessToken,accessTokenSecret)

# 1. 기본 키워드 검색.
keyword <-enc2utf8("빅데이터")
bigdata <-searchTwitter(keyword, n=500, lang="ko") # Twitter에서 검색할 키워드 검색. 500개의 트윗 크롤링

length(bigdata) 
head(bigdata)

# 2. 날짜 지정해서 키워드 검색하기.
# 크롤링 갯수 초깃값 25
bigdata2 <-searchTwitter(keyword, since='2019-01-01', until='2019-01-28',lang='ko')
length(bigdata2)
head(bigdata2)
