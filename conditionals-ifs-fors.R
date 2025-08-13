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