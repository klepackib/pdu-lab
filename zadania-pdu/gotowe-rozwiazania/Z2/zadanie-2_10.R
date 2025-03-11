## PDU
## Zadanie 2.10

gendyskr <- function(n, x, p){
    stopifnot(is.numeric(n), length(n) == 1)
    stopifnot(is.numeric(x), length(x) > 0)
    stopifnot(is.numeric(p), length(p) == length(x))
    
    u <- runif(n)
    cp <- cumsum(p)
    o <- sapply(u, function(r, cp){
        which.max(r <= cp)
    }, cp = cp)
    x[o]
}

x <- c(1, 2, 3)
p <- c(0.7, 0.1, 0.2)
res <- gen_dyskretne(1000, x = x, p = p)
prop.table(table(res))

gendyskr2 <- function(n, x, p){
   stopifnot(is.numeric(n), length(n)==1)
   stopifnot(is.numeric(x), length(x) > 0)
   stopifnot(is.numeric(p), length(p) > 0, length(p) == length(x))
   
   stopifnot(length(unique(x)) == length(x))
   
   suma_p <- sum(p)
   if(abs(suma_p - 1) > 1e-12){
      warning("Prawdopodobenstwa zostaly unormowane.")
      p <- p/suma_p
   }
   
   u <- runif(n)
   cumsum_p <- cumsum(p)
   m <- findInterval(u, cumsum_p, left.open = TRUE) + 1
   return(x[m])
}
