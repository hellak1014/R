# chap02_DataStructure

######################################
# chapter02. 데이터의 유형과 구조
######################################

# 1. Vector 자료 구조
##  - C() 함수 이용 벡터 객체 생성
x <- c(1, 2, 3, 4, 5) #combine 함수. x에는 주소값이 담겨져 있다. 그리고 따로 자료형이 없는 대신 자기 스스로를 객체로 만든다. 스스로 데이터 new하는중.. 실수를 넣을 경우, 1.0, 2,5, 3.0 등으로 들어감. -> numeric으로 관리된다. 
x

x <- c(1:20) # 콜론 : 연속적인 숫자. 범위 #1부터 20까지. c는 생략이 가능하다. 클론 : 범위. 
x

y <- 10:20
y

##  - seq() 함수 이용 벡터 객체 생성
x <- seq(1, 10, 2) #sequence함수. 3개의 입력값을 전달 받았다. 시작값, 종료값, 증감 순서로 되어있다. 
x

##  - rep() 함수 이용 벡터 객체 생성
help(rep) #?ㄱ데
example(rep)
rep(1:3, 3) #replicate(대상, 반복수)
# 1 2 3 1 2 3 1 2 3
rep(1:3, each=3)
# 1 1 1 2 2 2 3 3 3

# union(), setdiff(), intersect() 함수 이용
x <- c(1, 3, 5, 7)
y <- c(3, 5)
x; y #두개의 명령을 동시에 시행. x의 변수값 출력, y의 변수값 출력. 이때 구별을 위해 세미콜론이 필요하다.

union(x, y)     # 합집합(x+y) #중복에 상관없이 언급되는 데이터
setdiff(x, y)   # 차집합(x-y) #y에 없는 x집합
intersect(x, y) # 교집합(x^y) #x와 y모두에 있는 값.

# 숫자형, 문자형, 논리형 벡터 생성
v1 <- c(33, -5, 20:23, 12, -2:3) #하나의 데이터가 아니라 음수, 콜론을 지정해서 데이터를 지정하는 등의 행동을 할 수 있다.
v1
v2 <- c(33, -5, 20:23, 12, "4") # 데이터를 모두 문자형으로 변환. 하나라도 문자가 있기 때문에. 
v2


# 한 줄에 명령문 중복 사용
v1; mode(v1) #mode함수. 자료형을 반환하는 함수. 
v2; mode(v2)

# 벡터에 컬럼명 지정
age <- c(30, 35, 40) #age에 배열데이터 넣기
age
names(age)<- c("홍길동", "이순신", "강감찬") #이름을 붙여주기. names(배열) <- c("붙일 이름", "붙일 이름")
age
age <- NULL #age변수에 담긴 데이터 삭제. 엄밀히 말하면 age에는 객체로 처리하기 때문에 주소값을 가지고 있다. 주소값을 삭제하므로 더이상 접근 할 수 없다. java의 컨셉. 

# 벡터 자료 참조하기
a <- c(1:50) #특정 데이터를 읽어오고 싶으면 index를 사용하면 된다. 
a[10] #a[9]를 하면 9가 나온다. R은 index를 1부터 사용한다. (0이 아니다!)
a[c(10:45)] #10~45 사이의 벡터 원소 출력
a[c(10, 20, 30, 40)] #10, 20, 30, 40 번째 벡터 원소 출력
a[10:(length(a)-5)] #combine은 생략 가능 a의 전체 길이 -5이므로 10:45와 같다. 어떤 자리에 어떤 형태도 다 올수 있다. 최종 결과가 정수로만 리턴이 된다면 어떤 요소든 들어올 수 있다.


# 잘못된 벡터 첨자 사용 예
a[5, 10] #Error in a[5, 10] : incorrect number of dimensions. combine의 유무. c는 : 와 사용할때 생략이 가능하다? 왜?
#이걸 R은 5행 10열로 이해한다. 5행 10열의 데이터 가져와로 인식해버린다. 

# c() 함수에서 콤마 사용 예
v1 <- c(33, -5, 20:23, 12, -2:3)
v1
v1[1] #하나의 데이터를 가져올때는 index를 이용용
v1[c(2, 6)] #두개 이상의 데이터를 가져올때는 combine
v1[3:5] #3~5번째 데이터를 가져올때는 콜론
v1[c(4, 5:8, 9)] #4번째, 5~8번째, 9번째 데이터


