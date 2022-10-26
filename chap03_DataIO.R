# chap03_DataIO

######################################
# chapter03. 데이터 입출력
######################################

# 1. 데이터 불러오기

## 1-1. 키보드 입력 - java에서는 scanner로 입력을 받았다.

# 키보드로 숫자 입력하기
num <- scan()
num

# 합계 구하기
sum(num)

# 키보드로 문자 입력하기
name <- scan(what = character())
name

# 편집기 이용 데이터프레임 만들기
df <- data.frame() #빈 데이터프레임 생성
df <- edit(df)
df

## 1-2. 로컬 파일 가져오기

# 1) read.table() 함수 이용
#   - 컬럼명이 없는 파일 불러오기
getwd()
setwd("C:/workspaces/Rwork/data")

student <- read.table(file = "student.txt") #변수에 담는 작업. 헤더 설정이 없으므로 기본은 false
student
mode(student); class(student)

names(student) <- c('번호', '이름', '키', '몸무게')
student

#   - 컬럼명이 있는 파일 불러오기
student1 <- read.table(file = "student1.txt", header = T) #헤더 설정 T. 파일이 가지고 있는 헤더설정을 가져온다.
student1

#   - 탐색기를 통해서 파일 선택하기
student1 <- read.table(file.choose(), header = T) #file.choose()가 먼저 실행.
student1

#   - 구분자가 있는 경우(세미콜론, 탭)
student2 <- read.table(file = "student2.txt", sep = ";", header = T)
student2

#   - 결측치를 처리하여 파일 불러오기 - 빈데이터가 있을때
student3 <- read.table(file = "student3.txt", sep = "", header = T, na.strings = "-") 
student3

#   - csv 파일 형식 불러오기
student4 <- read.csv(file = "student4.txt", na.strings = "-", encoding = "UTF-8") 
#encoding = "UTF-8이 들어가는 이유 : r을 다운그레이드 하면서 어제 바꾼 파일은 깨져서 보이는 현상. 인코딩 타입을 세팅 해야한다. 
student4

# read.xlsx() 함수 이용 - 엑셀데이터 읽어오기
# 패키지 설치와 java 실행 환경 설정
install.packages("rJava") # rJava 패키지 설치
install.packages("xlsx")  # xlsx 패키지 설치
Sys.setenv(JAVA_HOME='C:/Program Files/Java/jdk-11.0.16.1') #자바 패키지 구동을 위한 매개변수. 뒤에는 자바의 위치를 적어둔다. 폴더의 위치는 슬래시로.

# 관련 패키지 메모리 로드
library(rJava)
library(xlsx)

# 엑셀 파일 가져오기
studentex <- read.xlsx("studentexcel.xlsx", encoding = "UTF-8", sheetIndex = 1)
studentex

install.packages("readxl")
library(readxl)

st_excel <- read_excel(path="studentexcel.xlsx", sheet = 1)
st_excel

## 1-3. 인터넷에서 파일 가져오기
#https://databank.worldbank.org/data/download/GDP.csv
# 단계1 : 세계 GDP 순위 데이터 가져오기
GDP_ranking <- read.csv("https://databank.worldbank.org/data/download/GDP.csv", encoding = "UTF-8")
GDP_ranking
head(GDP_ranking, 20)
dim(GDP_ranking)

# 데이터를 가공하기 위해 불필요한 행과 열을 제거한다.
GDP_ranking2 <- GDP_ranking[-c(1:4), c(1,2,4,5)] #1행부터 4행까지 삭제. 열은 1245행만 뽑아오겠다. (빈칸삭제)
head(GDP_ranking2)

# 상위 16개 국가 선별한다.
GDP_ranking16 <- head(GDP_ranking2, 16) # 상위 16개 국가
GDP_ranking16

# 데이터프레임을 구성하는 4개의 열에 대한 이름을 지정한다.
names(GDP_ranking16) <- c('Code', 'Ranking', 'Nation', 'GDP')
GDP_ranking16
dim(GDP_ranking16)

# 단계2 : 세계 GDP 상위 16위 국가 막대 차트 시각화
gdp <- GDP_ranking16$GDP
nation <- GDP_ranking16$Nation
gdp

install.packages("stringr")
library(stringr)

num_gdp <- as.numeric(str_replace_all(gdp, ',', '')) # str_replace_all 함수. stringr패키지. ,를 빼주는 작업. 패키지가 r 다운그레이드로 없기 때문에 string r을 설치. 
num_gdp

GDP_ranking16$GDP <- num_gdp


# 막대차트 시각화
barplot(GDP_ranking16$GDP, col = rainbow(16), #barplot 시각화 기능. 
        xlab = '국가(nation)', ylab='단위(달러)', names.arg=nation)

