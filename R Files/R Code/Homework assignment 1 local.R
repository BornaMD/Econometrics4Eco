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
#There are 574 families (observations) catagorized as 'rich'. 

#1g)
table(rich,cigs)
# In total 53 rich people smoke and 159 pour people smoke inside our sample.
# More of the poor smoke, a difference of 106, and of those that smoke poor people smoke more cigarests on averige than rich people.
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
# The average of yes (25% more)... afmaken
#2c) 
sum(unem78[train==1]) / sum(unem78)
sum(unem78[train==0]) / sum(unem78)
# The fraction ... The difference is significant, because it has helped more than 50%

#2d) Yes it does appear that job training was effective, because the earnings of people receiving job training are on average significantly higher than the people receiving no job training
# also 



detach(data)