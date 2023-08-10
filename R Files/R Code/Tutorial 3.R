# Tutorial 3
# Exercise 1
# a
attach(data)
mean(prate)
mean(mrate)
# b
library(tidyverse)
library(PerformanceAnalytics)
library(gvlma)
reg1 <- lm(prate~mrate)
reg1
names(reg1)
reg1$fitted.values
summary(reg1)

plot(mrate,prate)
abline(reg1)

#d 
reg1$coefficients
reg1$fitted.values
# fitted.value predicts the y_hat
mean(reg1$residuals)
# hat u = prate - hat_prate
# residual is the estimated value of the error term (u).
#R^2 = multiple r square in the summary
#SST = \sum y_i - \bar y)^2
#SSE = \sum \hat{y_i} - \bar y)^2
#SSR = \sum (\hat{y_i})^2 = \sum \hat{y_i} - \bar \hat{u})^2 (Check this!!!)
#SST = SSE + SSR = 1 - 

# When working with opensource data, they are mostly different datatypes, you can convert them using:
library(foreign)
data <- read.dta("countymurders.dta")
library(haven)
data <- 