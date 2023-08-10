# TUTORIAL % - SCRIPT

# PROBLEM 1. Use meap93.RData. 
# MEAP - Michigan Educational Assessment Program - Standardized test for secondary school students in Michigan

# Look at the question as a whole. Do you recognize the topic/problem of this question? 
# Omitted variable, with multicollinearity, bias
# What does the dataset refer to?

load("meap93.Rdata")
attach(data)

# (a) Estimate the model. Are the signs of the slope coefficient what you expected?

desc
summary(cbind(math10,lnchprg,expend))

Reg1<-lm(math10~lexpend+lnchprg)
summary(Reg1)
nobs(Reg1)

# math10 = -20.36 + 6.23*lexpend - 0.30 lnchprg + u
# n = 408, R-sq 0.18 

names(Reg1)
names(summary(Reg1))

summary(Reg1)$sigma    #residual standard error - hat.sigma
summary(Reg1)$r.squared

# lexpend - expected sign and magnitude (mean 4377USD/Student, approx. 44$ increase causes 0.06 p.p increase
# lnchprg - unexpected sign (1 p.p more student in lnchprg causes 0.30 p.p decline in pass rate)

# (b) What do you make of the intercept you estimated in part (a)? 
# In particular, does it make sense to set the two explanatory variables to zero? 

summary(cbind(lnchprg,expend))

# If lexpend = 0 (or expend = 1 USD/student), lnchprg = 0%, then math pass rate is -20.36

# The intercept is not meaningful because a pass rate cant be negative, 
# also it is not meaningful because average expenditure per student equal to 1
# is far off from the minimum expenditure per student. 

# (c) Now run the simple regression of math10 on ln(expend), and compare the slope
# coefficient with the estimate obtained in part (a). Is the estimated spending effect
# now larger or smaller than in part (a)?

Reg2<-lm(math10~lexpend)

# math10 = -69.34 + 11.16*lexpend

# Higher than previous estimate, it means that the correlation between 
# lexpend and lnchprg must be negative

# remember: gamma1=beta1+beta2*delta1

# (d) Find the correlation between ln(expend) and lnchprg. Does its sign make sense to you?

cor(lexpend,lnchprg)
detach(data)
# PROBLEM 2.
# Use the data in gpa1.RData for this exercise.

load("gpa1.RData")
attach(data)

# (a) Estimate a model explaining college GPA in terms of high school GPA (hsGPA),.

reg1<-lm(colGPA~hsGPA + ACT + skipped)

# colGPA = 1.390 + 0.412*hsGPA + 0.015*ACT - 0.083*skipped

# (b) Using the standard normal approximation, find the 95% confidence interval for hsGPA.

confint(reg1)
confint(reg1,level=0.95)

# (0.227, 0.597)

#manually: 
coef<-summary(reg1)$coefficients
nobs(reg1)

hathsgpa<-coef[2,1]
crit.v<-qt(1-0.05/2,nobs(reg1)-4)
se<-coef[2,2]

hathsgpa-crit.v*se  #lower limit.

# (c) Can you reject the hypothesis H0: hsGPA = 0 against the two-sided alternative at
# the 5% level?

# 1. Hypothesis: H0: b_hsGPA=0, Ha: b_hsGPA!=0
# 2. t or F: t
# 3. if f-test:
#    null: 0 
#        thus reported t-value can be used
#    side - 2 sided, 
#    significance level: 5%
#        thus conventional p-value can also be used
# 3. if F-test:
#    null: 0,
#    all coefficients or not?
# 4. If conventional numbers can't be used, compute t,F values and
#    compare with critical value of t, F.
#    Alternatively, compute the p-value and compare with necessary significance level

summary(reg1)

# t-value: 4.396    
# p-value: 0.00002  < 0.05
# Reject H0 in favor of Ha

# Check critical values by hand:
qt(1-0.05/2,nobs(reg1)-4)  # two-sided critical value of t-db at 5% significance level

# Compute t-value by hand: 
coef[2,1]/coef[2,2]
# Check p-value by hand:
2*(1-pt(4.39626,nobs(reg1)-4))  #two-sided p-value

# (d) Can you reject the hypothesis H0: hsGPA = 0.4 against the two-sided alternative
# at the 5% level?

# 1. Hypothesis: H0: b_hsGPA=0.4, Ha: b_hsGPA!=0.4
# 2. t or F: t
# 3. null - 0.4    - reported t-value can't be used, thus p-value neither
#    side - 2 sided, sign.level - 5%
#    conventional reported values can't be used
# 4. Compute t, p or critical value of t-db

coef
bhat<-coef[2,1]
se<-coef[2,2]

t<-(bhat-0.4)/se
t

#p-value:
2*(1-pt(t,nobs(reg1)-4))   
2*pt(-t,nobs(reg1)-4)
# p-value = 0.900. Do not reject hypothesis

# Alternatively, critical value of t-db:
qt(1-0.025,137)
# critical value of t: 1.977, since t=0.12 is less than the critical value 1.977,
# we do not reject the hypothesis

detach(data)
rm(list=ls())


