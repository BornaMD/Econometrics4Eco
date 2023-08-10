# Tutorial 7
library(haven)
ECONMATH <- read_dta("Study/Semester 3/Econometrics for ECO/R Files/R Data/ECONMATH.dta")
attach(data)
# Exercise 1
# a) 0% to 100%
min(ECONMATH$score)
max(ECONMATH$score)
# actual min value score has taken is 19.53.
# actual max value score has taken is 98.44.

# b)
# Assumption MLR 6 cannot hold for the error term u, because we do know what variables are in u, and therefore we cannot assume that an error term has a 0 for its expected value.
# The u term is not normally distributed, you cannot trust the usual t statistic test results. 
