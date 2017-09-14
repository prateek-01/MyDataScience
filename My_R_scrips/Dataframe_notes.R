#FUNCTIONS IN R******************

#BEST PRACTICES
#For functions, it's okay to use positional matching for the first one or two arguments. 
#These are usually the data to be computed on. 
#Good examples are the x argument to the summary functions (mean(), sd(), etc.) and the x and y arguments to plotting functions.

#However, beyond the first couple of arguments you should always use matching by name. 
#It makes your code much easier for you and others to read. 
#This is particularly important if the argument is optional, because it has a default. 
#When overriding a default value, it's good practice to use the name.

#Make sure you use matching by name for the arguments 
#that come after the data argument and has a default value.

mean(c(1:9, NA),trim = 0.1,na.rm = TRUE)  #GOOD CALL TO FUCTION mean()



#****************************************************************
#ENVIRONMENTS/Scoping in R
#Scoping describes how R looks up Values by Name
