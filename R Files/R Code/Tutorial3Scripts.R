# TUTORIAL 3. IN-CLASS EXERCISES DO-FILE
# 15 SEPTEMBER 2017

# Commands from tutorial 1:

load()
View()
names()
attach()
detach()
help()

dim()
summary()
length()
table()
prop.table()
mean()
sd()
cor()

#Additional commands for today
lm(y~x)
plot(x,y,type="p")    #options for type: p,l,b,o,s,h (try out)
abline()

cbind(x,y)
head()                # or use tail(data) for bottm 6 rows
names()
rm(list=ls())
log()
sum()
read.dta()

# PROBLEM 1.

load("401k.RData")
attach(data)
desc
# observation unit is a firm

#(a) Find the average participation rate and average match rate

q1<-cbind(prate,mrate)
summary(q1)

# average mrate = 0.73
# average prate = 87.36

head(q1)

#(b) Estimate the model: prate = b0 + b1*mrate

lm(prate~mrate)

# prate = 83.08 + 5.86 * mrate

Reg1<-lm(prate~mrate)  #save the regression results as an object

Reg1
  names(Reg1)
  Reg1$fitted.values
summary(Reg1)
length(Reg1$fitted.values)

# n = 1534, R^2 = 0.0747

plot(mrate,prate)
abline(Reg1)
#plot(Reg1)            #gives 4 needless graphs

#(c) Interpret b0 and b1:
  
# b0 - Expected prate is 83.08 when mrate = 0.
# b1 - 1USD increase in the match rate is predicted to increase participation rate by 5.86 percentage points.

#(d) Find predicted prate when mrate = 3.5

Reg1$coefficients
83.08+5.86*3.5

# predicted prate is 103.59, which is not meaningful. The regression model does not 
# behave well at high levels of mrate.

#yhat<-fitted(Reg1)
#uhat<-resid(Reg1)

#(e) 7% of the variation in prate is explained by mrate.

summary(Reg1)

SST<-sum((prate-mean(prate))^2)
SSR<-sum(Reg1$residuals^2)
SSE<-sum((Reg1$fitted.values-mean(prate))^2)

1-SSR/SST
SSE/SST

detach(data)
rm(list=ls())

# PROBLEM 2.

load("ceosal2.RData")
attach(data)

#(a) Find the average salary and the average tenure in the sample.

desc
q2<-cbind(salary,ceoten)
head(q2)
summary(q2)

#Average salary 865864 USD/yr, Average tenure as CEO is 8 years.

#(b) How many CEO's in their first year? What is the longest tenure?

table(ceoten)

length(ceoten[ceoten==0])  #do not forget == (not =)
summary(ceoten)

# There are 5 observations with ceoten=0. 2 observations with max. tenure of 37 years.

#(c) Plot of salary and ceoten

plot(ceoten,salary)

# Plot points to a positive correlation. Correlation is 0.1429.

#(d) Estimate the simple regression model: salary = b0 + b1*ceoten + u

Reg1<-lm(salary~ceoten)
Reg1
summary(Reg1)

# Results in equation form:
# salary = 772.43 + 11.75 * ceoten

# Results on a graph:
abline(Reg1)

#(d.i) How would you interpret b1?

# An extra year as a CEO is predicted to increase salary by 11750 USD/year.

#(d.ii) What assumptions have you made in your interpretation?

# 1. Model specification is correct (E(Y|X) is a linear function of X)
# 2. Random sample
# 3. There is variation in x (already true, since we were able to estimate b1) 
# 4. Zero conditional mean

# (e) Now, estimate the simple regression model: ln(salary) = b0 + b1*ceoten + u

desc
summary(salary)
lsalary<-log(salary)

Reg2<-lm(lsalary~ceoten)
Reg2

# ln(salary)=6.505+0.010*ceoten

# (e.i) Why might you take a natural log of salary?

# 1. If the expected value of salary is not a linear function of ceoten, but the log of salary is. 
# (ie. the semi-elasticity model depicts the relationship better than a constant unit change model.)
# 2. I am interested in the percentage change in salary predicted by a unit change in ceoten.

# (e.ii) Interpret the results. Hint: LN

# lsalary = 6.51 + 0.0097*ceoten
# n = 177, R^2 = 0.013

# One more year of experience as a CEO is predicted to increase salary by 0.97 percent on average. 

detach(data)
rm(list=ls())


# PROBLEM 3.

load("rdchem.RData")
attach(data)
desc            # Data of 32 firms 

# (a) Write down a model (not an estimated equation) that implies a constant elasticity
# between rd and sales. Which parameter is the elasticity?

# ln(rd) = b0 + b1*ln(sales) + u					Elasticity of rd. wrt. sales

# ln(sales) = b0 + b1*ln(rd) + u   				Elasticity of sales wrt. rd

# (b) Now, estimate the model using the data. Write out the estimated
# equation in the usual form. What is the estimated elasticity of rd with respect to
# sales? Explain in words what this elasticity means.

desc
Reg1<-lm(lrd~lsales)
Reg1

# ln(rd)= -4.10 + 1.08 * ln(sales)
# n = 32, R^2 = 0.91

# 1 percent increase in sales is predicted to increase rd expenditure by 1.08 percent.

detach(data)
rm(list=ls())

# PROBLEM 4.

library(foreign)
data<-read.dta("countymurders.dta")

library(haven)
data<-read_dta("countymurders.dta")

attach(data)
names(data)
summary(year)
table(year)
murders<-data$murders[data$year==1996]
execs<-data$execs[data$year==1996]

# left with 2197 counties

# (a) How many counties had zero murders in 1996? How many counties had at least one
# execution? What is the largest number of executions? */

length(murders[murders==0])
# 1051 counties with no murders

length(execs[execs>=1])
# 31 counties with 1 or more executions

summary(execs)
# max is 3

# (b) Estimate the equation

Reg1<-lm(murders~execs)
Reg1
summary(Reg1)

# murders = 5.46 + 58.56 * execs + u
# n = 2197, R^2 = 0.0439

length(Reg1$fitted.values)

#(c) Interpret the slope coefficient reported in part (c). Does the estimated equation
# suggest a deterrent effect of capital punishment?*/

# Each additional execution in a county is predicted to increase number of murders by about 59. 
# No.

# (d) What is the smallest number of murders that can be predicted by the equation?
# What is the residual for a county with zero executions and zero murders?*/

# murders = 5.46 when execs=0
# residual = y - yhat

# y = 0 	(actual is given by question)
yhat<- 5.46 + 58.56*0
res<- 0-yhat
res

# residual = y - yhat = -5.46

# (e) Explain why a simple regression analysis is not well suited for determining whether
# capital punishment has a deterrent effect on murders.*/

# It may be that the assumed population model is incorrect. It may well be that executions are more in states
# with high number of murders.

# It may also be that other things that lead to murders and correlated with executions are not controlled for. 

detach(data)

