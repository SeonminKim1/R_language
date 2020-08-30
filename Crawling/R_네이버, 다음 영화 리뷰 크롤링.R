setwd("C:/Users/urse/Desktop/빅데이터, R, 자연어/R/크롤링")

# 크롤링을 위한 rvest 패키지.
# install.packages("rvest")
library(rvest)

# 다음 무비 
url_daum_base = "https://movie.daum.net/moviedb/grade?movieId=119859&type=netizen&page="
all.reviews <- c()
for(page in 1:10){
  url <-paste(url_daum_base, page, sep='') # page뒤에 1~10 붙이기.
  print(url) # url뒤에 1부터 10
  htxt<-read_html(url) # url에서 html로 읽어들이기.
  htxt

  # 영화 리뷰 전체 부분. <div class = "review_info"> 부분.
  table<-html_nodes(htxt,'.review_info') # review_info라는 class거 가져오기.
  table
  
  # 영화 리뷰 글에 대한 부분. <p class="desc review"> 부분.
  content<-html_nodes(table,'.desc_review')
  content  
  
  # 리뷰에서 완전한 텍스트 부분만 추출.
  reviews<-html_text(content) 
  reviews
  
  # 리뷰 없는것들은 빼고. 
  if(length(reviews)==0){break}
  all.reviews<-c(all.reviews, reviews)
  print(page)
}
write.table(all.reviews,'daum.txt')

######################################### 네이버 영화 리뷰

url_naver_base = "https://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=167699&target=after&page="
all.reviews_naver <- c()
for(naver_page in 1:10){
  url_naver<-paste(url_naver_base, naver_page, sep='', encoding ="euc-kr") # naver_page뒤에 1~10 붙이기.
  print(url_naver) # url뒤에 1부터 10
  htxt_naver<-read_html(url_naver) # url에서 html로 읽어들이기.
  htxt_naver
  
  # 영화 리뷰 전체 부분. <div class = "list_netizen"> 부분.
  table_naver<-html_nodes(htxt_naver,'.list_netizen') # review_info라는 class거 가져오기.
  table_naver
  
  # 영화 리뷰 글에 대한 부분. <p class="title"> 부분.
  content_naver<-html_nodes(table_naver,'.title')
  content_naver  
  
  # 리뷰에서 완전한 텍스트 부분만 추출.
  reviews_naver<-html_text(content_naver) 
  reviews_naver
  
  # 리뷰 없는것들은 빼고. 
  if(length(reviews_naver)==0){break}
  all.reviews_naver<-c(all.reviews_naver, reviews_naver)
  print(naver_page)
}
write.table(all.reviews_naver,'naver.txt')
