## PDU
## Zadanie 2.6

posortowanePunkty <- function(n, m, z){
    # Funkcja wyznacza odleglosci (euklidesowe) punktow od (0, 0, ..., 0)
    # a nastepnie sortuje je rosnaco
    # Sprawdzenie warunkow poprawnosci:
    stopifnot(is.numeric(n), length(n) == 1) # wymiar przestrzeni
    stopifnot(is.numeric(m), length(m) == 1) # liczba punktow
    stopifnot(is.numeric(z), length(z) == n*m) 
   
    groups <- rep(1:m, n) 
    points <- split(z, groups)
    odl <- sapply(points, 
                 function(x) sqrt(sum(x^2)) )
    # lub lapply + unlist
   
    unsplit(points[order(odl)], groups)
   
}

### Przyklady:
z <- 1:6
z <- c(2, 1, 3, 5, 4, 6)
n <- 2 # wymiar
m <- 3 # liczba punktow

posortowanePunkty(n, m, z)

z <- c(6, 5, 7, 1, 3, 4, 2, 9, 7)
n <- 3 # wymiar
m <- 3 # liczba punktow

posortowanePunkty(n, m, z)

z <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
n <- 3 # wymiar
m <- 3 # liczba punktow

posortowanePunkty(n, m, z)

z <- c(1, 2, 
       3, 4, 
       5, 6)
n <- 3 # wymiar
m <- 2 # liczba punktow

posortowanePunkty(n, m, z)

