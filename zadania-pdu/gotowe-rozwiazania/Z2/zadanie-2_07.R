## PDU
## Zadanie 2.7

?approxfun
?splinefun

approxinvert <- function(f, y, a, b, k=100){
   # Funkcja wyznacza przyblizenie odwrotnosci funkcji f
   # w punktach y przy uzyciu interpolacji (liniowej)
   # f w k rownoodleglych punktach z przedzialu [a, b]
   # Sprawdzenie warunkow poprawnosci:    
   stopifnot(is.function(f))
   stopifnot(is.numeric(a), length(a)==1)
   stopifnot(is.numeric(b), length(b)==1, b > a)
   stopifnot(is.numeric(y), length(y) > 0)
   stopifnot(min(y) >= f(a), max(y) <= f(b))
   stopifnot(is.numeric(k), length(k) == 1, k > 2)
   
   k <- round(k)
   
   x <- seq(a, b, length.out = k)
   fx <- f(x)
   approx_invert_f <- approxfun(fx, x)
   approx_invert_f(y)
}

### Przyklady:

f <- function(x) (x - 3)^2

a <- 3
b <- 6

x <- seq(a, b, length.out = 10)
y <- (x - 3)^2

res <- approxinvert(f, y, a, b)
