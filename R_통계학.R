death <-c(2,1,2,4,2,5,3,3,5,6, 3,8,3,3,6,3,6,5,3,5,
          2,6,2,3,4,3,2,9,2,2, 3,2,7,3,2,10,6,2,3,1,
          2,3,3,4,3,2,6,2,2,3, 2,3,4,3,2,3,5,2,5,5,
          3,4,3,6,2,1,2,3,2,6, 3,3,6,3,2,3,6,4,6,5,
          3,5,6,2,6,3,2,3,2,6, 2,6,3,3,2,6,9,6,3,6,
          6,2,3,2,3,5,3,5,2,3, 2,3,3,1,3,3,2,3,3,4,
          3,6,6,3,3,3,2,3,3,6)

### 1. 도수분포표
# table(death) : 도수 분포표를 만드는 함수
table <- table(death)
table
cause <- c("감염성 질환","각종 암","순환기 질환","호흡기 질환","소화기 질환","각종 사고사","비뇨기질환","정신병","노환","신경계질환")
# barplot(height-data, col-색상, main-제목, ylab-축이름, xlab-x축이름, lengend.text-범례내용, args,legend-범례위치) : 막대그래프 출력
barplot(height = table, col = rainbow(10), main="사망원인에 대한 그래프", ylab="빈도수",xlab="사망원인",legend.text=cause, args.legend=list(x="topright"))

### 2. pie 차트 만들기.
# pie(x-data, label-범주명 지정, main-그림제목, col-파이 그림의 색깔 지정, cex-범주 글자 크기 조절)
pie(table, label=cause, main="사망원인에 대한 원형그래프", cex=0.7)

# pareto.chart(x-data, main-제목, xlab-x축이름, ylab-y축이름, ylab2-누적상대도수 축이름)
# legend(x-범례의위치, legend-범주 이름, lty-범례에 표기할 선 모양, pch-범례에 표기할 점 모양, fill-범례에 표기할 색, title-범례제목, border-상자의 색)
# install.packages("qcc") # quality Control Chart

### 3. pareto 차트 만들기.
library(qcc)
pareto.result<-pareto.chart(data = table, main="사망원인", xlab="질병종류",ylab="Frequency",ylab2="Cumulative Percentage")
legend(x="right",legend=c("빈도수","누적상대도수"), lty=c(0,1), pch=c(-1,20), fill=c("orange",0),title="범례",border=c("black","white"))

### 4. 히스토그램 만들기.
drink<-c(101.8, 101.5, 101.8, 102.6, 101, 96.8, 102.4, 100, 98.8, 98.1,
         98.8, 98, 99.4, 95.5, 100.1, 100.5, 97.4, 100.2, 101.4, 98.7,
         101.4, 99.4, 101.7, 99, 99.7, 98.9, 99.5, 100, 99.7, 100.9,
         99.7, 99, 98.8, 99.7, 100.9, 99.9, 97.5, 101.5, 98.2, 99.2, 
         98.6, 101.4, 102.1, 102.9, 100.8, 99.4, 103.7, 100.3, 100.2, 101.1,
         101.8, 101.6, 99.3, 96.1, 100, 99.7, 99.4, 101.5, 100.9, 101.3,
         99.9, 99.1, 100.7, 100.8, 100.8, 101.4, 100.3, 98.4, 97.2, 97.2)
# hist(x-data, breaks-구간을 나누는 기준(구간갯수, 구간을 나누는 경계값, freq-히스토그램 그리는 기준(null,true)-빈도수 기준)
hist.result<-hist(drink)
hist.result

### 5. 도수다각형 만들기
lines(x=hist.result$mids, y=hist.result$counts, type="b", pch=20)

### 6. 수치자료들 요약
summary(drink)
mean(drink) # 평균
quantile(drink, probs = c(0.7,0.9)) # 분위수 값 probs옵션으로 몇% 위치 것 구할지.
var(drink) # 분산
sd(drink) # 표준편차
IQR(drink) # 사분위수 범위
range(drink) # 최솟값과 최댓값
max(drink)-min(drink) # 최댓값에서 최솟값 범위

### 7. 산점도와 상관관계 구하기
height <- c(181, 161, 170, 160, 158, 168, 162, 179, 183, 178, 171, 177,
            163, 158, 160, 160, 158, 173, 160, 163, 167, 165, 163, 173,
            178, 170, 167, 177, 175, 169, 152, 158, 160, 160, 159, 180,
            169, 162, 178, 173, 173, 171, 171, 170, 160, 167, 168, 166,
            164, 173, 180)

weight <-c(78, 49, 52, 53, 50, 57, 53, 54, 71, 73, 55, 73, 51, 53, 65, 48,
           59, 64, 48, 53, 78, 45, 56, 70, 68, 59, 55, 64, 59, 55, 38, 45,
           50, 46, 50, 63, 71, 52, 74, 52, 61, 65, 68, 57, 47, 48, 58, 59,
           55, 74, 74)

