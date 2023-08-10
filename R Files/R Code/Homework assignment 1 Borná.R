library(TeachingDemos)
txtStart("Homework assignment 1.txt")
# Homework Assignment 1
# Name: Borná Djavdan 
# ANR: 749817

# Exercise 1
load("~/Study/Semester 3/Econometrics for ECO/R Files/R Data/bwght.RData")
attach(data)

#1a) 
# There are as many women in the sample as there are observations in the data. 
sum(cigs>0) #There are 212 women who report smoking at least 1 cigaret per day during pregnancy. 
#1b)
mean(cigs)
# The average number of cigarets a woman smokes per day during pregnancy equals about 2.09. Before I answer the next question I would like to describe what I define as a 'typical' woman. Acording to the sample, the typical woman doesn't smoke.
# Therefore I conclude that this average is not a good measure for the average of the 'typical' woman. Some women smoke during pregnancy and some do not, this mean makes it look like all women smoke.

# 1c) 
mean_smoke_during_pregnancy <- mean(cigs[cigs>0])
mean_smoke_during_pregnancy
# Among women who smoke, the average cigarettes smoked per day during pregnancy is about 13.67. 
#This average is higher than the answer in b, because now the average does not include the women who do not smoke, which would skew the average lower. 

# 1d) 
mean(na.omit(motheduc))
# The average of 'motheduc' is about 12.94, I had make sure that the missing value was not used in the mean calculation, because otherwise the mean function gave 'NA' as output. 
sum(is.na(motheduc))
# The amount of observations that are missing from this variable is only one (1). 

#1e) 
mean(faminc)
sd(faminc)
# The average family income in 1988 is $29026.66. The standard deviation of family income in 1988 is $18739.28. The unit in the data sample is in 1988 U.S. Dollars. 

#1f)
rich <- as.numeric(faminc>=30) 
sum(rich)
# There are 574 families (observations) catagorized as 'rich' (meaning family income is above or equal to $30.000). 

#1g)
table(rich,cigs)
# There are 53 'rich' women who smoke during pregnancy and 159 women classified as 'poor' who smoke during pregnancy inside the sample.
# Yes, I would say there is a strking difference, the amount of women who smoke differs by 106 more for the 'poor'women. 
mean(cigs[cigs>0&rich==0])
mean(cigs[cigs>0&rich==1])
# Also the 'poor' women who smoke during pregnancy, smoke about 4 more cigarettes per day than the 'rich' women who smoke during pregnancy. 
detach(data)

# Exercise 2
load("~/Study/Semester 3/Econometrics for ECO/R Files/R Data/jtrain2.RData")
attach(data)

#2a)
sum(train) / 445
# The fraction of men receiving low-income job training is calcualted using the summation of train values devided by the number of total observations in this dataset.
#2b) 
mean(re78[train==1])
mean(re78[train==0])
# The average income of men receiving job training is about $6349.15, and the average income of men receiving no job training is about $4554.80. 
# Yes, I would say this difference would consitute as economically large. 
# This is my conclusion because the averge income differs by almost 40% more for men who have received training. 

#2c) 
sum(unem78&train==1)/sum(unem78)
sum(unem78&train==0)/sum(unem78)
# The fraction of the men who received job training and are unemployed is about 0.3285. 
# The fraction of the men who did not receive job training and are unemployed is about 0.6715. 
# The difference is significant, because the fraction of men who did not receive job training and are unemployed is more than twice the fraction of the men who received job training and are unemployed. 
# Therefore I can say that receiving jobtraining is positively effective in gaining employment. 

#2d) Yes, it does appear that job training was effective, because the earnings of people receiving job training are on average significantly higher than the people receiving no job training. 
# And when comparing the unemployment rate of people who have received jobtraining and those who have not received jobtraining, the jobtraining was positively effective in combatting unempoyment. 
# Therefor I would conclude that it does appear that the job training program was effective. 
# What would make our conclusions more convincing would be to use panel data, a.k.a to add the dimension of time to the data and to be able to see if the findings would be consistent over time. 

detach(data)
txtStop()