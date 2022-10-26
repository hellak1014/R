# chap01_Basic : 주석문 기호

##############################
#  Chapter01. R 설치와 개요
##############################

# 주요 단축키
# - script 실행 : ctrl+Enter, ctrl+R
# - script 저장 : ctrl+s (현재 파일), Ctrl+alt+s (전체파일 저장)
# - 한영키 눌렀는데 한글이 안되면 최소화 - 최대화 이후 한영키를 눌러봅시다 안되면 리스타트. 

# Library 등록.
# - C:/Program Files/R/R-4.1.2/etc/Rprofile.site 파일에 .libPaths("C:/myRLib/Library") 추가 혹은
# - 사용자 변수 새로 만들기 : 변수 이름 -> R_LIBS, 변수 값 : C:\Users\user\Documents\R\win-library\4.1 으로 셋팅.

print("Hello, R!!!") # ctrl+Enter
#헬로월드 찍는 이유는 명령 내린걸 눈으로 보기 위해서. 가장 첫번째 선행되어야 할 내용이기 때문에 헬로월드를 
#출력하는 것. 화면상의 결과를 보기 위해서. 이 명령어를 이용하면 된다고 소개하는 의미. 



## 패키지와 session 보기

# R package 보기
#package란 ? dimension의 약자(차원). 함수 호출은 약자() 형태. java식이면 available객체에서 packages매서드 호출?
dim(available.packages()) #18688    17
#결론적으로는 기능이 맞다. r에서 제공하는 패키지를 다 불러오라는 기능. dim은 이것을 몇행 몇열로 가져오느냐의 문제.
available.packages() #58개는 보여주고 나머지는 생략중. 



# 패키지 사용법
install.packages("stringr") #패키지 설치. "" 필요!
library("stringr") #메모리에 로딩 : "" . 하지만 library에서만 ""생략 가능.
search() #패키지 메모리 로딩 확인


#패키지 제거
remove.packages("stringr") #utils 제공
search()



# R session 보기
sessionInfo() #utils 제공



#데이터 셋 보기
data() #utils 제공



# 기본 데이터 셋으로 히스토그램 그리기
# 단계1 : 빈도수(frequency)를 기준으로 히스토그램 그리기

hist(Nile) #graphics 제공


#단계2 : 밀도(density)를 기준으로 히스토그램 그리기
hist(Nile, freq = FALSE )


?hist



#단계3 : 단계2의 결과에 분포곡선 (line)을 추가
lines(density(Nile))


#히스토그램을 파일에 저장하기
par(mfrow=c(1,1)) #plots 영역에 1개 그래프만 표시. 
pdf("C:/workspaces/Rwork/output/batch.pdf") #저장위치와 파일 이름 지정
hist(rnorm(20)) #막대그래프 보여주는 것. 데이터 대신 rnorm -> 정규분포를 따르는 랜덤값을 발생시켜주는것. 랜덤하게 20개의 값을 뽑아주라. 
dev.off()


##4. 변수와 자료형. 
# 변수 사용 예. 넣는 모양 주의. <-. =도 가능하지만 =는 매개변수의 값을 초기화하거나 값을 넣을때 할때 사용하고, 값을 넣을때는 <-를 쓴다. 
age <- 25
age
age <-35 #기존 변수를 재사용 가능하다. 
age
#어떨때는 print. 어떨때는 그냥 ctrl+enter? -> R스튜디오에서는 ctrl+enter하면 바로 출력해서 그닥 쓸모가 없다.


#변수, 멤버 형태로 변수 선언 예
var1 <-50
var2 <- 100

goods.model <- "lg-320" #상품 모델명
goods.model <- "냉장고"
goods.price <- 850000
goods.desc <- "퐁급 최고 품질/사양" #하나의 오브젝트를 바라보는 것으로 구분될 수 있다. .은 연산자가 아니라 그냥 이름.

#스칼라 변수 사용 예.
name <- "홍길동"
name

#자료형
int<-20 #숫자형(정수)
double <- 3.14
string <- "홍길동"
boolean <- TRUE #진리값 : TRUE(T) / FALSE(F)
boolean

