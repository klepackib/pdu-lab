# PDU - 10.03.2025
# Przykładowe rowiązanie zadania 2.8

wystarczy <- function(lista, r, R, fun) {
  # ...
  stopifnot(is.list(x))
  stopifnot(sapply(x, is.numeric))
  stopifnot(is.function(fun))
  stopifnot(is.numeric(r), length(r) == 1,
            is.numeric(R), length(R) == 1)
  stopifnot(r < R)

  wyniki <- sapply(lista, fun)
  lista[ wyniki <= R & wyniki >= r ]
}

# Przykład:
x <- list(c(6, 3, 10), c(5, 10, 15), 4)
wystarczy(x, 20, 30, sum)


# Dla porównania zmierzymy czas działania funkcji wystarczy() oraz 
# wystarczy_2() gdzie nie zapisywalismy wyniku sapply() tylko
# wywołaliśmy go dwukrotnie

wystarczy_2 <- function(lista, r, R, fun) {
  # ...
  lista[ sapply(lista, fun) <= R & sapply(lista, fun) >= r ]
}

# Generujemy "dużą listę":
N <- 1000
x <- lapply(1:N, runif) 
length(x)
# str(x)

# Poniżej mierzymy czas (funkcja microbenchmark):
microbenchmark::microbenchmark(
  wystarczy(x, 0.2, 0.8, mean),
  wystarczy_2(x, 0.2, 0.8, mean)
)

# Unit: milliseconds
# expr      min       lq      mean   median        uq
# wystarczy(x, 0.2, 0.8, mean) 4.915511 5.290748  5.932241  5.45541  5.758498
# wystarczy_2(x, 0.2, 0.8, mean) 9.321772 9.903804 10.586276 10.27253 10.756328
# max neval
# 13.40557   100
# 19.49825   100

