###################################
# Functions: creación             #
###################################

func <- function(x) {
  #body  
}

do_something <- function(a, b = 1) {
  if (b == 0)
    invisible( a * b + a / b)
  #a * b + a / b
}

do_something (4)

kk <- do_something (4, 0)

a <- 3
a

pow_two <- function(x) return(x^2)


my_function <- function(a, b, c) {
  c(a, b, c)
}

my_function(1, 2, 3)

my_function(c = 3, a = 1, b = 2)