# PROBLEM 3. 
# Use the data ceosal1.Rdata for this exercise. Consider an equation to explain salaries of
# CEOs in terms of annual firm sales, return on equity (roe, in %), and return on the firms
# stock (ros, in units):

# (a) In terms of the model parameters, state the null hypothesis that, after controlling
# for sales and roe, ros has no effect on CEO salary. State the alternative that better
# stock market performance increases a CEOs salary.

# Hypothesis: H0: b3=0; Ha: b3>0

# (b) Estimate the model in part (a) and report the results in the usual form. By what
# percentage is salary predicted to increase if ros increases by 50 points? Does ros
# have a practically large effect on salary?

load("ceosal1.RData")
attach(data)
desc
summary(cbind(salary,sales,roe,ros))

reg1<-lm(lsalary~lsales + roe+ros)
summary(reg1)
nobs(reg1)

# lsalary=4.312+0.28*lsales+0.017*roe+0.0002*ros
# n = 209, R-sq=0.28

50*reg1$coefficients[4]*100

# If ros increases by 50 usd, salary will increase by about 1.2%
# Appears not large effect.

# (c) Test the null hypothesis that ros has no effect on salary against the alternative
# that ros has a positive effect. Carry out the test at the 10% signiffcance level.

# 1. Hypothesis: H0: b3=0, Ha: b3>0
# 2. t-test
# 3. null: 0   - thus can use reported t-value
#    side: 1 sided - can't use reported p-value
#    significance level: 10#
# 4. find critical value of t

coef<-summary(reg1)$coefficients
coef
t<-coef[4,3]

crit.value<-qt(1-0.05,nobs(reg1)-4)
crit.value

t<crit.value   # Fail to reject hypothesis in favor of Ha

# (d) Test the null hypothesis that none of the explanatory variables has effect 
# on salary at 5% level.

# 1. H0: b1=0,b2=0,b3=0; Ha: at least one of b1, b2, b3 is not equal to 0
# 2. F-test
# 3. nul: 0
#    all coefficients 
#        thus reported F-value can be used

summary(reg1)

# F-stat 26.93, p-value 1.001e-14. Thus reject at 10% level.

# or check critical value of F:

qf(1-0.1,3,nobs(reg1)-4)

# reject at 10% level

H0<-c("lsales=0","roe=0","ros=0")
linearHypothesis(reg1,H0)

# (e) Test the null hypothesis that the variables ros and roe are jointly insignificant after
# controlling for ln(sales). Carry out the test at 5% level.

# 1. H0: b2=0,b3=0, Ha: at least one of b2 and b3 is not equal to 0.
# 2. F-test
# 3. null = 0s
#    not all coefficients
#    thus need to calculate F-value or use package(car)

H0<-c("roe=0","ros=0")
linearHypothesis(reg1,H0)

# F=10.27, p=0.00005. Thus reject H0 in favor of Ha

# compute F:
rest<-lm(lsalary~lsales)
rest
# rest<-lm(lsalary~rep(1,209)+lsales+0*roe+0*ros)
# rest
ssrr=sum(rest$residuals^2)
sumrest=summary(rest)  

ssru=sum(reg1$residuals^2)
sumunrest<-summary(reg1)

F<-(ssrr-ssru)/ssru*(205/2)
F

F1<-(sumunrest$r.squared-sumrest$r.squared)/(1-sumunrest$r.squared)*(205/2)
F1

F>qf(1-0.05,2,205)

sumunrest$r.squared
sumrest$r.squared

# Reject null hypothesis in favor of Ha
# (f) Would you include ros in a final model explaining CEO compensation in terms of
# firm performance? Explain.


# EXTRA: 
# PROBLEM 4. Use the data in hprice1.RData to estimate the model ... where price 
# is the house price measured in thousands of dollars.

load("hprice1.RData")
attach(data)

# (a) Write out the results in equation form.

reg1<-lm(price~sqrft+bdrms)
summary(reg1)
nobs(reg1)

# price = - 19.315 + 0.13 sqrft + 15.20 bdrms + u
# n = 88, R-sq = 0.6319

# (b) What is the estimated increase in price for a house with one more bedroom, holding
# square footage constant?

# 15.20

# (c) What is the estimated increase in price for a house with an additional bedroom that
# is 140 square feet in size? Compare this to your answer in part (b).

coef<-reg1$coefficients
coef
coef[2]*140+coef[3]*1

# equivalently
coef1<-summary(reg1)$coefficients
coef1
coef1[2,1]*140+coef1[3,1]*1

# 33.18

# (d) What percentage of the variation in price is explained by square footage 
# and number of bedrooms?

summary(reg1)$r.squared

# 63%

# (e) The first house in the sample has sqrft = 2438 and bdrms = 4. Find the predicted
# selling price for this house from the OLS regression line.

coef[1]+coef[2]*2438+coef[3]*4
#354.6

# (f) The actual selling price of the first house in the sample was USD300,000 
# (so price = 300). Find the residual for this house. Does it suggest that the buyer 
# underpaid or overpaid for the house?

# This person saved by paying less than the average price in the market.

detach(data)
rm(list=ls())
