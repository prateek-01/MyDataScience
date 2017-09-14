#Data Structures in R***********************

#1.Atomic Vectors
dbl_var <- c(1, 2.5, 4.5)
# With the L suffix, you get an integer rather than a double
int_var <- c(1L, 6L, 10L)
# Use TRUE and FALSE (or T and F) to create logical vectors
log_var <- c(TRUE, FALSE, T, F)
chr_var <- c("these are", "some strings")


#Atomic vectors are always flat, even if you nest c()'s:
c(1,2,c(3,4,c(5,6)))
#same as->
c(1,2,3,4,5)

#Missing values are specified with NA, which is a logical vector of length 1. 
#NA will always be coerced to the correct type if used inside c(),
#or you can create NAs of a specific type with NA_real_ (a double vector), NA_integer_ and NA_character_.
str(c(NA))
str(c(NA_real_))
str(c(NA_integer_))

#Types and tests
#Given a vector, you can determine its type with typeof(), 
#or check if it's a specific type with an "is" function: is.character(), is.double(), is.integer(), is.logical(),
#or, more generally, is.atomic().
int_var <- 





# Build factor_survey_vector with clean levels
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
levels(factor_survey_vector) <- c("Female", "Male") #to change the name of levels
factor_survey_vector

# Generate summary for survey_vector
summary(survey_vector)

# Generate summary for factor_survey_vector
summary(factor_survey_vector)

#ORDERED AND UNORDERED FACTORS********************
#speed_vector should be converted to an ordinal factor since its categories have a natural ordering. 
#By default, the function factor() transforms speed_vector into an unordered factor. 
#To create an ordered factor, you have to add two additional arguments: ordered and levels.
speed_vector <- c("fast", "slow", "slow", "fast", "insane")

# Convert speed_vector to ordered factor vector
#With the argument levels you give the values of the factor in the correct order.
factor_speed_vector <-factor(speed_vector,ordered = TRUE,levels=c("slow","fast","insane"))

# Print factor_speed_vector
factor_speed_vector
summary(factor_speed_vector)




#****************************************************888
obj <- c(1,2,3,4)
class(obj)
is.vector(obj)
attributes(obj)
str(obj)



#******Important Code from datacamp***********
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
str(pioneers)  #atomic vector of type char

split <- strsplit(pioneers, split = ":")  #***Important->returns lists of lists 
str(split)
my_list1 <- split[[1]]
str(my_list1)

#To access second element of first list
my_list1[2]
#oR
split[[1]][2]

#Similarly
split[[2]][1]

#NOTE
#split <- c(c("Gauss",1993),c("newton",1567),c("Pearson",1678)) #this created a flat list
#str(split)
#split[[2]][1] #Doesnt work as above as expected

#Applying generic/unnamed functions to lapply(that return NULL too)
lapply(split, function(x) {
  if (nchar(x[1]) > 5) {
    return(NULL)
  } else {
    return(x[2])
  }
})
#Note -> lapply always returns a list(because it needs to store heterogeneous objects)

#***********SAAPLY***********Or****Simplified Lapply*****

#sapply tries to simplify lapply by converting list of objects into a vector (if possible and makes sense)
#i.e #sapply-Simplifies results from lapply. returns a vector if list element is of length 1
#matrix if every element in list of same length, otherwise returns a list
#Example:-
temp <- list(c(1,2,-3),c(4,-2,-6,8),c(23,-13,20,19),c(3,22,89,10))  #declaring a list of vectors
str(temp)

extremes <- function(x) {
  c(min = min(x),max= max(x))
}

lapply(temp,extremes)
str(lapply(temp,extremes))

sapply(temp,extremes)
str(sapply(temp,extremes))

#Note the difference between the two above.In above code sapply was able to simplify because the output 
#list of vectors were of same length.What if they are not as in exapmle below ->
#Example:-

below_zero <- function(x) {
  return(x[x < 0])
}

lapply(temp,below_zero)
str(lapply(temp,below_zero))

sapply(temp,below_zero) #not able to simplify hence returns the same list of vectors as lapply does
str(sapply(temp,below_zero))

#Given that the length of the output of below_zero() changes for different input vectors, 
#sapply() is not able to nicely convert the output of lapply() to a nicely formatted matrix. Instead, the output values of sapply() and lapply() are exactly the same.

############*******************************************************
#Example2

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
sapply(temp,print_info)

# Apply print_info() over temp using lapply()
lapply(temp,print_info)
  
  
#Notice here that, quite surprisingly, sapply() does not simplify the list of NULL's. That's because the 'vector-version' of a list of NULL's would simply be a NULL,
#which is no longer a vector with the same length as the input.


#Example3
#This code generates a matrix with 3 rows and 2 columns.
# The function that is used inside sapply() is anonymous

sapply(list(runif (10), runif (10)), 
       function(x) c(min = min(x), mean = mean(x), max = max(x)))

#vapply*********************
#Whereas sapply() tries to 'guess' the correct format of the result, vapply() allows you
#to specify it explicitly. If the result doesn't match the format you specify, vapply()
#will throw an error, causing the operation to stop. This can prevent significant
#problems in your code that might be caused by getting unexpected return values from sapply().

#EX
temp <-list(c(1,4,2,3),c(54,2,1,3),c(5,4,1,7,8,9),c(33,14,1,2,6))
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp, basics, numeric(3))

#Notice how, just as with sapply(), vapply() neatly transfers the names that you specify 
#in the basics() function to the row names of the matrix that it returns.



#*******************the table function and tapply()***Important********
?table
str(flags)

table(flags$landmass) #to see how many flags/countries fall into each group.
table(flags$animate)


#If you take the arithmetic mean of a bunch of 0s and 1s, you get the proportion of 1s. Use
#tapply(flags$animate, flags$landmass, mean) to apply the mean function to the 'animate' variable
#separately for each of the six landmass groups, thus giving us the proportion of flags containing an
#animate image WITHIN each landmass group.
tapply(flags$animate, flags$landmass, mean)

#INTERPRETATION->The first landmass group (landmass = 1) corresponds to North America and contains the highest
#proportion of flags with an animate image (0.4194)

tapply(flags$population, flag$red, summary) #Interpret yourself

#***************************************
baseball.example <-
  data.frame(team = gl(5, 5,
                       labels = paste("Team", LETTERS[1:5])),
             player = sample(letters, 25),
             batting.average = runif(25, .200, .400))
summary(baseball.example)
str(baseball.example)
head(baseball.example)

tapply(baseball.example$batting.average, baseball.example$team,max)
tapply(baseball.example$batting.average, baseball.example$player,mean)


#************REGEX**********************
?regex
