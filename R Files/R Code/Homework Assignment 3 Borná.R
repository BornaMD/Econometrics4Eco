library(TeachingDemos)
txtStart("Homework assignment 3.txt")
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

#d) 
