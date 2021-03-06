getwd()
x1 <- matrix(1:8, ncol =2)
x1
x1<-x1*3
x1


ex1 <- matrix(1:5, 3, 3); ex1
ex2 <- rbind(ex1, c(1,2,3,4));ex2

score <- c (1,2,3,4,2,1,3,5,1,3,3,3)
class(score)  ## 어떤 타입으로 구성된 데이터셋인지
summary(score)

f_score <- factor(score); f_score
class(f_score)
score
f_score
summary(f_score)
levels(f_score)

plot(score)
plot(f_score)


data1 <- c("월", "수", "토", "월", "목","화"); data1

class(data1)
summary(data1)
day1 <- factor(data1)
day1
class(day1)
summary(day1)
plot(data1)
plot(day1)


week.korname <-c("일", "월", "화", "수", "목", "금", "토")
day2 <- factor(data1, levels=week.korname)
levels(day2)
levels(day1)
plot(day2)
plot(day1)
summary(day2)


btype <- factor (
  c("A", "O", "AB", "B", "O", "A"),
  levels=c("A", "B", "O")
)
btype
summary(btype)

gender <- factor(c(1,2,1,1,1,2,1,2),
                 levels=c(1,2),
                 labels=c("남성", "여성"))
gender
summary(gender)


data()
iris
head(iris)
tail(iris)
View(iris)
str(iris)









#Dataframe 실습
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)
str(fruit)
View(fruit)

fruit[1,]
fruit[-1,]
fruit[,2]
fruit[,3] # fruit[,3, drop=F]
fruit[, c(3,4)]
fruit[3,2]
fruit[3,1]

fruit[,3]
fruit$qty
fruit[[3]]
fruit[3]  # 데이터프레임 형식 유지

str(fruit$qty)
str(fruit[3])

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(
  english, math, classnum)
df_midterm
str(df_midterm)
colnames(df_midterm)
rownames(df_midterm)
names(df_midterm)
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2))
colnames(df_midterm2)
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 오류
df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1))
str(df)
df$var_sum <- df$var1 + df$var2
df$var_mean <- df$var_sum/2
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다")

getwd() # setwd('xxx')

#csv파일열기
score <- read.csv("data/score.csv")
score
str(score)
score$sum <- 
  score$math+score$english+score$science
score$result <- ifelse(score$sum >= 200, 
                       "pass", "fail")
score

summary(score$result)
table(score$result)
summary(factor(score$result))   #팩터형으로 바꾼 다음에 서머리 하는 것이다. -> 일시적 형변환
score$result = factor(score$result) 
str(score)
summary(score)
score$id = as.character(score$id)
score$class = factor(score$class)

score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D")))
score

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v)
order(v)





emp <- read.csv(file.choose(),
                stringsAsFactors = F)
emp
str(emp)

# 1. emp에서 직원 이름
emp$ename
emp[,2]
emp[,"ename"] 
emp[,2, drop=FALSE] 
emp[,"ename",drop=F] 
emp[2]
emp["ename"] 

# 2. emp에서 직원이름, 잡, 샐러리
emp[,c(2,3,6)]
emp[,c("ename","job","sal")]
subset(emp,select = c(ename, job, sal))
?subset
# 3. emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]

# 4. ename이 "KING"인 직원의 모든 정보
emp[9,] 
emp$ename=="KING"
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,
      F,F,F,F,F,F,F,F),]
subset(emp,subset= emp$ename=="KING")
subset(emp,emp$ename=="KING") 

emp[emp$ename=="KING",] 

subset(emp)

# 5. select ename,sal from emp where sal>=2000
subset(emp, select=c("ename","sal"), subset= emp$sal>= 2000)
subset(emp, emp$sal>= 2000, c("ename","sal"))
emp[emp$sal>=2000,c("ename","sal")]

# 6. select ename,sal from emp where sal between 2000 and 3000
subset(emp, select=c("ename","sal"), subset=(sal>=2000 & sal<=3000))
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")]


emp[!is.na(emp$comm), c("ename", "comm")]



