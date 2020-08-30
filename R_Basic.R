# library를 항상 써주어야 하는 이유는 패키지는 한번 다운받으면 되지만 메모리에 항상 로드 시켜놓지 않게 하기 위해서임. (메모리 절약 목적)

# (1) 스칼라와 벡터
# 스칼라 : 하나의 변수가 값을 하나만 가짐.
# 벡터 : 하나의 변수가 두개 이상의 값을 포함함. (단 같은 종류의 항목들만 저장)
z<-1:30 

# (2) 벡터와 기타 함수들
# 벡터를 직접 만들 때 c를 씀(construct, combine)
x<-c(1,2,3,c(6,7))
x<-seq(1,10, by = 2) # 시작은 1부터 10까지 2씩증가 (sequence)
x<-rep(1,10, length.out = 3) # 1부터 10사이에 3개 있어야 함.
x<-rep(1:3,times=10) # 1부터 3까지 10번 반복
x<-rep(1:3, each=2) # 1부터 3까지 2번씩 반복
x<-x[-2] # x의 2번째 열 뺌.
length(x) # 벡터의 길이를 알 수 있음.
names(x) <- c("math","science","english") # 항목들에 이름 부여 가능 나머지는 NA가 붙음.
mean(x, na.rm=T) # x값이 비어있더라도(NA가 있더라도)빼고 강행

# (3) 벡터를 2차원으로 matrix(행렬)
#matrix는 행렬로 벡터를 2차원 구조로 만든 것이다.
#matrix는 별 다른 말이 없으면 열의 수를 1로 정함.
matrix(1:6,ncol=2,nrow=3) # 1~6을 행3 열2 짜리 matrix 

#(4) 벡터말고 리스트
#백터의 확장판인 리스트(아무종류든 담기 가능)
list <- list(name="kim",age=30, fuckyou="욕") # 아무이름이나 아무형식이나 담기 가능.
list$name
list$age
list$fuckyou # : 로 접근 가능

# (5) 리스트를 2차원으로 frame (프레임)
# 백터를 2차원으로 확장한게 matrix면
# 리스트를 2차원으로 확장한게 frame 이다.
x<-data.frame(name=c("kim","lee"), age=c(10,20), fuckyou=c("시qk","개toRl"))
x

# (6) 프레임 합치기
#x의 name과 y의 name이 항목이 같다면 merge함수로 합칠 수 있음.
m<-merge(x,y)
m

# (7) 변수의 타입 종류, 파악, 변환
# numeric, character, logical, matrix, list, data.frame
x<-3  
as.character(x) # "3"

# (8) 함수
# 함수안에서 사용한 변수는 함수가 실행된 후 사라짐
# 평소에 쓰는건 전역변수 개념임.
# ex1
oddcount<-function(x){
  k<-0
  for(n in x){
    if(n%%2==1)k<-k+1
  }
  return(k)
}
oddcount(1:3) # 1부터 3까지의 홀수 갯수 리턴

# ex2
y<-3
f<-function(x) return (x+y)
f(5)

# (9) apply, lapply(list apply), sapply(simple apply)
# apply(m, dimcode, f) : m은 행렬 dimcode는 1이면 행 2이면 열, f는 적용할 함수
# 즉 백터나 행렬 등에 동일한 함수를 각각 적용시킬 수 있게 해주는 것이다.

x = matrix(1:6,ncol=2,nrow=3) # 1~6을 행3 열2 짜리 matrix 
x
apply(x,1,mean) # x행렬의 행마다의 값의 평균을 내라. -> 3.0 12.5 0.5
apply(x,2,mean) # x행렬의 열마다의 값의 평균을 내라. -> 5.000 5.667

list = c(1:30)
lapply(list, f) # 리스트들에게 f함수 적용하는데 출력은 리스트로 
lapply(list(1:10, 11:20), mean) # list형식의 각 행마다의 평균 구하기 -> [[1]] 5.5 [[2]] 15.5

sapply(list, f) # 리스트들에게 f함수 적용하는데 출력은 백터로
sapply(list(1:10, 11:20), mean) # lapply결과에서 list형식말고 간단하게 백터형식으로 -> 5.5 15.5


# (10) if, for, while 
# if문
# if - else if - else 단 if{}랑 else랑 같은 줄에 있어야 함.
x<-5
if(x==3){
  y<-5
}else if(x==4){
  y<-10
}else{
  y<-6
}
y

# while문
i<-1
while(i<=5){
  print(i)
  i<-i+1
}

# for문
sum=0
for(x in 1:10){
  sum<-sum+x
}
sum

# (11) 필터링 (새로운 백터 생성, which)
# head(data,30) // head가 기본 5갠데 30개 갯수 지정도 됨.
# 벡터 필터링
x<-c(1,3,5,9,10)
x<-x[x>=5]  
x # 5 9 10

# 행렬 필터링
x = matrix(1:6,ncol=2,nrow=3) # 1~6을 행3 열2 짜리 matrix 
x<-x[x[2,]>=3,]

# 데이터프레임 필터링
x<-data.frame(name=c("kim","lee"), age=c(10,20), fuckyou=c("시qk","개toRl"))
x[x$age>=10,] # frame에서 나이가 10이상인 경우의 frame 추출.

# which(조건) 함수 : 해당 조건이 성립하는 위치 알아내기
x<-c(1,3,5,9,10)
which(x>=7) # -> 4 5