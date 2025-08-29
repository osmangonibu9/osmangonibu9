
# --------------------------------------------------- #
# Class: 3 
# Conditional Matrix, Dataframe,List, Array, statements, Loops and Functions
# Author: Md. Osman Goni
# Date: 28 August 2025
# --------------------------------------------------- #

# Matrix ///////////////////////////////////////////////////////////////
help('matrix')

# matrix (data = NA, nrow = 1, ncol = 1, byrow = FALSE)

mat1 <- matrix(c(7, 4, 8, 9), ncol = 2, nrow = 2, byrow = T)
mat1
is.matrix(mat1)

# one 1,3 matrix
mat2<-matrix(c(0,17,2), ncol = 3)
is.matrix(mat2)
mat3<-(c(0,9,2))
is.matrix(mat3)

#here [row,column]
mat1[,]
mat1[1,]
mat1[,2]
mat1[1,2]
mat1[1,2] <- 0
mat1 

mat4 <- matrix(c(0, 4, 6, 3), 2, byrow = TRUE)
mat4

mat1+mat4
mat1-mat4
diag(mat4) # ROW AND COLUMN SAME

mat5 <- matrix(c(11, 7, 2, 3, 5, 7), 3, byrow = TRUE)
mat5
dim(mat5)

as.vector(mat5[,2])


## Element wise multiplication

mat1 * mat4

## matrix multiplication

mat1 %*% mat4
dim(mat1)
dim(mat4)
dim(mat1 %*% mat4)

mat1 %*% mat5  # will raise an error
dim(mat1)
dim(mat5)
dim(mat1 %*% mat5)

mat5 %*% mat1  # it will work
dim(mat5)
dim(mat1)
dim(mat5 %*% mat1)


# Array /////////////////////////////////////////////////////
# array(c(data),c(row, column, number of metrix))
help ("array")
arr1 <- array(c(1:12), c(2,3,2))
arr1
arr2<-array(1:3, c(2,4)) 
arr2

# Data Frame /////////////////////////////////////////////

# why here use = not <-
df1 <- data.frame(id = c(7,2,3, 4), 
                  age = c(21, 33, 19, NA), 
                  gender = c("F","M","M", "F"), 
                  address =c("Dhaka","Barishal","Rajshahi","Khulna"),
                  stringsAsFactors = TRUE # decrease size, without numeric we can't calculate
                  ) # (Environment) factor with ........ level, number input ascending
df1

is.data.frame(df1)
summary(df1)

View(df1)

df2 <- data.frame(id = c(7,2,3, 4), 
                  age = c(21, 33, 19, NA), 
                  gender = c("F","M","M", "F"), 
                  address =c("Dhaka","Barishal","Rajshahi","Khulna"),
                  stringsAsFactors = F # decrease size, without numeric we can't calculate
)
df2
summary(df2)

# Vector level /////////////////////////////////////////////
as.factor(c("F","M","F", "F"))

# Data type check /////////////////////////////////////////////
is.character(c("F","M","F", "F"))
is.factor(as.factor(c("F","M","F", "F")))
is.numeric(as.factor(c("F","M","F", "F")))
is.numeric(c(1,2,3,4))

## Column value check /////////////////////////////////////////////

df1$id
df1$age
mean(df1$age)
mean(df1$age, na.rm=T)
mean(df1$id)
df1$gender
df1$address

## row and column names /////////////////////////////////////////////

rownames(df1)
# input row name
rownames(df1)<- c("person_1","person_2", "person_3","person_4")
df1

colnames(df1)
##modify column name (age_of_respondent)
colnames(df1) <- c('id','age_of_respondent','gender','Address')
df1

## Logically column name change
colnames(df1)== "gender"
colnames(df1)[colnames(df1)== "gender"]<-"Gender"
df1


## Filter 
df1[2,]
df1[c(1,4),]
df1$`age_of_respondent`<=23


df1[df1$age_of_respondent<=23, ]

# to skip the NA
!is.na(df1$age_of_respondent) #check
is.na(df1$age_of_respondent)#check

df1[df1$age_of_respondent<=23 & !is.na(df1$age_of_respondent), ]


## add new column /////////////////////////////////////////////

df1$height <- c(4, 6, 6.5) # arise Error because observation is not equal
df1

df1$height <- c(5, 3, 5.5, 6) # will work
df1

## It's easy in dplyr function (check package dplyr)

# List /////////////////////////////////////////////
# List can contain heterogeneous elements such as numbers, 
# strings, vectors, matrices, data frames, or even other lists.
# List one kind of Dictionary
# It's use for collecting different types of information

ls1 <- list(c(1,2,3), c(24,23,19), c("F","M","F"))
ls1
# Data frame name create (id, age, gender)
ls2 <- list(id = c(1,2,3), age = c(21, 23, 19), gender = c("F","M","F"))
ls2$age

