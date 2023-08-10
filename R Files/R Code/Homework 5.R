library(TeachingDemos)
txtStart("Homework assignment 5.txt")
# Homework Assignment 5
# Name: Borná Djavdan 
# ANR: 749817

# Exercise 2
load("~/Study/Semester 3/Econometrics for ECO/R Files/R Data/hprice2.RData")
attach(data)
# c
Reg1<-lm(lprice~lnox)
summary(Reg1)
nobs(Reg1)

Reg2<-lm(lprice~lnox+rooms)
summary(Reg2)
nobs(Reg2)

# e
lm(rooms~lnox)

detach(data)

# Exercise 3
load("~/Study/Semester 3/Econometrics for ECO/R Files/R Data/discrim.RData")
attach(data)

# a
mean(na.omit(prpblck))
mean(na.omit(prppov))
mean(na.omit(income))
sd(na.omit(prpblck))
sd(na.omit(prppov))
sd(na.omit(income))

# b
OLS_reg1 <- lm(lpsoda~prpblck+lincome+prppov)
summary(OLS_reg1)
length(OLS_reg1$fitted.values)

# Gives Error I was not able to solve: t.test(lpsoda, prpblck, data, conf.level = 0.95)

# c 
cor(lincome,prppov, use="na.or.complete")

# d
regr<-lm(lpsoda~prpblck+lincome+prppov+lhseval)
summary(regr)
nobs(regr)

# e

library("carData")
library("car")
H0<-c("lincome=0","prppov=0")
linearHypothesis(regr,H0)

detach(data)
txtStop()