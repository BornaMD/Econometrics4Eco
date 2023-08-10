library(TeachingDemos)
txtStart("Tutorial1Results.txt")  #Specify the name you want to give to your log file. The log file with .txt extension 
# will saved in your directory. 

getwd() # to get your directory


# Use the dataset: wage.dta.

# 1. Create a 'script-file' which saves the commands to be run. Include also a short 
# description of the commands in the do-file.

load("wage1.Rdata")

# 2. Describe the variables in the data. What are the units of wage, education, and tenure 
# variables.

# HINT: the description of the variables are in the "labels" attribute

names(data)    #list the variable names
desc
attach(data)    # work with object 'data', DO NOT FORGET TO detach(data) AFTER YOUR WORK IS DONE

# You can get help on commands,say for 'attach', by typing:
  
  help("attach")
  ?attach

# 3. What is the sample size (number of observations in the dataset)?
  
# dimensions of an object
dim(data)
ncol(data)   # number of variables
nrow(data)     #gives max number of observations, can't work on individual variables

# 4. Find the mean and the number of observations for each variable

summary(data)  # doesn't give info on missing obs 
summary(data$wage) #if you want to see the summary of one variable
sapply(data,mean,na.rm=TRUE) #use this option if you want to remove all observations with NA
sapply(data,sd,na.rm=TRUE)   
  #can use (mean, sd, var, min, max, median, range, and quantile)

# number of observations
length(educ)  
length(numdep)

numdep[numdep==2]<<-NA # Replace the variable in the attached environment, if not attached then <- will be ok
numdep
length(numdep)   #counts missing obs as obs
summary(numdep)

# 5. How many men and women are there in the dataset? Are there any missing observations? How many?
  
table(female)    # frequency tables
summary(female)
  
# 6. What is the average wage of the men? What is its standard deviation? And of the women?
  
mean(wage)
sd(wage)
mean(wage[female==0])
sd(wage[female==0])
mean(wage[female==1])
sd(wage[female==1])

# 7. Make a table with the number of men/women on the one hand and the marital status on the other hand.

table(female,married)

table(female,numdep,married) # 3-dimentional table

# 8. Make the same table with percentages of total.

tableA<-table(female,married)

#prop.table(female)   # tables of proportions, each obs in the sum of vector - not useful really
prop.table(tableA)    # table of proportions in the whole
prop.table(tableA,1)  # tables of proportions across row
prop.table(tableA,2)  # tables of proportions across column

# IF there are some missing values, the table() function excludes those from frequency
#numdep
tableB<-table(female,numdep)
tableB
margin.table(tableB)   # excludes the missing values

# If you want the table to include the missing values, then:
tableB<-table(female,numdep,exclude=NULL)
margin.table(tableB)

# 9. Make a table of correlations. What is the correlation between wage and experience? 
# Different alternatives:

cor(wage,exper)
cor(cbind(wage,exper))

mat1<-cbind(wage,exper,numdep)
cor(mat1)
cor(mat1,use="pairwise.complete.obs") # use complete observations within each pairs
# cor(mat1,use="all.obs")  # gives an error when any of the columns have a missing value, don't use
cor(mat1,use="complete.obs") # use only complete observations deleting obs where 1 value is missing

# And between wage and education?
cor(wage,educ)

mat1<-cbind(wage,educ)
cor(mat1)

# 10. Make a variable called 'male' which is 1 if it is a man and 0 otherwise 
# (this is called a dummy variable).

# Alternative 1
male<- female==0              # creates logical vector as separate object
male<<- female==0 				# creates logical vector within the object 'data'

# Alternative 2:
male<-rep(1,526)
male[female==1]<-0

# Alternative 3:
male<-1-female
#male

detach(data)

txtStop() 
######################################################################################
# 2. EXERCISES IN TUTORIAL 1, Part II.
######################################################################################

attach(data)

# 1. Find the percentage of non-married females and married males in the data-set

tab1<-table(female,married)
prop.table(tab1)

# 2. Summarize education. Summarize education for those who earn a wage above 20 and
# then those with tenure more than 20.

summary(educ)
summary(educ[wage>20])
summary(educ[tenure>20])

#counting obs where wage>20
newvar<-wage>20
table(newvar)

# 3. Generate a new variable called wage2 which is 0 if wage<5, 1 if 5<=wage<15, 2 if 
# wage>=15

wage2=rep(0,526)
wage2[wage>=5&wage<15]=1
wage2[wage>=15]=2
table(wage2)

# 4. Save you dataset with name data.Rdata

save(data, file="data.RData")
load("data.RData")  # to load the R data file
rm(list=ls()) #remove object from specified environment

detach(data)

search() # check for attached objects
