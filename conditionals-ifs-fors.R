# basic if statement

burrito <- 1.5# assign an object value

# write a short if statement
if (burrito > 2) {
  print("I love burritos!")
}

# an example with strings
my_ships <- c("Millenium Falcon", "X-wing", "Tie-Fighter", "Death Star")
stringr::str_detect(my_ships, pattern = "r")

phrase <- "I love burritos!"

if (stringr::str_detect(phrase, "love")){
  print("Big Burrito Fan")
}

# basic if-else statement
pika <- 89.1 # storing a value to an object
if (pika > 60) { # define size of mega pikas
  print("mega pika")
} else {# otherwise, print normal
  print("normal pika") 
}

# another example with strings

food <- "I love tacos"

if (stringr::str_detect(food, pattern = "burritos")) {
  print("yay burritos!")
} else {
  print("what about burritos?")
}

# more options with if-else if-else statements
marmot <- 3.8

if (marmot < 0.5) { # defining small marmots
  print("small")
} else if (marmot >= 0.5 & marmot < 3) { # defining medium marmots
  print("medium")
} else { # everything else is large marmot
  print("large")
}

# use the switch function to write complicated if-else statements
species <- "mouse"

switch(species,
       "cat" = print("meow"), # same as if statement
       "dog" = print("woof"), # same as else if statement
       "mouse" = print("squeak")) # same as last else if statement

# see next week dplyr::case_when()

# writing for loops

dog_names <- c("Teddy", "Khora", "Banjo", "Waffle")

# create example for one data element to put into a for loop
# copy/paste version
print(paste("My dogs name is", dog_names[1]))
print(paste("My dogs name is", dog_names[2]))
print(paste("My dogs name is", dog_names[3]))
print(paste("My dogs name is", dog_names[4]))

# version with variable that can be updated
pupster <- 1

print(paste("My dogs name is", dog_names[pupster]))

# convert to a for loop

for (pupster in dog_names) {
  print(paste("My dogs name is", pupster))
}

# another for loop example

# data that we're working with
mass <- seq(from = 0, to = 3, by = 0.5)

# practicing writing body of for loop
i <- mass[1]
i
new_val <- i + 2
print(new_val)

# write into a for loop
for (i in mass) {
  new_val <- i + 2
  print(new_val)
}

# practice same example but with indexing
i <- 1
new_val <- mass[i] + 2
print(new_val)

for (i in 1:length(mass)) { # defining iterator using the length of the vector
  new_val <- mass[i] + 2
  print(new_val)
}

for (i in seq_along(mass)) { # defining iterator using seq_along()
  new_val <- mass[i] + 2
  print(new_val)
}

# another example with iterating by position (indexing)
tree_height <- c(1, 2, 6, 10)

# example for first case
tree_height[1] + tree_height[2]

# convert into a generalizable expression
i <- 1
val <- tree_height[i] + tree_height[i + 1]
print(val)

# convert into for loop
# test out creating the sequence
seq_along(tree_height)

for (i in seq_along(tree_height)) {
  val <- tree_height[i] + tree_height[i + 1]
  print(val)
}

# write for loops with conditional statements
# create a vector of animals
animal <- c("cat", "dog", "dog", "zebra", "dog")

one_animal <- animal[1]

for (i in seq_along(animal)) {
  if (animal[i] == "dog") {
  print("I love dogs")
} else {
  print("These are other animals")
}
}  

# another for loop example with conditionals
species <- c("dog", "elephant", "goat", "dog", "dog", "elephant")

# respective ages in human years
age_human <- c(3, 8, 4, 6, 12, 18)

# convert ages to animal year equivalent
# 1 human year = 7 dog years
# 1 human year = 0.88 elephant years
# 1 human year = 4.7 goat years

# allocate space for our output
animal_ages <- vector(mode = "numeric", length = length(species))

for (i in seq_along(species)) {
  if (species[i] == "dog") {
    animal_age <- age_human[i] * 7
  } else if (species[i] == "elephant") {
    animal_age <- age_human[i] * 0.88
  } else if (species[i] == "goat") {
    animal_age <- age_human[i] * 4.7
  }
  animal_ages[i] <- animal_age # populate empty vector
}

# another example of storing an output
tigers <- c(29, 34, 82)
lions <- c(2, 18, 6)

# allocate storage for new values
big_cats <- vector(mode = "numeric", length=length(tigers))

for (i in seq_along(tigers)) {
  total_cats <- tigers[i] + lions [i]
  big_cats[i] <- total_cats
}
big_cats

# for loops to iterate across columns of data frame

#create vector to store values
mean_mtcars <- vector(mode = "numeric", length = ncol(mtcars))

for(i in 1:ncol(mtcars)) {
  mean_val <- mean(mtcars[[i]], na.rm = TRUE)
  mean_mtcars[i] <- mean_val
}
mean_mtcars

# a for loop over columns with a condition
for (i in 1:ncol(penguins)) {
  if (is.numeric(penguins[[i]])) {
    penguin_median <- median(penguins[[i]], na.rm = TRUE)
    print(penguin_median)
  } else {
    print("data not numeric")
  }
}

# functional programming

# apply() function iterates over columns or rows

# rewrite our for loop for finding the mean values of the columns in mtcars
apply(X = mtcars, #in data frame mtcars
      MARGIN = 2, #go across columns
      FUN = mean #apply the function mean 
      )

library(tidyverse)

penguins %>% 
  group_by(species) %>% 
  summarise(across(where(is.numeric), mean, na.rm = TRUE))