# cor(x=첫번째 변수의 이름, y= 두번째 변수의 이름)
cor(x=height, y=weight)
# plot(x=x좌표에 사용할 변수의 이름, y=y좌표에 사용할 변수의 이름, xlab="x축 이름", ylab="y축 이름", main="그래프 제목")
plot(x=height,y=weight,xlab="키",ylab="몸무게",main="키와 몸무게의 산점도")

### 8. 이항분포 (누적확률 및 변량 값)
# 성공할 확률이 p인 베르누이 시행을 n번 반복할 때 성공할 횟수를 X라고 하면 
# 이 확률 변수 X의 확률분포를 모수가 (n,p)인 것

# dbinom() x에서의 이항분포의 확률값
a<-seq(0,50,1)
b<-dbinom(x=a, size=50, prob=0.4) # 이항분포
plot(a,b)

# pbinom(q - 이항분포의 변량값, size - 이항분포의 시행횟수, prob - 이항분포의 성공확률, lower.tail - P(X<=q) 이하로 할건지 , 기본 = TRUE(이하)) : 변량 값 q에 해당하는 누적확률 구하기
# 이항분포의 누적확률 값 
# n=50, p=0.04인 p[x<=3]인 누적확률 값은?
pb<-pbinom(q=3, size=50, prob=0.04, lower.tail = TRUE)

db0<-dbinom(x=0, size=50, prob=0.04)
db1<-dbinom(x=1, size=50, prob=0.04)
db2<-dbinom(x=2, size=50, prob=0.04)
db3<-dbinom(x=3, size=50, prob=0.04)
print("누적확률 값은 pb")
print(pb)
print(db0+db1+db2+db3)

# 이항분포의 백분위 수 구하기. 0.6 누적확률을 가지려면 x가 몇까지 가야되나. p=1일 경우 50
# qbinom(p - 이항분포의 누적확률, size - 이항분포의 시행횟수, prob - 이항분포의 성공확률, lower.tail - P(X>=q) 이상으로 할건지 , FALSE시 이상) : 누적확률 p에 해당하는 변량 값
qbinom(p=0.6, size=50, prob=0.2) 


### 9. 정규분포 
# pnorm(q - 확률분포를 구하려는 변량의 값, mean-평균, sd-표준편차, lower.tail=TRUE) 
# qnorm(p - 해당 확률값, mean-평균, sd-표준편차) 누적확률이 p가 될 때 대응되는 변량의 값.

# ex1) 평균이 63이고 표준편차가 10인 정규분포에서 50이하의 확률값.
pnorm(q=50, mean=63, sd=10)

# ex2) 상위 10%에 해당하는 변량값 구해라. 
qnorm(p=0.9, mean=63, sd=10)

# qqnorm 함수 이용해서 정규확률 그림 그리기.
data<-c(4001,3927, 3048, 4898, 4000, 3445, 4949, 3530, 3075, 4012, 3797, 
        3550, 4027, 3571, 3738, 5157, 3598, 4749, 4263, 3894, 4262, 4232, 
        3852, 4256, 3271, 4315, 3078, 3607, 3889, 3147, 3421, 3531, 3987,
        4120, 4349, 4071, 3683, 3332, 3285, 3739, 3544, 4103, 3401, 3601,
        3717, 4846, 5005, 3991, 2866, 3561, 4003, 4387, 3510, 2884, 3819, 
        3173, 3470, 3340, 3214, 3670, 3694)
# qqnorm(y-data, main-제목, xlab - x축 제목, ylab-y축 제목, datax - TRUE(데이터를 x축 기준할건지))
qqnorm(y=data, datax = FALSE)
# qqline(y-data)
qqline(y=data)

### 10. 표준정규분포
# sample(x - 표본추출 변수, size-횟수, replace - TRUE시 복원추출, FALSE면 비복원추출)
set.seed(5555)
sample(x=0:9, size=5, replace=TRUE)

m<-rep(0,100)
for(i in 1:100){
  m[i]<-mean(sample(x=0:9, size=5, replace=TRUE))
}
m
hist(x=m, breaks=c(0:9), xlim=c(0,10)) # break는 계급구간 히스토그램 밑바닥 선 범위 지정임.
qqnorm(m)
qqline(m)

### 11. 신뢰구간
height<-c(163, 161, 168, 161, 157, 162, 153, 159, 164, 170,
          152, 160, 157, 168, 150, 165, 156, 151, 162, 150, 
          156, 152, 161, 165, 168, 167, 165, 168, 159, 156)
# 요약통계량
xbar.h<-mean(height)
var.h<-var(height)
sd.h<-sd(height)
median.h<-median(height)
range.h<-range(height)
min.h<-min(height)
max.h<-max(height)
sum.h<-sum(height)
n<-length(height)

# 표준오차, 오차범위, 신뢰구간
se.h<-sd.h/sqrt(n) # 표준오차
z.alpha<-qnorm(1-0.05/2) # 오차범위
z.alpha*se.h
xbar.h+c(-1,1)*z.alpha*se.h # 신뢰구간