boolean <- 3.14
boolean #가능하다. boolean은 변수의 이름처리 된다. 


#자료형 확인. 
#자료형이 따로 없기 때문에 자료형에 어떤 형식의 데이터가 들어있는지 알 수 없다. 동적 할당 언어.
#현재 변수에 어떤 자료형이 담겨있는지 보기. is.numeric(). true, false 반환. 
is.numeric(int) #변수를 넣었을때 수치형인지 체크해줌. TRUE -> 사실상 실수.
is.integer(int) #FALSE : 정수 값도 부동소숫점으로 관리. R은 20을 20.0으로 넣는다. -> 그럼 얘는 트루가 없겟네요?
is.double(int) #TRUE. 20.0으로 들어가잖아요. 

castInt <- as.integer(int) #as는 형변환의 개념. 
is.integer(castInt) #TRUE

is.numeric(double) #TRUE #수치형이니? 네. 정수가 아니어도 괜찮아요
is.double(double) #TRUE #실수형

is.character(double) #FALSE #3.14
is.character(string) #TRUE  #홍길동
is.character("double") #TRUE #double라는 글자 자체가 대상이므로 트루.


#변수에 하나의 값이 들어가는 것은 스칼라 변수.
#변수에 두개 이상의 값이 들어가는 것은 벡터 변수.

#문자 원소를 숫자 원소로 형변환
x <- c(1,2,3) #combine 함수. 
x

#숫자 원소를 문자 원소로 형변환
y <- c(1,2,"3")
y    #서로 다른 형태의 원소는 저장할 수 없다. 만약 그럴 경우 모두 char화 시켜버림. 

result <- x*3
result

result <- y*5 #Error in y * 5 : non-numeric argument to binary operator
result

result <- as.integer(y)
result2 <- result * 5
result2

#복소수형 자료 생성과 형변환.  
z <- 5.3 -2i
Re(z) #실수만 가져옴 5.3
Im(z) #허수에 붙어있는 수만 가져옴 -2
is.complex(z) #true z는 복소수니?
as.complex(5.3) #5.3+0i. 입력값이 실수여도 강제로 형변환 해줌. 

#스칼라 변수의 자료형 확인
mode(int) #numeric
mode(string) #character
mode(boolean) #logical

# 문자 벡터와 그래프 생성  (벡터 :두개 이상의 데이터)
gender <- c('man', 'women', 'women', 'man', 'man')
gender

mode(gender) #character
class(gender) #character

 #에러. 얘네는 문자형이기 때문에 그래프 생성이 불가.

#요인형 변환
#as.factor() 함수 이용범주 (요인)형 변환
Ngender <- as.factor(gender) #factor란...?
Ngender
table(Ngender)

#Factor형 변수로 처리 후 그래프 생성.
plot(Ngender)
mode(Ngender) #numeric
class(Ngender) #factor
is.factor(Ngender) #TRUE


#Factor Nominal 변수
Ngender #데이터의 정보와 levels의 정보를 같이 출력해줌.

#Factor() 함수 이용 Factor형 변환
args(factor) #factor 함수 정보. ?factor
Ogender <- factor(gender, levels = c('women', 'man'), labels =c("여자", "남자"), ordered = TRUE) #character, levels(순서를 바꿀수 있다), labels=levels, ordered 순서. 
Ogender

#순서 없는 요인과 순서 있는 요인형 변수로 차트 그리기
par (mfrow=c(1,2)) #한 화면에 차트 두개. 1행에 2열. 
plot(Ngender)
plot(Ogender)


#도움말 보기
i <- sum(1,2,3)
i

help(sum) #sum에 대한 사용방법
?sum #같음

#함수 파라미터 보기
args(sum)

#함수 사용예제 보기
example(sum)

#작업 공간 지정
getwd() #작업 공간 보여주는 함수
setwd("C:/workspaces/Rwork/data") #껏다키면 원상복구됨. 디폴트로 잡으려면 tools - global options 에서 설정. 디폴트 위치 바꾸기.
