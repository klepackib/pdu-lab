# PDU - 10.03.2025
# Przykładowe rozwiązanie zadania 2.2

# Rozwiazanie:

calkaMonteCarlo <- function(f, a, b, n = 1000) {
  # Funkcja oblicza wartosc całki metodą Monte Carlo
  # Param:
  # f - funkcja
  # a, b - liczby oznaczajace krance przedzialu; a < b
  # n - liczba generowanych punktow, n > 0
  # Sprawdzamy warunki poprawnosci argumentow funkcji
  stopifnot(is.function(f))
  stopifnot(is.numeric(a), length(a) == 1)
  stopifnot(is.numeric(b), length(b) == 1)
  stopifnot(a < b)
  stopifnot(is.numeric(n), length(n) == 1,
            n == floor(n), n > 0)
  
  # 1.) 
  fmin <- min(f(a), f(b))
  fmax <- max(f(a), f(b))
  
  stopifnot(fmin >= 0)
  
  # 2.)
  x <- runif(n, min = a, max = b)
  y <- runif(n, min = fmin, max = fmax)
  # 3.) i 4.)
  mean(y <= f(x)) * (b-a) * (fmax-fmin) + (b-a) * fmin
}

# Przykład:

set.seed(123)
f <- function(x) sin(x)
a <- 0
b <- 1

# jak wyglada f() na odcinku [0, 1]
curve(f(x), a, b) # wykres funkcji na [a, b]

n <- 10000
calkaMonteCarlo(f, a, b, n)
# do porównanie:
integrate(f, a, b) # 0.4596977
calkaMonteCarlo(f, a, b, 5)
calkaMonteCarlo(f, a, b, 20)
calkaMonteCarlo(f, a, b, 50)
calkaMonteCarlo(f, a, b, 100)
calkaMonteCarlo(f, a, b, 1000)
calkaMonteCarlo(f, a, b, 10000)

# Przyklady 2:

calkaMonteCarlo(f, 1, 0, 1000)
calkaMonteCarlo(f, 0, 1, c(1, 5, 10))
calkaMonteCarlo(f, '0', '1')

# sprawdzanie warunków:

stopifnot(1 < 2, TRUE, length(1) == 1)
stopifnot(1 < 2, TRUE, length(1) > 1)
stopifnot(1 < 2, FALSE, length(1) > 1)