# 음수 값으로 첨자 지정 예
v1[-1] #음수 값으로 지정이 가능하다. JS나 파이썬도 지원이 가능하지만 동작 방식이 다르다. 얘네는 뒤에서 카운팅이지만 R은 해당 위치의 원소를 제외한 값 출력. 
v1[-c(2, 4)] #앞에서 두번째, 네번째 데이터를 뺀 나머지를 반환. 


# 패키지 설치와 메모리 로딩
install.packages("RSADBE") # 패키지(데이터) 설치
library(RSADBE)            # 패키지를 메모리에 로드

data("Severity_Counts")    # RSADBE 패키지에서 제공되는 데이터 셋 가져오기.
str(Severity_Counts) #structer의 약자. 구조를 볼수있다. 

# 패키지에서 제공되는 벡터데이터 셋 보기
Severity_Counts


# 2. Matrix 자료 구조
args(matrix) #function (data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL) 

# 벡터 이용 행렬 객체 생성
m <- matrix(c(1:5)) #열이 먼저 나오는 이유 : 열이 데이터를 가지고 있기 때문이다. 그래서 열 중심으로 데이터를 생성한다.
m  # 5행 1열

# 벡터의 열 우선으로 행렬 객체 생성
?matrix
m <- matrix(c(1:10), nrow = 2) # 2행 5열 nrow -> 행 갯수 설정. 
m

# 행과 열의 수가 일치하지 않는 경우 예
m <- matrix(c(1:11), nrow = 2)
m

# 벡터의 행 우선으로 행렬 객체 생성
m<- matrix(c(1:10), nrow=2, byrow = TRUE) #행 위주로 설정하기 때문에 byrow 속성을 T로 바꿈 (F가 디폴트)
m

m <- matrix(c(1:10), byrow = T) #행 우선 설정. 근데 행설정이 없음. 
m #세로로 설정이 됨. 열 우선 설정으로 된다. nrow나 ncol 값을 안주면, default는 one-column 으로 나온다. 즉, byrow의 속성은 적용되지 않음. 

m<- matrix(c(1:10), ncol=10)
m


# 행 묶음으로 행렬 객체 생성

x1 <- c(5, 40, 50:52)
x2 <- c(11, 13, 77:79)
mr <- rbind(x1, x2) #row(행)로 묶어라
mr

# 열 묶음으로 행렬 객체 생성

mc <- cbind(x1, x2)
mc


# 2행으로 행렬 객체 생성

m3 <- matrix(10:19, 2)
m3



# 자료와 객체 type 보기
mode(m3); # "numeric"
class(m3) # "matrix" "array"  자료형이랑 클래스


# 행렬 객체에 첨자로 접근
m3[2,3] #[행,열] 순서로 접근. 2행3열의 데이터 1개 가져올때 접근.
#자바는 2차원 배열을 int[][]num = new int[2][5](2행5열)/ num[1][3] = 15 
m3[1,] #1행 전체 가져오기
m3[,5] #5열 전체 가져오기
m3[1, c(2:5)] #1행 중에서 2열~5열까지 가져오기.
m3[1, c(2,5)] #1행에서 2열과 5열 데이터만 가져오기.


# 3행 3열로 행렬 객체 생성

x <- matrix(c(1:9), nr = 3, nc = 3) #매개변수는 풀로 쓰지 않아도 되지만, 인식은 가능하게 해줘라
x


# 자료의 개수 보기
length(x) # 데이터 개수. 9개
ncol(x); nrow(x) # 열 / 행 수. 3행 3열


# apply() 함수 적용. 매트릭스 자료형에서 활용이 가능하다.

apply(x, 1, max) #apply(매트릭스 이름, 1(행)/2(열), 함수). 이 경우에는 행단위 최대값 뽑아오기.
apply(x, 1, min) #행 단위 최소값
apply(x, 2, mean) #열 단위 평균값값


