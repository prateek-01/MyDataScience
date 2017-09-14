setwd("C:/Users/eprksil/Desktop/cba/Session-3/files/")


spamdata <- read.csv("sms_spam.csv")

View(spamdata)
str(spamdata) #structure of data

split_df <-split(spamdata,spamdata$type)
str(split_df)

#Coding the split fuction

#type_factors <-levels(spamdata$type)


#for(i in 1:length(type_factors)){
#  subsetSpam <- subset(spamdata,)
#}

#------------------------
prob_spam <- length(split_df[[2]][[1]])/(length(split_df[[1]][[1]])+length(split_df[[2]][[1]]))

prob_spam


#!!************************As done in class **********
  spamdata <- read.csv("sms_spam.csv",stringsAsFactors = FALSE)

#whenever R inputs text data ,it converts it into factors
#so stringsAsFactors ensures to not to convert textual data into factors

str(spamdata)

table(spamdata$type)

spam <- subset(spamdata,type == "spam")
ham  <- subset(spamdata,type == "ham")

nrow(spam)/nrow(spamdata)
