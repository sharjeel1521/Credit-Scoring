##################################################################################
# Project:      Credit Scoring Analysis (petit example)
# Description:  Part 1 - Data processing and cleaning
# Data:         CreditScoring.csv
# By:           Sharjeel Imtiaz
# url:          www..com
##################################################################################


#-----Section 01-------------------------------------------
# set working directory

setwd(dirname(file.choose()))
getwd()

#-----Section 02-------------------------------------------
# get data file creditcard.csv and put relevant variables in a data frame

dd <- read.csv("creditcard.csv", stringsAsFactors = FALSE)



# check table dimensions and description of variables
dim(dd)	  # (30000, 25)
str(dd)    #see the structure of the data

# see what the data looks like
head(dd)

# let's take a quick summary of the data
summary(dd)

# Questions to keep in mind:
# check maximum and minimum values
# check the scale of the variables (categorical, continuous, etc)
# look for outliers, weird values, missing values


# ================================================================================
# Check categorical variables
# ================================================================================

# how many missing values (coded as 0)
table(dd$PAY_0) #14737 zeros
table(dd$PAY_2) #15730 zeros
table(dd$PAY_3) # 15764 zeros
table(dd$PAY_4) #16286 zeros
table(dd$PAY_5) #16455 zeros
table(dd$PAY_6) #16286 zeros


# we'll delete missing values since there are only a few of them
good = dd$PAY_0 != 0 & dd$PAY_2 !=0 & dd$PAY_3 !=0 & dd$PAY_4 & dd$PAY_5 & dd$PAY_6 != 0
dd = dd[good, ]

# check the new dimensions of the dataset
dim(dd)   # (8827, 25)


# ================================================================================
# Check continuous variables
# ================================================================================

# create single vectors for the following variables
table(dd$BILL_AMT1)# 4 zeros
table(dd$BILL_AMT2)# 4 zeros
table(dd$BILL_AMT3) # 7 zeros
table(dd$BILL_AMT4) # 4 zeros
table(dd$BILL_AMT5) # 3 zeros
table(dd$BILL_AMT6) # 2 zeros

BILL_AMT1= dd$BILL_AMT1
BILL_AMT2= dd$BILL_AMT2
BILL_AMT3 = dd$BILL_AMT3
BILL_AMT4 = dd$BILL_AMT4
BILL_AMT5 = dd$BILL_AMT5
BILL_AMT6 = dd$BILL_AMT6



# how many zeros (this is just for curiosity)
sum(BILL_AMT1 == 0)          # 346
sum(BILL_AMT2 == 0)          # 1626
sum(BILL_AMT3 == 0)            # 3667
sum(BILL_AMT4 == 0)       # 532
sum(BILL_AMT5 == 0) 
sum(BILL_AMT6 == 0) 





# since there are a lot of missing values in the continuous variables
# we need to do some imputation
# let's apply knn (k-nearest neighbor) imputation
good = dd$BILL_AMT1 != 0 & dd$BILL_AMT2 !=0 & dd$BILL_AMT3 !=0 & dd$BILL_AMT4 & dd$BILL_AMT5 & dd$BILL_AMT6 != 0
dd = dd[good, ]

# let's check again the data
# verify that there's no missing and/or weird values
dim(dd)   # (4446, 14)
summary(dd)


# ================================================================================
# Reformat categorical variables
# ================================================================================
# This step has to be done after the knn imputation, otherwise you'll get
# an ugly error message wihtout having no clue at all of what's wrong

# specify categorical variables as factors

dd$EDUCATION[dd$EDUCATION == 4] <- 0
dd$EDUCATION[dd$EDUCATION == 5] <- 0
dd$EDUCATION[dd$EDUCATION == 6] <- 0
dd$SEX = as.factor(dd$SEX)
dd$EDUCATION = as.factor(dd$EDUCATION)
levels(dd$EDUCATION)

dd$MARRIAGE[dd$MARRIAGE == 0] <- 3
dd$MARRIAGE = as.factor(dd$MARRIAGE)
levels(dd$MARRIAGE)

dd$Y[dd$Y == 0] <- 'NO'
dd$Y[dd$Y == 1] <- 'YES'

dd$Y = as.factor(dd$Y)
as.ordered(dd$Y)
levels(dd$Y)


# change factor levels (i.e. categories)
levels(dd$SEX) = c("male", "female")
levels(dd$EDUCATION) = c("graduate", "university", "high school","others")
levels(dd$MARRIAGE) = c("married","single","others")





# Once we have preprocessed the data, we can save it in a new file
# This is the file we'll be using in the next parts


write.csv(dd, "CleanCreditScoring.csv", row.names=FALSE)