# 사용자 정의 적용
f <- function(x){ #변수에 함수 담기 x : 매개변수
  x * c(1,2,3) #열 기준이므로 세로 줄에 각각 수를 곱하기. 
}

# 행 우선 순서로 사용자 정의 함수 적용
result <- apply(x, 1, f) # 행단위로 f함수 적용해라. 
result

# 열 우선 순서로 사용자 정의 함수 적용
result <- apply(x, 2, f)
result

# 행렬 객체에 컬럼명 지정하기
colnames(x) <- c('one', 'two', 'three')
x

## 3. Array 자료 구조

# 3차원 배열 객체 생성하기
vec <- c(1:12) # 12개 벡터 객체 생성
arr <- array(vec, c(3,2,2)) # 3행 2열 짜리를 2개의 면으로 3차원 배열 객체 생성
arr

# 3차원 배열 객체 자료 조회
arr[2,1,2] #2행 1열 2면 조회.
arr[,,1] #1면 전체 데이터 조회
arr[,,2] #2면 전체 데이터 조회
arr[2, ,1] #1면의 2행 데이터 전체 조회


# 배열 자료형과 자료 구조
mode(arr); class(arr)


# 데이터 셋 가져오기
library(RSADBE)
data(Bug_Metrics_Software)
str(Bug_Metrics_Software)

# 데이터 셋 자료보기
Bug_Metrics_Software



## 4. List 자료 구조

# key를 이용하여 value에 접근하기
member <- list(name=c("홍길동", "유관순"), #list함수. key값 이름을 정하고,value값은 벡터형태로 넣으면 된다. combine
               age=c(35, 25),
               address=c("서울", "경기"),
               gender=c("남성", "여성"),
               htype=c("아파트", "오피스텔")) 
member

# key를 이용하여 value에 접근하기
member$name #name의 value값이 모두 출력.
member$name[1] #name의 첫번째 value값. 
member$name[2] #name의 두번째 value값
member$name[3] <- "이순신" #데이터 추가 기능
member$name

member$age <- 45 #데이터 수정 (주의! 하나의 값으로 수정된다.)
member





# 1개 값을 갖는 리스트 객체 생성 
list <- list("lee", "이순신", "35") #key가 없이 설정할 경우. [[n]] - key, [n] - value
list

"""
> # 1개 값을 갖는 리스트 객체 생성
  > list <- list("lee", "이순신", "35")
> list
[[1]]
[1] "lee"

[[2]]
[1] "이순신"

[[3]]
[1] "35"
"""

# 1개 이상의 값을 갖는 리스트 객체 생성
num <- list(c(1:5), c(6:10)) #key값이 없이 리스트가 만들어짐. 
num

# 리스트 자료구조 -> 벡터 구조로 변경하기
unlist <- unlist(num)
unlist

# 리스트 객체에 함수 적용하기
# list data 처리 함수
a <- list(c(1:5))
b <- list(c(6:10))
a; b
c(a,b)

c <- lapply(c(a,b), max) #lapply 함수. apply함수(3개의 데이터를 전달. (배열, 행열값(1/2), 함수))
                    #list로 결과 반환
c 

mode(c); class(c)  # "list" "list". list 모드 함수일 경우 이렇게 반환한다. 



# 리스트 형식을 벡터 형식으로 반환하기
c <- sapply(c(a,b), max) #lapply와 다르게 sapply는 벡터형식으로 반환한다. 
c
mode(c); class(c) # "numeric" "integer"


# 다차원 리스트 객체 생성
multi_list <- list(list(1,2,3), list(10,20,30), list(100,200,300)) #list안에 key값이 없이 value가 또 list 모양. 
multi_list

multi_list <- list(c1=list(1,2,3), c2=list(10,20,30), c3=list(100,200,300))
multi_list

multi_list$c1 #key값이 있으므로 key값으로 출력. 
multi_list$c2
multi_list$c3

mode(multi_list); class(multi_list) #"list" / "list"



# 다차원 리스트를 열 단위로 바인딩
d <- do.call(cbind, multi_list) #다차원 리스트인 multi_list를 columnbind(cbind) 로 하겠다는것. 열 단위 바인딩.  
d
class(d) # "matrix"



## 5. Data Frame 자료 구조

