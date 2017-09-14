---
title: "R Notebook"
output: html_notebook
---

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code. 

Try executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*. 

```{r}
plot(cars)
```

Add a new chunk by clicking the *Insert Chunk* button on the toolbar or by pressing *Ctrl+Alt+I*.

When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).


FUNCTIONS IN R**********************
All R functions have three parts:

*the body(), the code inside the function.

*the formals(), the list of arguments which controls how you can call the function.

*the environment(), the "map" of the location of the function's variables.


```{r}
body(sd)
formals(sd)
environment(sd)


```




Like all objects in R, functions can also possess any number of additional attributes(). One attribute used by base R is "srcref", short for source reference, which points to the source code used to create the function. Unlike body(), this contains code comments and other formatting. You can also add attributes to a function. For example, you can set the class() and add a custom print() method.

```{r}
?attributes

vector1 <- c(3,4,1,5)
attributes(vector1)
```


#REGULAR EXPRESSIONS IN R
You can use the caret, "^", and the dollar sign, '$' to match the content located in the start and end of a string, respectively. 

->'@', because a valid email must contain an at-sign.
->'.*', which matches any character (.) zero or more times (*). Both the dot and the asterisk are metacharacters. You can use them to match any character between the at-sign and the ".edu" portion of an email address.
->'\\.edu$', to match the ".edu" part of the email at the end of the string. The \\ part escapes the dot: it tells R that you want to use the . as an actual character.
```{r}
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses
grepl(pattern = "@.*\\.edu$",x = emails)



# Use grep() to match for .edu addresses, save result to hits
 hits <- grep(pattern = "@.*\\.edu$",x = emails)


# Subset emails using hits
emails[hits]

```


While grep() and grepl() were used to simply check whether a regular expression could be matched with a character vector, sub() and gsub() take it one step further: you can specify a replacement argument. If inside the character vector x, the regular expression pattern is found, the matching element(s) will be replaced with replacement.sub() only replaces the first match, whereas gsub() replaces all matches.

```{r}
sub(pattern = "@.*\\.edu$", replacement = "@datacamp.edu", x = emails)
```



SOME MORE REGULAR EXPRESSIONS :

   .*     : A usual suspect! It can be read as "any character that is matched zero or more times".
  \\s     : Match a space. The "s" is normally a character, escaping it (\\) makes it a metacharacter.
  [0-9]+  : Match the numbers 0 to 9, at least once (+).
 ([0-9]+) : The parentheses are used to make parts of the matching string available to define the          
             replacement. The \\1 in the replacement argument of sub() gets set to the string that is                    captured by the regular expression [0-9]+.


```{r}
awards <- c("Won 1 Oscar.",
  "Won 1 Oscar. Another 9 wins & 24 nominations.",
  "1 win and 2 nominations.",
  "2 wins & 3 nominations.",
  "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
  "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)

#The ([0-9]+) selects the entire number that comes before the word "nomination" in the string, and the entire match gets replaced by this number because of the \\1 that reference to the content inside the parentheses.

```



#TIME AND DATE IN R

```{r}
today <- Sys.Date()
today
class(today)

now <- Sys.time()
now
class(now) #compatible across different operating systems


```

#Creting date objects
#Code for Formatting
Code	Value
%d	Day of the month (decimal number)
%m	Month (decimal number)
%b	Month (abbreviated)
%B	Month (full name)
%y	Year (2 digit)
%Y	Year (4 digit)
```{r}
my_date <- as.Date("2017-08-29")
my_date


#my_date <- as.date("2017-29-08")  #gives error
#my_date


my_date1 <- as.Date("2017/29/8",format = '%Y/%d/%m')  #Formatted
```
```{r}
nycflights <- nycflights %>%
  mutate(dep_type = ifelse(dep_delay < 5, "on time", "delayed"))

nycflights %>%
  group_by(origin) %>%
  summarise(ot_dep_rate = sum(dep_type == "on time") / n()) %>%
  arrange(desc(ot_dep_rate))


ggplot(data = nycflights, aes(x = origin, fill = dep_type)) +
  geom_bar()
```

