#FUNCTIONS IN R******************
formals(sd)
environment(sd)



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
#When the trim argument is not zero, 
#it chops off a fraction (equal to trim) of the vector you pass as argument x


#***************************************************************
#R passes arguments by value. 
#, R passes by value, so the R objects you pass to a function can never change unless you do an explicit assignment.
#a remains equal to 5, even after calling triple(a)

triple <- function(x) {
  x <- 3*x
  x
}
a <- 5
triple(a)
a

#****************************************************************
#Packages in R
#Base package is the default

#lets install a package named "ggvis" for Data Visualisation
install.packages("ggvis")
#now the ggvis package is added to CRAN(Comprehensive R Archive Network)
#But we cant access it yet in our R environment
#To do that we have load the package in our current R session
#We need to attack it to a search list.It is a list of packages and environments
# that R looks to use a function/variable.
search()
# 7 packages are attached to the search list by default
#Search alreay contains the GlobalEnv that we work on

ggvis(mtcars, ~wt, ~hp) #gives error

#ggvis not attached to the search list yet,we need to do it using library function
library("ggvis")

search() #ggvis is a part of search list

ggvis(mtcars, ~wt, ~hp) #runs as expexted

#require function-->like library function used to 
#fetch required packages,the only difference being it doenst throw an error if the package 
#is not installed yet and returns a boolean value
#(Good for using inside functions when you want to avoid errors while fetching packages dynamically)
require("dpylr")  
status <- require("dpylr")
status

#
install.packages("swirl")
library(swirl)






#ENVIRONMENTS/Scoping in R
#Scoping describes how R looks up Values by Name