### 12. t분포 - 누적확률과 변량 값 계산
# pt(q- t분포의 변량값, df - t분포의 자유도)
# qt(p - t분포의 누적확률, df - t분포의 자유도)

### 13. 회귀분석
height <- c(181, 161, 170, 160, 158, 168, 162, 179, 183, 178, 171, 177,
            163, 158, 160, 160, 158, 173, 160, 163, 167, 165, 163, 173,
            178, 170, 167, 177, 175, 169, 152, 158, 160, 160, 159, 180,
            169, 162, 178, 173, 173, 171, 171, 170, 160, 167, 168, 166,
            164, 173, 180) # 키

weight <-c(78, 49, 52, 53, 50, 57, 53, 54, 71, 73, 55, 73, 51, 53, 65, 48,
           59, 64, 48, 53, 78, 45, 56, 70, 68, 59, 55, 64, 59, 55, 38, 45,
           50, 46, 50, 63, 71, 52, 74, 52, 61, 65, 68, 57, 47, 48, 58, 59,
           55, 74, 74) # 몸무게

# lm (formula-회귀분석을 수행하려는 식으로 반응변수(x)~설명변수(y)(처리) 형식으로 입력, data=NULL) : formula에 대한 회귀분석 수행
fit<-lm(weight ~ height)
summary(fit) # 회귀분석 결과를 요약하여 출력

# confint(object, level =0.95 ) : 회귀계수의 신뢰구간을 계산)
confint(fit, 0.95)

# abline : 추정된 회귀직선을 그림에 출력 (단순회귀모형 만 가능)
# height와 weight를 이용한 잔차도, 적합도, 잔처 정규확률도 출력하는 R코드
par(mfrow=c(2,2)) # 여러개의 그림을 한 화면에 출력하기 위해.
plot(height, weight, xlab="height", ylab="weight", main="키(height) 선 적합도")
abline(fit)

# residuals : 적합된 모형의 잔차를반환
residuals(fit)
r<-residuals(fit)
plot(height, r, xlab="height", ylab="residuals", main="키(height)잔차도")

qqnorm(r, main="잔차 정규확률도")

# 회귀분석 해석
# Residuals : Min-잔차의 최솟값, 1Q-잔차의 1사분위수 Median-잔차의 중간값, 3Q-잔차의 3분위 수, Max-잔차의 최댓값
# Estimate - intercept => y절편 -> -100.7820
# Estimate - height = 기울기 -> 0.9479
# P-값은 7.4* e^-10 인데, 이는 매우 작은 값이라 -> 유의수준 0.05 이하에서 회귀모형의 기울기가 유의하다고 말할 수 있음.
# *** 별은 p-value인데 *이 많으면 0~0.001 사이의 p-value라는 뜻이고. -> 0에 가까우니까 그만큼 변수가 유의하다는 뜻임.
# 해당 변수로만 생각 !!!! 즉 height는 유의하다 !!
# Multiple R-squared는 결정계수를 의미. 0.5421 -> 몸무게의 변동(y축) 중에서 54.2%는 단순선형회귀모형으로 설명 될 수 있다는 뜻.

### 14. 분산분석
# aov(formula-분산분석을 수행하려 하는 식으로서 '반응변수(x) ~ 설명변수(y)(처리)' 형식으로 입력, data) # formula에 대한 분산분석 수행.
y<-c(10,15,8,12,15,
     14,18,21,15,
     17,16,14,15,17,15,18,
     12,15,17,15,16,15)
treat<-c(rep("A",5), rep("B",4), rep("C",7), rep("D",6))
fit2<-aov(y ~ treat) # y는 x축, treat는 y축
summary(fit2)

# 분산분석 해석
# 자유도-DF, Sum sq-제곱합, Mean sq-평균제곱, F-value = F-검정통계량의 값, P-값은 F-검정통계량에 대한 유의확률.

### 15. 카이제곱검정
# chisq.test(x,p) : 자료 p에 대한 카이제곱검정 수행
# x: 카이제곱검정을 수행하고자 하는 숙자 벡터 혹은 행렬
# p: 적합도 검정을 위한 모집단의 비율.

# ex1)
obs<-c(18,55,27) # 관측 도수
pr<-c(0.25,0.50,0.25) # 비율
n<-sum(obs) # 관측도수들의 합
ex<-n*pr # 기대도수 
chisq.test(obs, p=pr)
# 해석
# p-value가 0.2698 -> 유의수준 5%, 10% 보다 크므로 생물학의 이론이 제안한 모집단의 비율에 적합하지 않다고 결론 내릴 수 없다. 
# -> p-값이 유의수준보다 크면 귀무가설을 기각할 수 없다.

# ex2)
diet <- matrix(c(37,24,19,17,33,20), nrow=2, byrow =TRUE)
dimnames(diet) <- list(c("diet_A", "diet_B"), c("Good","Normal","Bad"))
diet
chisq.test(diet)
# P-값이 0.01638로 0.05보다 작으니까 A와 B는 차기아 없다는 귀무가설을 기각할 수 있다.