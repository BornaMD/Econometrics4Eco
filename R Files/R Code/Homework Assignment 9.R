rm(list=ls())
library(TeachingDemos)
txtStart("Homework 9.txt")
# Name: Borná Djavdan 
# ANR: 749817
# Group: 2EBE-ES-01

# Exercise 4
load("~/Study/Semester 3/Econometrics for ECO/R Files/R Data/intdef.RData")
attach(data)
# a
reg1<-lm(i3~inf+def)
summary(reg1)

# b
post1979 <- as.numeric(year > 1979)
Reg2 <- lm(i3 ~ inf + def + post1979)
summary(Reg2)


detach(data)
txtStop()