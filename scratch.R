library(ggplot2)
library(purrr)

# function that rolls n die and returns vector
roll_dice <- function(n=1) {
  result <- sample(x = 1:6, size = n)
  return(result)
}

# sum of rolling two dice
roll_dice_2 <- function() {
  sum(roll_dice(2))
}


# vector of two dice roll with for loop using c()

roll_dice_2_v2 <- function(n) {
  # instantiate null vector
  result <- c()

  # iterate n times
  for (i in 1:n) {
    result <- c(result, roll_dice(1))
  }

  return(result)
}



# using vector function()

roll_dice_vector <- function(n = 1) { # with default value

  # instantiate result
  result <- vector(mode = "integer", length = n)

  # for loop
  for (i in 1:n) {
    result[i] <- roll_dice(1) + roll_dice(1)
  }

  return(result)
}

# creating distribution histogram
# with ggplot
ggplot() + aes(roll_dice_vector(1000)) + geom_histogram(binwidth = 0.5)


# with hist
hist(roll_dice_vector(1000))

# how to create a tible

x <- tibble(rolls = roll_dice_vector(10000))


# creating plot from from tibble
ggplot(x, aes(x = rolls)) + geom_histogram()



# map version
roll_dice_with_map <- function(n){
  map_int(1:n, ~ roll_dice() + roll_dice())
}

