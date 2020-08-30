#Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_131')
#system("java -version")
#install.packages("bit")
#install.packages("KoNLP")
#install.packages("wordcloud")
# (1) KoNLP를 이용한 단어 명사 추출.
library(KoNLP)
getwd()
setwd("C:/Users/urse/Desktop")
data1 <-readLines("mcthemax1.txt")
useSejongDic() #한글이 저장되어 있는 세종사전을 사용함. 이 사전을 근거로 명사들을 걸러냄
buildDictionary(data.frame("서진수","ncn")) # 이름같은 경우는 사전에 없으니까 사전에 추가해주기
str(data1)
data2 <-sapply(data1,extractNoun, USE.NAMES = F) # 각 라인에서 명사 단어만 가져오기
data3 <- unlist(data2) # 필터링을 위해 list형태를 풀고 벡터형태로 저장.
data3 <- Filter(function(x){nchar(x)>=2}, data3) # 2글자 이상만 추출
data3
data3<-gsub("\\d+","",data3) ## gsub("변경전 글자", "변경후 글자", "원본 데이터")

# (2) 완료 파일 저장 및 다시 읽기
write(unlist(data3),"mcthemax2.txt") ## 수정 완료 한 파일을 저장.
data4<-read.table("mcthemax2.txt") ## 최종 파일을 table형태로 불러옴.
nrow(data4) ## 단어의 갯수
wordcount<-table(data4) ## read.table하면 data.frame형태라서 table 형태로 바꿔줌
sort(wordcount, decreasing=T) ## 바꿔준걸 내림차순으로 정렬해서 보기.
str(wordcount) # wordcloud는 table형태로 바꿔야 만들어줄 수 있음.

# (3) 시각화 패키지를 통한 palete란 색 셋트 만들기.
library(RColorBrewer) #시각화 패키지
display.brewer.all() # 제공 색상타입 모두 보기 (아래 그림4 참고)
palete<-brewer.pal(9,"Set3") #brewer.pal(사용할 색상갯수, 색상타입이름)

# (4-1) pie 차트로 보기.
piewordcount<-head(wordcount,10)
pie(piewordcount, col=palete, radius=1)

# (4-2) wordCloud로 보기 
library(wordcloud)
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.5,min.freq=1,random.order=F,random.color=T,colors=palete) 
# scale : 빈도가 가장 큰 단어와 가장 작은 단어 폰트 크기 차이, per : 90도 회전에서 보여줄 단어 비율 1이면 전부 90도 회전, 
#order : F=빈도수 큰 단어 가운데 T=랜덤 배치, family:폰트, freq=3, max.words=100 : 빈도 3이상 100미만 단어표현 
legend(0.3,1,"Mc the max - My Way", cex = 0.5, fill=NA, border=NA, bg="white", text.col="red", text.font=2, box.col="blue") # 범례 legend(x,y,제목) x는 0이 맨 왼쪽 y는 1이 맨 위
savePlot("my way.png", type="png") # png 파일로 저장.

# (5) 추가내용
# https://search.naver.com/p/crd/rd?m=1&px=482&py=259&sx=482&sy=259&p=T1DTXlpySEdssu2rvjossssstMh-083788&q=wordcloud+%C7%D4%BC%F6&ssc=tab.nx.all&f=nexearch&w=nexearch&s=LMF2dSTnfAgitKE80ZI7pQ==&time=1532581567563&a=web_all*w.tit&r=1&i=a00000fa_f3e412c63327ce20273eadbf&u=http%3A//hochul.net/blog/r_wordcloud_from_file/&cr=1 R을 이용하여 WordCloud그려보기 함수 설명 잘나와있음.
# KAIST 품사 태그셋 기반으로 한 형태소 분석 함수들 3개
# MorphAnalyzer : 형태소를 분석해 주는 함수
# SimplePos09 : 09개의 품사 종류(태그 N:체언, F:외국어, P:용언)을 달아주는 함수
# SimplePos22 : 22개의 품사 종류(태그 s:기호, x:접사, J:관계언)을 달아주는 함수 
# SimplePos22가 SimplePos09보다 정확하고, MorphAnalyzer보다는 간단함.
# MorphAnalyzer가 가장 복잡.
# https://github.com/haven-jeon/KoNLP/blob/master/etcs/KoNLP-API.md KAIST 품사 태그셋 관련 깃허브 링크