# 벡터 이용 객체 생성 - 열 우선 주의. 
no  <- c(1, 2, 3)
name <- c("홍길동","이순신","강감찬")
pay <- c(150,250,300)
vemp <- data.frame(No=no,Name=name,Pay=pay)
vemp
class(vemp) # "data.frame"

# matrix 이용 객체 생성
args(matrix) #열 우선 (table에서 데이터는 column에 있기 때문에.)
m <- matrix(c(1, "홍길동", 150,
              2, "이순신", 250,
              3, "강감찬", 300), 3, byrow = T) #행 중심 데이터 담기. 
m #문자열이 들어가있으므로 모두 문자열 화 되어있다.
class(m)

memp <- data.frame(m)
memp
class(memp)

# txt 파일 이용 객체 생성
getwd()
setwd("C:/workspaces/Rwork/data")

txtemp <- read.table('emp.txt', header = T, sep = "") #경로를 모두 지정해도 읽을수있다. "C:/workspaces/Rwork/data/~~"
# 정보에 의해서 data frame으로 리턴해준다. 
txtemp
class(txtemp)


# csv 파일 이용 객체 생성(header=T)
csvtemp  <- read.csv('emp.csv', header = T)
csvtemp; class(csvtemp)


# csv 파일 이용 객체 생성(header=F)
name <- c("사번", "이름", "급여") #헤더 정보 설정. 
csvtemp2 <- read.csv('emp2.csv', header = F, col.names = name) #header= column. 없다고 설정하고 col.name=을 위의 name으로 설정. 
csvtemp2


# 데이터프레임 만들기
df <- data.frame(x=c(1:5), y=seq(2, 10, 2), z=c('a', 'b', 'c', 'd', 'e')) #seq(시작, 끝값, 스텝수)
df

# 데이터프레임 컬럼명 참조
df$x #df데이터 프레임의 x값을 불러오기. 

# 자료구조, 열수, 행수, 컬럼명 보기
str(df) #list의 자료구조 값을 넣었을때 출력의 형태를 보여줌. 
ncol(df)
nrow(df)
df[c(2:3)]

# 요약 통계량 보기
summary(df)

# 데이터프레임 자료에 함수 적용
apply(df[,c(1,2)], 2, sum) #(데이터, 행렬구분, 함수). 모든 행에 대해서 x와 y를 열 기준으로 더해라. / lapply (두개의 매개변수를 했을때 list로 변환) sapply (벡터형 반환)

# 데이터프레임의 부분 객체 만들기
x1 <- subset(df, x >= 3) # x가 3이상인 레코드 대상. subset 함수. 데이터 전처리 부분에서 많이 사용됨. 원하는 데이터를 필터링 하는 용도로 사용되는 함수이다. 
x1

y1 <- subset(df, y <= 8) # y가 8이하인 레코드 대상
y1

# 두 개의 조건으로 부분 객체 만들기
xyand <- subset(df, x>=2 & y<=6) #동시 만족
xyand

xyor <- subset(df, x>=2 | y<=6) #둘중 하나
xyor

# student 데이터프레임 만들기
sid <- c('A','B','C','D')
score <- c(90, 80, 70, 60)
subject <- c('컴퓨터', '국어국문', '소프트웨어', '유아교육')

student <- data.frame(sid, score, subject)
student

# 자료형과 자료구조 보기
mode(student); class(student) # list, data.frame
str(sid); str(score); str(subject)
str(student)

# 두 개 이상의 데이터프레임 병합하기
height <- data.frame(id=c(1,2), h=c(180, 175))
weight <- data.frame(id=c(1,2), w=c(80,75))
height; weight

person <- merge(height, weight, by.x = "id", by.y = "id") #id를 기준으로 병합해라. 
person


# galton 데이터 셋 가져오기
install.packages("UsingR") # 패키지 설치
library(UsingR) # 패키지 메모리에 로드
data("galton") # galton 데이터 셋 가져오기
View(galton)

# galton 데이터 셋 구조 보기
str(galton)
dim(galton)
head(galton, 20)
head(galton) # default 갯수:6
tail(galton)


## 6. 문자열 처리

# 문자열 추출하기
install.packages("stringr") # 패키지 설치
library(stringr) # 메모리 로딩

