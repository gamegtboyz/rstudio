# controlflow
grading <- function(score) {
  if (score >= 80) {
    print('Passed')
  } else {
    print('Failed')
  }
}

grading_adv <- function(score) {
  if (score >= 80) {
    return('Your grade is A.')
  } else if (score >= 70) {
    return('Your grade is B.')
  } else if (score >= 60) {
    return('Your grade is C.')
  } else if (score >= 50) {
    return('Your grade is D.')
  } else {
    return('Your grade is F, better try in the next semester.')
  }
}

hotel_menu <- function(day, meal) {
  if(day == 'weekday' & meal == 'breakfast') {
    return('scrabbled')
  } else if (day == 'weekday' & meal == 'dinner') {
    return('fried')
  } else {
    return('do it yourself!')
  }
}

fruits <- c('apple','mango','durian','ananas','grapes')
for (i in fruits) {
  print(i)
}

nums <- 1:5
nums ** 2

chatbot <- function() {
  while(T) {
    user_fruit = readline("Guess the fruit: ") 
      if (user_fruit == 'mango') {
        
      }
    
  }
}