getwd()
setwd("C:/Users/urse/Desktop/학교/18년도 1학기/데이터마이닝/데이터마이닝 csv자료")
Utilities<-read.csv("Utilities.csv")
head(Utilities)

## seperator : 구분자 

## (1) csv로 읽기.
Utilities<-read.csv("Utilities.csv")
head(Utilities)

## (2) table로 읽기.
Utilities2<-read.table(file = "Utilities.csv", header=TRUE, sep=",")
Utilities2
## sep = 1byte 짜리여야 하고, 띄어쓰기로 했을 때 엑셀 파일안에 띄어쓰기가 되어 있으면 안됨.

## (3) xlsx 엑셀 읽기.
## install.packages("xlsx")
library(xlsx)
Utilities3<-read.xlsx("Utilities2.xlsx",1)
Utilities3

## (4) 옆화면 Environment -> Import Dataset -> 
## (5) URL에서 가져오기. -> Import from Web URL
## (6) 데이터베이스에서 RODBC 연동 -> http://rprogramming.net/connect-to-database-in-r/ 관련링크 
## (7) 학습용 데이터 제공 http://archive.ics.uci.edu/ml/datasets.html, 

