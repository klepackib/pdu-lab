## PDU
## Zadanie 2.3

?tabulate

x <- sample(5, 10, TRUE)
y <- sample(10, 15, TRUE)

maks <- max(x, y)
mini <- min(x, y)

which(tabulate(x, maks) & tabulate(y, maks))
intersect(x, y)