# 형식) str_extract('문자열', '정규표현식') 원하는 데이터를 추출.  
str_extract("홍길동35이순신45강감찬50","[0-9]{2}") #0부터 9까지의 숫자값을 만났을때, 연속으로 2개가 있으면 추출.  
  str_extract_all("홍길동35이순신45강감찬50","[0-9]{2}") #전체 검색


# 반복수를 지정하여 영문자 추출 - 정규표현식
string <- 'hongkildong105lee1002you25강감찬2005'
str_extract_all(string, '[a-z]{3}') #3자 연속 알파벳 추출. 대소문자는 구별한다.
str_extract_all(string, '[a-z]{3,}') #3글자 이상 연속된 알파벳 -> ,를 붙인다.
str_extract_all(string, '[a-z]{3,5}') #3글자 이상 5글자 이하 범위에 속하는 알파벳을 추출.

# 특정 단어 추출 - 정규표현식이 아닌 특정 단어. 
str_extract_all(string, '유관순')
str_extract_all(string, '강감찬')


# 한글, 영문자, 숫자 추출하기
str_extract_all(string, 'hong')
str_extract_all(string, '25')
str_extract_all(string, '[가-힣]{3}') # 한글 검색
str_extract_all(string, '[a-z]{3}') # 소문자 검색
str_extract_all(string, '[A-Z]{3}') # 대문자 검색
str_extract_all(string, '[0-9]{4}') # 숫자 검색


# 한글, 영문자, 숫자를 제외한 나머지 추출하기
str_extract_all(string, '[^a-z]') #제외는 앞에 ^표시
str_extract_all(string, '[^a-z]{4}') #알파벳 제외하고 4연속으로 되어있는 데이터만 출력.
str_extract_all(string, '[^가-힣]{5}') #한글 제외 나머지 
str_extract_all(string, '[^0-9]{3}') #숫자 제외 나머지


# 주민등록번호 검사하기 - 지정된 길이의 숫자 호출
jumin <- '123456-3234567'
str_extract_all(jumin, '[0-9]{6}-[1234][0-9]{6}')
str_extract_all(jumin, '\\d{6}-[1234]\\d{6}') #\\d. 숫자열 탈출 \d -> 자연수

# 지정된 길이의 단어 추출하기
name <- '홍길동1234,이순신5678,강감찬1012'
str_extract_all(name, '\\w{7,}') #연속된 7자이상의 글자면 추출해주세요. (특수문자 제외)
# '\\w' : 한글, 영어, 숫자 포함하되 특수문자는 제외.
# '\\W' : 특수문자 선택.
str_extract_all(name, '\\W')

# 문자열 위치(index) 구하기
string <- 'hongkd105leess1002you25강감찬2005'
str_locate(string, '강감찬')

# 문자열 길이 구하기
string <- 'hongkild105lee1002you25강감찬2005'
len <- str_length(string) # 30
len #30개의 문자열이 저장되어있다. 

# 부분 문자열
string_sub <- str_sub(string, 1, len-7) #길이 -7
string_sub

string_sub <- str_sub(string, 1, 23)
string_sub

# 대문자, 소문자 변경하기
str_to_upper(string_sub) #대문자 변경
str_to_lower(string_sub) #소문자 변경

# 문자열 교체하기
string_rep <- str_replace(string_sub, 'hongkild105', '홍길동35,')
string_rep <- str_replace(string_rep, 'lee1002', '이순신45,')
string_rep <- str_replace(string_rep, 'you25', '유관순25,')
string_rep


# 문자열 결합하기
string_c <- str_c(string_rep, '강감찬55')
string_c


# 문자열 분리하기
string_sp <- str_split(string_c, ',') #"홍길동35,이순신45,유관순25,강감찬55"
string_sp # "홍길동35" "이순신45" "유관순25" "강감찬55"

# 문자열 합치기
string_vec <- c('홍길동35', '이순신45', '유관순25', '강감찬55')
string_vec

string_join <- paste(string_vec, collapse = ',') #"홍길동35" "이순신45" "유관순25" "강감찬55" 로 되어있는걸 ,로 합치기
string_join #"홍길동35,이순신45,유관순25,강감찬55"

