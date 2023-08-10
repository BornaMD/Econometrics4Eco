library(TeachingDemos)
txtStart("Homework 3.txt")
# Homework Assignment 3
# Name: Borná Djavdan 
# ANR: 749817

# Exercise 1
load("~/Study/Semester 3/Econometrics for ECO/R Files/R Data/WAGE2.RData")
attach(data)

# a) In this dataset; 
# The number of observations is 935. 
# The unit of observations is people.
# The number of variables is 17. 

# b)
mean(wage)
mean(IQ)
sd(IQ)
# The sample average of salary = $957.95 per month.
# The sample average of IQ = 101.2824 IQ points.
# The sample standard deviation of IQ = 15.05264 IQ points.

# c) 
regIQ <- lm(wage~IQ)
regIQ
summary(regIQ)
length(regIQ$fitted.values)
regIQ$coefficients
# The equation is wage = 116.99 + 8.30 * IQ. 
# The n = 935.
# The R^2 = 0.09554
8.30 * 15
# When all else equal, if IQ points increase by 15 units, monthly wage increases by $124,50 on average. 
# No, IQ does not explain most of the variable, because the R-squared is low.
# Meaning that the omitted variables are important in this case when it comes to explaining monthly wage. 

# d) 
regIQl <- lm(lwage~IQ)
regIQl
summary(regIQl)
length(regIQl$fitted.values)
regIQl$coefficients
# lwage = 5.887 + 0.0088 * IQ
# n = 935; R^2 = 0.09909
0.0088 * 15 
# When all else equal, if IQ points increase by 15 units, the approximate percentage increase in predicted wage is 13.2%.

# e)
LIQ <- log(IQ)
lm(lwage~LIQ)
# The elasticity of wage with respect to IQ is explained by: ln(wage)=2.942+0.833*ln(IQ)

# f)
0.833 * 15
# When all else equal, if IQ points increase by 15%, the approximate percentage increase in predicted wage is 12.495%
# Both answers are very close, because they both represent the percentage change. 

detach(data)
# Exercise 2
load("~/Study/Semester 3/Econometrics for ECO/R Files/R Data/MEAP93.RData")
attach(data)
# a) 
# The more one spends more per student in dollar, the less extra value the students seem to get out of it when it comes to math test pass rate. 
# Therefor I conclude that letting the effect be explained by a diminishing effect seems more appropriate. 

# b)
summary(math10)
sd(math10)
30.05 - 16.62
# Math pass rate:
# The mean = 24.11%; The range = 1.9% to 66.7%; The standard deviation = 10.49%. 
# In case you mean 'interquartile range' by 'range', IQR = |k3 - k1| = 30.05% - 16.62% = 13.43%. 
summary(expend)
sd(expend)
4659 - 3821
# Spending: 
# The mean = $4377; The range = $3332 to $7419; The standard deviation = $775.79. 
# In case you mean 'interquartile range' by 'range', IQR = |k3 - k1| = 4659 - 3821 = 838. 

# c) 
# This model the change in percentage of the math test pass rate is equal to the change in percentage of the expendatures per student in dollars * Beta1. 
# When the Expendatures per student in dollars increases 10%, the math test pass rate increases by 10% * Beta1. 
# Thus percentage point change math10 = Beta1 / 10 * 10%. 

# d)
regMath <- lm(math10~log(expend))
regMath
summary(regMath)
length(regMath$fitted.values)
regMath$coefficients
# math10 = -69.34116 + 11.16440 * ln(expend)
# n = 408; R^2 = 0.02966
# No spending  per student does not explain well the variation in math pass rate, because R-squared is not large. 
# Meaning that the omitted variables are important in this case when it comes to explaining the pass rate for the math test. 

# e) 
11.16440/10
# If spending increases by 10%, the estimated percentage point increase in math10 is (11.16440/10=) 1.12% increase. 
# Thus the estimated spending effect is 1.12%. 

# f)
# No, the estimate does not capture the ceteris paribus effect of expenditure on math pass rate. 
# There are more variables beside expenditure per student that have an effect on the math pass rate, which are not controlled for in the model. 
# For example the condition in which the children grow up. 
# Thus it is not ceteris paribus, and the estimate B1 does not capture the ceteris paribus effect of expenditure on math pass rate. 

# g) This not much of a worry in this data set, because a value given in percentage (the math test pass rate) can never be more than 100%. 

detach(data)
txtStop()