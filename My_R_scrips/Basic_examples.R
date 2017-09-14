#EX-1
x <- c('n','n','n','s')
y <- factor(x)

levels(y) <- c("north","south")
y


#EX-2
month <- list(
  x = c("May", "Jun", "Apr"), 
  y = c("Jul", "Aug", "Sep")
)
month$y
month$y[1]


#ex-3
x <- "FALSE"
class(x)
x <- c(TRUE,FALSE)
class(x)


#EX-4-> ordering a dataframe
df <- data.frame(
  x = c(47, 13, 5, 46), 
  y = c("A", "B", "C", "D"), 
  z = c(34, 50, 22, 42)
)
idx <- order(df$x, decreasing = FALSE)
idx
df[idx, ] #reordered dataframe


