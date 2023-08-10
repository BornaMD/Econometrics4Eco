library(TeachingDemos)
txtStart("Homework 8.txt")
# Homework Assignment 8
# Name: Borná Djavdan 
# ANR: 749817
# Group: 2EBE-ES-01

# Exercise 2
load("~/Study/Semester 3/Econometrics for ECO/R Files/R Data/crime1.RData")
attach(data)

#a
arr86 <- ifelse(narr86>0,1,0)
reg1<-lm(arr86~pcnv+avgsen+tottime+ptime86+qemp86)
reg1

summary(reg1)
summary(reg1$fitted.values)

#b
h <- reg1$fitted.values
reg2 <- lm(arr86~pcnv+avgsen+tottime+ptime86+qemp86, weights = 1/h)
summary(reg2)

#c
reg3<-lm(arr86~avgsen+tottime)
reg3

summary(reg3)
summary(reg3$fitted.values)

h <- reg3$fitted.values
reg4 <- lm(arr86~avgsen+tottime, weights = 1/h)
summary(reg4)

detach(data)
rm(list=ls())

# Exercise 3
load("~/Study/Semester 3/Econometrics for ECO/R Files/R Data/gpa1.RData")
attach(data)

#a
reg1<-lm(colGPA~hsGPA+ACT+skipped+PC)
reg1
summary(resid(reg1))

#b
reg2 <- lm(resid(reg1)^2~colGPA+colGPA^2)
reg2
h_ihat <- reg2$fitted.values
summary(reg2$fitted.values)

#c
reg3<-lm(colGPA~hsGPA+ACT+skipped+PC, weights = 1/h_ihat)
reg3
summary(reg1)
summary(reg3)

detach(data)
rm(list=ls())
txtStop()