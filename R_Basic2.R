
# (12) 팩터는 벡터의 성격 파악 목적 (범주형 변수 구분시 많이사용)

# (13) 기타 
# pdf("plot1.pdf") 추출한 그림을 pdf파일로 저장 가능.
# CRAN Task Views(http://cran.r-project.org/web/views) 패키지들을 영역별로 소개하고 의학, 금융, 환경 등 여러 분야에서 R이 어떻게 사용되고 있는지 확인 가능.
# Korean R User Group(http://r-project.kr) 한국의 R사용자 모임이 운영하는 사이트.
# R seek(http://rseek.org/) R의 다양한 함수, 코드 그리고 유용한 사이트를 찾아주는 R전용 검색 엔진 사이트이다.
# https://blog.naver.com/tjsqjavmfh/220858244838 // R 기본 설명 블로그
# http://kr.nvidia.com/object/gpu-applications-domain-kr.html // GPU병렬처리 CUDA 홈페이지 및 위쪽에 블로그 ,커뮤니티 등 있음.

# (14) R추가용어
# str() : 데이터 구조보기
# summary() : 데이터에 기본적인 통계값 들을 알려줌. 1st Qu. : 4분의 1지점의 값 , 3st Qu : 4분의 3지점의 값, Median : 중앙값
# table() : 4가지 경우의 수를 나타낸 표를 보여줌. (0,1, 0,1), Crosstable() : table() 4가지 경우의 수를 나타낸 표를 통계적 수치로 보여줌.

# ex1) 밀도 그래프
library("ggplot2")
ggplot(custom, aes(x=age)) + geom_density() #// 밀도 그래프 custom:데이터프레임, aes:aesthenic의 약자로 x축이나 y축 명칭 지정

# ex2) 로그 그래프 : 값이 급격하게 변할때
library("scales")
ggplot(custom) + geom_density(aes(x=income)) + scale_x_log10(breaks=c(100,1000,100000), labels=comma)

# ex3) 히스토그램
ggplot(custom)+geom_histogram(aes(x=age), binwidth=3) #// binwidth= x축을 3단위로 나누어 그림

# ex3-1) 히스토그램 간단하게
y<-c(4,6,5,10,12,10,8,10,12,13,7,9,10,11,16,15,14,17,22,21,19,20,19,17,23,17,22,26,25,24)
hist(y) 

# ex4) 박스플롯 : summary()로 구해지는 값을 시각적으로 보여주는 것
boxplot(student) 
# 맨위, 맨아래 선 : 최대, 최소 / 굵은 가운데 선 : 중앙값 /
# 박스테두리 3/4 , 1/4 지점 / 평균은 박스 정가운데  

# ex5) 막대그래프
ggplot(custom, aes(x=habitation))+geom_bar() # // 세로축 막대그래프
ggplot(custom, aes(x=habitation))+geom_bar() + coord_flip() # // 가로축 막대그래프

hablt<-table(custom$habitation)
habitdf<-as.data.frame(habit)
colnames(habitdf)<-c("habitation","count")
ggplot(habitdf)+geom_bar(aes(x=reorder(habitation,count),y=count), stat="identity") + coord_flip() # // 가로축 막대그래프 정렬한것.

# 기타) 산포도, 타임플롯
# 기타2) lattice패키지 - xyplot(), barchart(), barplot(), densityplot() 

# (15) 데이터 전처리
# - 결측치 처리, 틀린 값 처리, 이상치 처리(일반적인 범위 벗어났을 때) 정규화(z-score, 로그변환, 역수변환 등), 가 필요.

# (16) etc
# 프로그래밍언어 : Java, C, R, 파이썬 언어
# 통계처리 패키지 : SAS, SPSS, STATA
# 수치해석 도구 : Matlab
# - 파이썬 : NumPy(데이터 분석에 사용할 컨테이너 역할), Pandas(데이터 가공할 함수 제공), Matplotlib(데이터 시각화), IPython(계산용 라이브러리), SciPy(계산 컴퓨팅 영역) 등 매우 편리한 라이브러리를 제공.
# - 이전에는 R이나 Matlab으로 분석에 대한 아이디어를 검증해본 후 자바나 C로 다시 구현했다면 이제는 Python으로 한번에 함

# SAS(Statistical Analysis System) 
# - 기업이나 대형기관에서 일반적으로 가장 널리 쓰는 통계
# - EG(Enterprise Guide)는 GUI를 제공 및 데이터 준비 및 속성 쉽게 파악 + EMiner(Enterprize Miner)는 기계학습 알고리즘 등 데이터 분석에 필요한 기능 제공 및 편의성 좋음.
# SPSS (Statistical Package for the Social Science) 가장 많이 사용되는 통계패키지
# Matlab : 수치해석, 행렬연산, 신호처리의 수치계산을 편리하게 수행 및 다양한 그래픽 기능 제공.

# (17) 데이터 시각화
# - 통상적으로 빨간색은 부정, 파란색은 긍정
# - R시각화 패키지는 ggplot2 , 노드 그래프(network패키지), 지도상데이터표시(ggmaps패키지), 애니메이션 효과(animation패키지), 트리맵 사용(portfolio패키지)
# - 데이터 시각화에는 기본적으로 이 특성들을 사용한다. 위치(일반적으로 2차원 그래프 x축,y축, 덴드로그램을 이용한 인종분류), 길이(막대그래프), 각도(파이그래프), 방향, 형태, 면적-부피(트리맵 함수를 이용한 인구밀도 대비 국민 총소득), 명암-색상(히트맵을 이용한 우리나라 인구 밀도 측정)
# - R함수 plot(), barplot(), boxplot(), hist(), pie(), stars() : 다변량 데이터를 방사형으로 그림, pairs() : 다변량 데이터의 산포도를 그려줌, persp() : x,y,z축을 가지는 3차원의 데이터 입에도를 그려줌. contour() : 3차원 데이터의 등고선 그래프를 그려줌.
# - 엑셀:다양한 차트, SAS-SPSS : 자체적 제공, 이외에 타블로(타블로 서버에 데이터 올림), 타이밀(지도상 데이터), D3(자바스크립트 기반 라이브러리로 인터렉티브한 그래픽 작업에 유용)

# (18) KoNLP
#install.packages("KoNLP")
library(KoNLP)
useSejongDic() #한글이 저장되어 있는 세종사전을 사용함. 이 사전을 근거로 명사들을 걸러냄
buildDictionary(data.frame("서진수","ncn")) # 이름같은 경우는 사전에 없으니까 사전에 추가해주기
data1 <-readLines("mcthemax1.txt")
data2 <-sapply(data1,extractNoun, USE.NAMES = F) # list형태로 데이터가 만들어짐.
data3 <- unlist(data2) # 필터링을 위해 list형태를 풀고 벡터형태로 저장.