ls3 <- list(id = c(1,2,3), age = c(21, 23, 19), gender = c("F","M","F"),df=df1, array1 = arr1)
ls3

# Select list
ls1[[3]][2]

is.data.frame(ls3$df)

#Check List charecter
str(ls3)

## Conditional statement
## Loops
## Function

## Multiple line expression {} or ;

print("Hi")
1+5

{
  print("Hi")
  1+5
}

print("Hi"); 1+5


# Conditional //////////////////////////////////////////

# if(condition){
#   code} else if (condition){
#   code}else{code}

x <- 3
# CTRL+SHIFT+A
if (x > 0) {
  print("x is positive")
} else {
  print("x is not positive")
}


x1 <- 0

# code reform=Control+shift+A
if (x1 > 0) {
  print("x is positive")
} else if (x1 < 0) {
  print("x is negative")
} else {
  print("x is zero")
}


## Nested if else statement####

x3 <- 9

if (x3 > 0) {
  if (x3 %% 2 == 0) {
    print("x is positive and even")
  } else {
    print("x is positive and odd")
  }
} else {
  print("x is not positive")
}


## Vectorized version ####
# ifelse not else if remind it

x <- c(1, 3, 0, 5, 99)
ifelse(x > 90, "Yes", "No")
ifelse(x > 90, "Yes", ifelse(x == 0, "zero", "No"))

## switch ####

operation <- "root"
val <- 9

switch(operation,
       "square" = val^2,
       "root" = sqrt(val),
       NA
       )


# Loop /////////////////////////////////////////////////////


## for loop ####
# In R by default inrease, but in C, c++ need i++ in for loop 
help("for")

numbers <- c(2, 4, 6, 8)
for (i in numbers) {
  print(paste("Square of", i, "is", i^2))
}

## 3 multiplication table
for (i in 1:10) {
  print(paste("3 x", i, "=", 3*i))
}



for(i in 1:5) print(1:i)

# Right side pyramid 

n <- 4  # Number of rows

for (i in 1:n) {
  spaces <- n - i
  stars <- i
  line <- paste(strrep(" ", spaces), strrep("*", stars))
  print(line)
}

##For repeat
strrep("Osman", 3)


# Middle pyramid

n <- 4  #  row

for (i in 1:n) {
  spaces <- n - i
  stars <- 2*i - 1
  line <- paste0(strrep(" ", spaces), strrep("*", stars))
  print(line)
}

## while loop ####

count <- 5
while (count > -10) {
  print(count)
  count <- count - 1
}

## repeat #####

repeat {
  print("This is an infinite loop. Press ESC to stop.")
  Sys.sleep(1)  # Pause for 1 second
}



# Stop when counter exceeds 5
counter <- 1
repeat {
  print(counter)
  Sys.sleep(1)
  counter <- counter + 1
  if (counter > 5) {  
    break
  }
}



# Stop when the sum exceeds 20
cumulative_sum <- 0
i <- 1
repeat {
  cumulative_sum <- cumulative_sum + i
  print(cumulative_sum)
  i <- i + 1
  if (cumulative_sum > 20) {  
    break
  }
}

# alternative way
cumsum(1:10)


# user input
readline()
as.integer(readline("Enter your number: "))

x <- as.integer(readline("Enter your number: "))

repeat {
  input <- as.integer(readline(prompt = "Enter a number between 1 and 10: "))
  if (!is.na(input) & input >= 1 & input <= 10) {
    print(paste("You entered:", input))
    break
  } else {
    print("Invalid input, try again.")
  }
}



## 'Apply' functions #### R unique function

mat <- matrix(1:9, nrow = 3, byrow = TRUE)
mat
sum(mat)
apply(mat, 1, sum)  # Sum of each row , here 1 means row
apply(mat, 2, sum)  # Sum of each column

## same 
rowSums(mat)
colSums(mat)

rowMeans(mat)
colMeans(mat)

## tapply ####

# tapply performs operations on subsets of the object of interest
df1 <- data.frame(age=c(28,20,NA,25,19,23),
                 gender=c("M","F","F","M","M","F"),
                 location=c("Rural","Urban","Urban","Rural","Rural","Rural"),
                 stringsAsFactors=TRUE)
df1

tapply(X=df1$age, INDEX=df1$gender, FUN=mean, na.rm = T)
tapply(X=df1$age, INDEX=list(df1$gender, df1$location), FUN=mean, na.rm = T)


## lapply and sapply ####

ls3 <- list(id = c(5,3,3), age = c(4, 13, 9))
ls3
lapply(ls3, is.data.frame)
sapply(ls3, is.data.frame)