# 1,000단위 축소
num_gdp2 <- num_gdp / 1000
GDP_ranking16$GDP2 <- num_gdp2
barplot(GDP_ranking16$GDP2, col = rainbow(16),
        main = "2020년도 GDP 세계 16위 국가",
        xlab = '국가(nation)', ylab='단위(천달러)', names.arg=nation)

GDP_ranking16


## 1-4. 웹문서 가져오기

# 2010년 ~ 2015년도 미국의 주별 1인당 소득 자료 가져오기.
# "https://ssti.org/blog/useful-stats-capita-personal-income-state-2010-2015"

# 단계1 : XML / httr 패키지 설치
install.packages("XML")
install.packages("httr")

library(XML)
library(httr)

# 단계2 : 미국의 주별 1인당 소득 자료 가져오기.
url <- "https://ssti.org/blog/useful-stats-capita-personal-income-state-2010-2015"

get_url <- GET(url) #웹페이지 정보
get_url$content #16진수
rawToChar(get_url$content) #현재 페이지의 소스 코드

html_cont <- readHTMLTable(rawToChar(get_url$content), stringsAsFactors=F)
class(html_cont) #list

html_cont<- as.data.frame(html_cont) #형변환
class(html_cont) #"data.frame"
head(html_cont)


# 단계4 : 컬럼명을 수정한 후 뒷부분 6개 관측치 보기
names(html_cont) <- c("State", "y2010", "y2011", "y2012", "y2013", "y2014", "y2015")
tail(html_cont)


# 2. 데이터 저장하기
# 2-1. 화면(콘솔) 출력
#  1) cat() 함수
x <- 10
y <- 20
z <- x*y #값은 200
cat("x * y의 결과는 ", z, "입니다.\n") #\n 이스케이프 시퀀스. 줄바꿈. 

#  2) print() 함수
print(z) #변수 출력 가능
print(z*10) #수식 출력 가능.
print("x*y=" , z) #Error in print.default("x*y=", z) : invalid printing digits 200. 문자열과 함께 출력 불가. 문자열 출력은 cat을 이용한다.

#cat과 print는 콘솔 출력용. 


# 2-2. 파일에 데이터 저장
#  1) sink() 함수를 이용한 파일 저장
getwd()
setwd("C:/workspaces/Rwork/output")

install.packages("RSADBE")
library(RSADBE)
data("Severity_Counts") # Severity_Counts 데이터 셋 가져오기
Severity_Counts

#자바의 스트림 (프로그램과 파일사이의 연결) - input stream/output stream이 있다.
#스트림은 일단 단방향이기 때문에 파일을 연결하려면 output stream으로 먼저 연결한다. 파일과 연동하여 데이터를 주고 받으려면 연결통로를 만들어야 하는데 이것을 스트림이라고 한다. 

sink("severity.txt") # 저장할 파일 open. 연결통로 만들기. 
severity <- Severity_Counts # 데이터 셋을 변수에 저장.
severity  # 콘솔에 출력되지 않고, 파일에 저장
sink()    # 오픈된 파일 close. 반드시 종료해줘야한다. 



library(xlsx)

#  2) write.table() 함수 이용 파일 저장
# 탐색기를 이용하여 데이터 가져오기
studenttx <- read_xlsx(file.choose(), sheetIndex = 1, encoding = "UTF-8") 
stduenttx

# 기본 속성으로 저장 - 행이름과 따옴표가 붙는다.
write.table(stduenttx, "stdt.txt")

# 'row.names=F' 속성을 이용하여 행이름 제거하여 저장한다.
write.table(stduenttx, "stdt.txt", row.names = F)

# 'quote=F' 속성을 이용하여 따옴표를 제거하여 저장한다.
write.table(stduenttx, "stdt.txt", quote = F)

# 행이름 제거 + 따옴표 제거
write.table(stduenttx, "stdt.txt", row.names = F, quote = F)

GDP_ranking16
write.table(GDP_ranking16, "GDP_ranking16.txt", row.names = F)

GDP_ranking16_read <- read.table("GDP_ranking16.txt", sep = "", header = T)
GDP_ranking16_read


#  3) write.xlsx() 함수 이용 파일 저장 - 엑셀 파일로 저장
library(rJava)
library(xlsx) # excel data 입출력 함수 제공

st.df <- read.xlsx(file.choose(), sheetIndex = 1, encoding = "UTF-8")
st.df

write.xlsx(st.df, "student.xlsx") #excel 형식으로 저장. 


#  4) write.csv() 함수 이용 파일 저장
#     - data.frame 형식의 데이터를 csv 형식으로 저장.

write.csv(st.df, "stdt.csv", row.names = F, quote = F)








