txtStart(Tutorial1text, commands=TRUE, results=TRUE, append=FALSE, cmdfile, visible.only=TRUE)
# Functions
3+9+ 12+11
M <- 5 + log(2)
a <- M^2
# Print
M
a
# Working Directory
getwd()
# Change Working Directory
# setwd(" ... ")
load(data) # To load the data you need to start working with it.
# Data is cross-sectional data, because it observes various people in the same timeframe. 
Names(data)
desc
# ^Explaines the variables of 'Data' and gives you the accompanying labels.
attach(data) # To start working within the data

#Use ?command in the console to get help understanding what the function does when used in either the script or console. 
summary(data) # Gives us a basic summary of all the variables in data
summary(data$wage) #Gives us a basic summary of wage



#Underreporting is when a participant reports a higher value than the actual value
#Overreporting is the opposite
#Missing value is NA
# Square brackets [...] are used to define a logical expression / prerequisite to select, zie hieronder:
numdep[numdep==2]<<- NA

sum(is.na(numpan)) # To count the amount of missing values. 
motheduc.no.NA <- motheduc[!is.na(motheduc)]

avg.wage.m <- mean(wage[female==0])
avg.wage.f <- mean(wage[female==1])
avg.wage.m
avg.wage.f

tableA <- table(female,married)
tableB <- table(female,married,numdep)
prop.table(tableA)
prop.table(tableA,1)
prop.table(tableA,2)

print(tableA)
print(tableB)
cor(wage,exper)
cor(cbind(wage, exper))

detach(data) # When you are done with working with the data

#output and logfile: use txtStart("filename") and txtstop() -> in the map.

txtStop()